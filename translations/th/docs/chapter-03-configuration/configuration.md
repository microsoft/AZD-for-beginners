# คู่มือการตั้งค่า

**เมนูนำทางบทเรียน:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทเรียนปัจจุบัน**: บทที่ 3 - การตั้งค่า & การตรวจสอบสิทธิ์
- **⬅️ ก่อนหน้า**: [โปรเจกต์แรกของคุณ](../chapter-01-foundation/first-project.md)
- **➡️ ถัดไป**: [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 บทถัดไป**: [บทที่ 4: โครงสร้างพื้นฐานในรูปแบบโค้ด](../chapter-04-infrastructure/deployment-guide.md)

## บทนำ

> ตรวจสอบกับ `azd 1.37.2` (พฤศจิกายน 2026) คำสั่ง Bash สมมติโปรเจกต์ azd ที่ถูกเริ่มต้นแล้ว เว้นแต่จะระบุไว้อย่างชัดเจนว่าเป็นไฟล์สมบูรณ์ การนำเสนอ YAML/Bicep เป็นเพียงชิ้นส่วนสำหรับผสานเข้ากับไฟล์โปรเจกต์ที่ตรงกัน ไม่ใช่โปรเจกต์ที่รันโดยตรง

คู่มือครอบคลุมนี้อธิบายทุกแง่มุมของการตั้งค่า Azure Developer CLI เพื่อการพัฒนาและกระบวนการปรับใช้ที่ดีที่สุด คุณจะได้เรียนรู้เกี่ยวกับลำดับชั้นการตั้งค่า การจัดการสภาพแวดล้อม วิธีการตรวจสอบสิทธิ์ และรูปแบบการตั้งค่าขั้นสูงที่ช่วยให้การปรับใช้ Azure มีประสิทธิภาพและปลอดภัย

## เป้าหมายการเรียนรู้

เมื่อจบบทเรียนนี้ คุณจะสามารถ:
- ชำนาญลำดับชั้นการตั้งค่า azd และเข้าใจวิธีจัดลำดับความสำคัญของการตั้งค่า
- ตั้งค่าการตั้งค่าแบบ global และโปรเจกต์เฉพาะอย่างมีประสิทธิภาพ
- จัดการหลายสภาพแวดล้อมที่มีการตั้งค่าต่างกัน
- ดำเนินการนำรูปแบบการตรวจสอบและอนุญาตแบบปลอดภัยมาใช้
- เข้าใจรูปแบบการตั้งค่าขั้นสูงสำหรับสถานการณ์ซับซ้อน

## ผลลัพธ์การเรียนรู้

หลังจากจบบทเรียนนี้ คุณจะสามารถ:
- ตั้งค่า azd สำหรับกระบวนการพัฒนาที่ดีที่สุด
- ตั้งค่าจัดการหลายสภาพแวดล้อมสำหรับการปรับใช้
- นำแนวทางปฏิบัติเกี่ยวกับการจัดการการตั้งค่าอย่างปลอดภัยมาใช้
- แก้ไขปัญหาที่เกี่ยวกับการตั้งค่าได้
- ปรับแต่งพฤติกรรม azd ให้เหมาะสมกับความต้องการเฉพาะขององค์กร

คู่มือครอบคลุมนี้อธิบายทุกแง่มุมของการตั้งค่า Azure Developer CLI เพื่อการพัฒนาและกระบวนการปรับใช้ที่ดีที่สุด

## ทำความเข้าใจตัวแทน AI ในโปรเจกต์ azd

หากคุณยังใหม่กับตัวแทน AI นี่คือวิธีง่ายๆ ในการคิดเกี่ยวกับพวกมันในโลกของ azd

### ตัวแทนคืออะไร?

ตัวแทนคือซอฟต์แวร์ที่รับคำขอ วิเคราะห์ และดำเนินการ—บ่อยครั้งโดยการเรียกใช้โมเดล AI ค้นหาข้อมูล หรือเรียกใช้บริการอื่น ในโปรเจกต์ azd ตัวแทนถือเป็น **บริการ** ชนิดหนึ่งเคียงข้างกับเว็บ frontend หรือ API backend ของคุณ

### ตัวแทนอยู่ในโครงสร้างโปรเจกต์ azd อย่างไร

โปรเจกต์ azd ประกอบด้วยสามชั้น: **โครงสร้างพื้นฐาน**, **โค้ด**, และ **การตั้งค่า** ตัวแทนเชื่อมต่อกับแต่ละชั้นในแบบเดียวกับบริการอื่น:

| ชั้น | ทำอะไรในแอปแบบดั้งเดิม | ทำอะไรในตัวแทน |
|-------|-------------------------------|-------------------------------|
| **โครงสร้างพื้นฐาน** (`infra/`) | กำหนดค่าเว็บแอปและฐานข้อมูล | กำหนดจุดสิ้นสุดโมเดล AI, ดัชนีการค้นหา หรือโฮสต์ตัวแทน |
| **โค้ด** (`src/`) | ประกอบด้วยโค้ด frontend และ API ของคุณ | ประกอบด้วยตรรกะตัวแทนและคำสั่ง prompt |
| **การตั้งค่า** (`azure.yaml`) | ระบุรายชื่อบริการและเป้าหมายโฮสต์ของพวกเขา | ระบุตัวแทนของคุณเป็นบริการชี้ไปยังโค้ดและโฮสต์ |

### บทบาทของ `azure.yaml`

คุณไม่ต้องจำไวยากรณ์ตอนนี้ ในเชิงแนวคิด `azure.yaml` คือไฟล์ที่บอก azd ว่า: *"นี่คือบริการที่ประกอบเป็นแอปของฉัน และนี่คือที่ตั้งโค้ดของพวกเขา"*

เมื่อโปรเจกต์ของคุณมีตัวแทน AI `azure.yaml` เพียงแค่ระบุว่าตัวแทนนั้นเป็นหนึ่งในบริการ azd ก็จะทราบว่าต้องกำหนดโครงสร้างพื้นฐานใด (เช่น จุดสิ้นสุดโมเดล Microsoft Foundry หรือ Container App เพื่อโฮสต์ตัวแทน) และปรับใช้โค้ดตัวแทนของคุณ—เหมือนกับกรณีเว็บแอปหรือ API

นั่นหมายความว่าไม่มีอะไรใหม่ที่ต้องเรียนรู้โดยพื้นฐาน หากคุณเข้าใจวิธี azd จัดการเว็บเซอร์วิส คุณก็เข้าใจวิธีจัดการตัวแทนแล้ว

## ลำดับชั้นการตั้งค่า

azd มีชั้นการตั้งค่าที่แยกจากกัน ไม่ใช่แค่เลเยอร์ซ้อนแบบสากล:
- **การตั้งค่าผู้ใช้ทั่วโลก**: `~/.azd/config.json` จัดการโดย `azd config`
- **นิยามโปรเจกต์**: `azure.yaml` ระบุบริการ โครงสร้างพื้นฐาน และฮุค
- **การเลือกสภาพแวดล้อมท้องถิ่น**: `.azure/config.json`
- **ค่าต่อสภาพแวดล้อม**: `.azure/<name>/.env` จัดการโดย `azd env`; การตั้งค่าเพิ่มเติมอยู่ใน `config.json` ของสภาพแวดล้อมนั้น
- **แฟลกและตัวแปรกระบวนการ**: เข้าควบคุมเฉพาะการตั้งค่าที่คำสั่ง/โปรไวเดอร์รองรับ

ค่า `azd env set` แปลงเป็นพารามิเตอร์โครงสร้างพื้นฐานหรือการตั้งค่าแอปพลิเคชันที่ปรับใช้ไม่ได้โดยอัตโนมัติ ต้องอ้างอิงอย่างชัดเจนในไฟล์พารามิเตอร์ การตั้งค่าบริการที่รองรับ หรือฮุค

## การตั้งค่าทั่วโลก

### การตั้งค่าค่าดีฟอลต์ทั่วโลก
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

### การตั้งค่าทั่วโลกที่พบบ่อย
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

## 🏗️ การตั้งค่าโปรเจกต์

### โครงสร้างไฟล์ azure.yaml
ไฟล์ `azure.yaml` คือหัวใจของโปรเจกต์ azd ของคุณ:

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

นี่คือ **ตัวอย่างนิยามโปรเจกต์** ไม่ใช่ตัวเริ่มต้นที่ให้มา สร้างโฟลเดอร์ซอร์ส ฮุคสคริปต์ สคริปต์แพ็กเกจ และ `infra/main.bicep`/`main.parameters.json` ที่ตรงกันก่อนรัน ไดเรกทอรีฐานข้อมูลอยู่ในโครงสร้างพื้นฐาน; `postgres` ไม่ใช่โฮสต์บริการในตัว พารามิเตอร์โครงสร้างพื้นฐานใส่ในไฟล์พารามิเตอร์ของโปรไวเดอร์ ไม่ใช่ใน `infra.parameters`

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

#### ฮุคการสร้างเฉพาะภาษา

ชิ้นส่วนบริการต่อไปนี้แสดงตัวอย่างฮุค; รวมพวกมันกับ `project` และ `host` ของบริการที่แท้จริง `buildCommand` และ `startCommand` ไม่ใช่คุณสมบัติทั่วไปของบริการ azd กำหนดการเริ่มต้นในแอปพลิเคชัน, Dockerfile หรือโครงสร้างพื้นฐานโฮสต์

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
ค่าหลักของสภาพแวดล้อมอยู่ที่ `.azure/<env-name>/.env` รวมถึง `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` และ `AZURE_LOCATION` ใช้ `azd env config get/set` สำหรับการตั้งค่า JSON เพิ่มเติมของสภาพแวดล้อม JSON ต่อไปนี้คือ **สถานะแอปพลิเคชันเชิงแนวคิด** ไม่ใช่สคีมาคอนฟิก azd; อย่าคัดลอกเข้าไปในไฟล์ azd:

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

**สาธิตแบบข้อความล้วนเท่านั้น** ค่าธรรมดาของ `azd env set` จะถูกเขียนลงใน `.azure/<name>/.env` และสามารถพิมพ์ได้โดยคำสั่งอ่าน อย่าใช้คีย์ API ตัวอย่างเป็นข้อมูลรับรองจริง สำหรับความลับใช้ `azd env set-secret` และการเชื่อมต่ออย่างชัดเจนในเวลารัน

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

### เทมเพลตสภาพแวดล้อม
สร้าง **ไฟล์ที่ไม่ลับและดูแลด้วยตนเอง** `.env.example` ที่โฟลเดอร์รากของโครงการเพื่อการตั้งค่าที่สอดคล้องกัน azd จะไม่โหลดไฟล์ที่ชื่อ `env.template` โดยอัตโนมัติ:
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

### การแชร์สภาพแวดล้อมระหว่างทีม

เมื่อมีมากกว่าหนึ่งคนทำงานร่วมกันในโปรเจกต์ คุณต้องตกลงกันว่า **อะไรที่ควรไปกับรีโพ และอะไรที่ควรเก็บไว้ที่เครื่องท้องถิ่น** azd จะเก็บแต่ละสภาพแวดล้อมไว้ใต้โฟลเดอร์ `.azure/` และไม่ใช่ทั้งหมดที่จะถูกคอมมิต

**สิ่งที่อยู่ใน `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**ควร gitignore อะไรบ้าง** ค่าเริ่มต้นของ azd `.gitignore` ได้ยกเว้น `.azure/` ไว้อยู่แล้ว ให้เก็บไว้แบบนั้น—ไฟล์ `.env` อาจมีข้อมูลลับ และ ID ของทรัพยากรนั้นเจาะจงกับผู้ที่จัดสรรไว้ เพื่อนร่วมทีมแต่ละคนจะสร้าง **สภาพแวดล้อมของตัวเอง** ในเครื่องของตน:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**สลับไปมาระหว่างสภาพแวดล้อม** นักพัฒนาที่ดูแลหลายสภาพแวดล้อมจะเลือกสภาพแวดล้อมที่ใช้งานก่อนรันคำสั่ง:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**การให้ค่าเริ่มต้นที่ไม่ลับกับทีม** คอมมิต `.env.example` นอกไดเรกทอรี `.azure/` ที่ถูก ignore เพื่อนร่วมทีมใหม่ก็จะคัดลอกไปเป็นไฟล์ ignore ในเครื่องของตน เติมค่า และนำเข้าอย่างชัดเจนด้วย `azd env set --file <local-file>` อย่านำเข้าตัวแทนเปล่าที่ว่างเปล่าทับสภาพแวดล้อมที่ทำงานแล้ว

**สภาพแวดล้อมใน CI/CD** Pipeline จะไม่อ่านโฟลเดอร์ `.azure/` ในเครื่องคุณ ให้ส่งค่าของสภาพแวดล้อมเป็นตัวแปร/ความลับใน pipeline แทน และ azd จะอ่านค่าจาก process environment:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **กฎง่าย ๆ:** โค้ดโครงสร้างพื้นฐาน (`infra/`, `azure.yaml`) แชร์ใน Git; *สถานะและความลับของสภาพแวดล้อม* (`.azure/`) เป็นของแต่ละนักพัฒนาและแต่ละ pipeline `azd pipeline config` จะตั้งค่าตัวแปร pipeline ให้คุณโดยอัตโนมัติ

## 🔐 การกำหนดค่าการตรวจสอบสิทธิ์

### การเชื่อมต่อ Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### การตรวจสอบสิทธิ์ด้วย Service Principal
สำหรับ pipeline CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Managed Identity
สำหรับสภาพแวดล้อมที่โฮสต์บน Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ การกำหนดค่าโครงสร้างพื้นฐาน

### พารามิเตอร์ Bicep
กำหนดพารามิเตอร์โครงสร้างพื้นฐานใน `infra/main.parameters.json`:
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
สำหรับโปรเจกต์ Terraform azd จะแทนที่ตัวแทนใน `infra/main.tfvars.json` ชื่อพวกนี้ต้องตรงกับตัวแปรนำเข้าที่ประกาศใน Terraform:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 การกำหนดค่าการปรับใช้

### การกำหนดค่าการสร้าง
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

### การกำหนดค่า Docker
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
เส้นทางสัมพันธ์กับโปรเจกต์บริการ Dockerfile ต้องประกาศค่าของ `ARG` ที่ใช้งาน สำหรับการสร้างแบบหลายขั้นตอน ให้นำขั้นตอน deploy มาไว้ท้ายสุด หรือตั้งค่ากระบวนการบรรจุแบบกำหนดเอง; `docker.target` ไม่ใช่คุณสมบัติที่รองรับในสคีมาแบบตรวจสอบนี้

## 🔧 การกำหนดค่าขั้นสูง

### การตั้งชื่อทรัพยากรแบบกำหนดเอง
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

กำหนดชื่อทรัพยากรจริงใน Bicep/Terraform และรักษาการสร้างกลุ่มทรัพยากรให้สอดคล้องกับการตั้งค่านี้ ไม่มีคีย์การกำหนดค่า `naming.storageAccount` หรือ `naming.keyVault` แบบทั่วไป

### การกำหนดค่าเครือข่าย
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

รวม **รายการพารามิเตอร์ตัวอย่าง** เหล่านี้เข้ากับ `infra/main.parameters.json` ภายใต้ `parameters` และประกาศพร้อมใช้งานพารามิเตอร์ที่ตรงกันใน Bicep ซึ่งมันจะไม่มีผลอะไรเมื่อทำงานคนเดียว

### การกำหนดค่าการตรวจสอบ
จัดเตรียม Application Insights และ Log Analytics ใน Bicep/Terraform และกำหนดค่า telemetry แอปพลิเคชันใน SDK ของคุณ ไม่มีบล็อก `monitoring` ระดับบนสุดแบบทั่วไปใน `azure.yaml` ที่สร้างทรัพยากรเหล่านี้ ดูที่ [monitoring infrastructure](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 การกำหนดค่าสำหรับแต่ละสภาพแวดล้อม

### สภาพแวดล้อมสำหรับการพัฒนา
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### สภาพแวดล้อมสำหรับการทดสอบ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### สภาพแวดล้อมสำหรับการผลิต
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 การตรวจสอบการกำหนดค่า

### ตรวจสอบการกำหนดค่า
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### สคริปต์สำหรับการกำหนดค่า
สร้างสคริปต์ตรวจสอบใน `scripts/`:

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

## 🎓 แนวทางปฏิบัติที่ดีที่สุด

### 1. ใช้ตัวแปรสภาพแวดล้อม
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

หลีกเลี่ยงการเขียนค่าที่มีความสำคัญแบบฝังในโค้ด (แยกการกำหนดค่าตัวอย่างต่างหาก ไม่ใช่คีย์ `database` ที่สองในไฟล์เดียวกัน):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. จัดระเบียบไฟล์การกำหนดค่า
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

### 3. ข้อควรพิจารณาเรื่องการควบคุมเวอร์ชัน
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. เอกสารการกำหนดค่า
บันทึกการกำหนดค่าของคุณใน `CONFIG.md`:
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

## 🎯 แบบฝึกหัดปฏิบัติจริง

### แบบฝึกหัด 1: การกำหนดค่าหลายสภาพแวดล้อม (15 นาที)

**เป้าหมาย**: สร้างและกำหนดค่าสภาพแวดล้อมท้องถิ่นสามสภาพแวดล้อมที่มีค่าต่างกัน เริ่มต้นในโครงการที่ถูกเริ่มต้นแล้ว; ใช้ชื่อที่ยังไม่ถูกใช้หากมีชื่อเหล่านี้อยู่แล้ว ค่าเฉพาะสำหรับแอปพลิเคชันเหล่านี้จะไม่เปลี่ยนแปลงการตั้งค่าเทเลเมทรี/เวลารันจนกว่าเทมเพลตของคุณจะใช้งานมัน

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

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างสภาพแวดล้อมสามสภาพแวดล้อมได้สำเร็จ
- [ ] แต่ละสภาพแวดล้อมมีการกำหนดค่าที่ไม่ซ้ำกัน
- [ ] สามารถสลับระหว่างสภาพแวดล้อมได้โดยไม่มีข้อผิดพลาด
- [ ] `azd env list` แสดงสภาพแวดล้อมทั้งสามทั้งหมด

### แบบฝึกหัด 2: การอ้างอิงความลับ Key Vault (10-20 นาที)

**เป้าหมาย**: เก็บการอ้างอิง Key Vault แทนการเก็บข้อความธรรมดา **จุดเริ่มต้น:** สภาพแวดล้อมที่เริ่มต้นแล้ว, ลงชื่อเข้าใช้ Azure, และการเข้าถึง Key Vault พร้อมสิทธิ์ในการสร้าง/อ่านความลับตัวอย่าง การดำเนินการกับ Vault อาจมีค่าใช้จ่าย

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

**เกณฑ์ความสำเร็จ:**
- [ ] คำสั่งแบบโต้ตอบรายงาน Vault และการอ้างอิงความลับที่เลือก
- [ ] `.env` ในเครื่องมีการอ้างอิงแทนความลับตัวอย่าง
- [ ] อธิบายได้ว่า runtime identity/RBAC และ consumption ยังต้องถูกกำหนดค่า

**ปัญหาทั่วไป:** 403 ต้องการบทบาท data-plane ใน vault ที่ถูกต้องและเวลาการเผยแพร่; `azd env set ... --secret` ไม่ใช่คำสั่งที่ถูกต้อง ผลลัพธ์ปกติของ `get-values`/`get-value` ไม่ควรถูกสมมติว่าถูกลบข้อมูลออก ใช้ `azd env unset TRAINING_API_KEY` เพื่อลบการอ้างอิงการฝึกอบรม; ซึ่งจะไม่ลบความลับใน vault ซึ่งคุณต้องลบแยกต่างหากหากคุณสร้างมันขึ้นมา

## ขั้นตอนถัดไป

- [Your First Project](../chapter-01-foundation/first-project.md) - นำการกำหนดค่าไปใช้ในทางปฏิบัติ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ใช้การกำหนดค่าสำหรับการปรับใช้
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - การกำหนดค่าสำหรับใช้งานจริง

## เอกสารอ้างอิง

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Environment Variables](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 3 - การกำหนดค่า & การพิสูจน์ตัวตน
- **⬅️ ก่อนหน้า**: [โปรเจกต์แรกของคุณ](../chapter-01-foundation/first-project.md)
- **➡️ บทถัดไป**: [บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ด](../chapter-04-infrastructure/deployment-guide.md)
- **บทเรียนถัดไป**: [การพิสูจน์ตัวตน & ความปลอดภัย](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->