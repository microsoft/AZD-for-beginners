<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T23:41:02+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "th"
}
-->
# โซลูชันหลายตัวแทนสำหรับการค้าปลีก - การปรับใช้ ARM Template

**บทที่ 5: แพ็คเกจการปรับใช้ในสภาพแวดล้อมการผลิต**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทที่เกี่ยวข้อง**: [บทที่ 5: โซลูชัน AI หลายตัวแทน](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 คู่มือสถานการณ์**: [การดำเนินการครบถ้วน](../retail-scenario.md)
- **🎯 การปรับใช้อย่างรวดเร็ว**: [การปรับใช้ด้วยคลิกเดียว](../../../../examples/retail-multiagent-arm-template)

ไดเรกทอรีนี้ประกอบด้วย Azure Resource Manager (ARM) template ที่สมบูรณ์สำหรับการปรับใช้โซลูชันการสนับสนุนลูกค้าหลายตัวแทนในธุรกิจค้าปลีก โดยให้โครงสร้างพื้นฐานเป็นโค้ดสำหรับสถาปัตยกรรมทั้งหมด

## 🎯 สิ่งที่ถูกปรับใช้

### โครงสร้างพื้นฐานหลัก
- **Azure OpenAI Services** (หลายภูมิภาคเพื่อความพร้อมใช้งานสูง)
  - ภูมิภาคหลัก: GPT-4o สำหรับตัวแทนลูกค้า
  - ภูมิภาครอง: GPT-4o-mini สำหรับตัวแทนสินค้าคงคลัง  
  - ภูมิภาคที่สาม: โมเดลการฝังข้อความ
  - ภูมิภาคประเมินผล: โมเดล GPT-4o grader
- **Azure AI Search** พร้อมความสามารถในการค้นหาแบบเวกเตอร์
- **Azure Storage Account** พร้อม blob containers สำหรับเอกสารและการอัปโหลด
- **Azure Container Apps Environment** พร้อมการปรับขนาดอัตโนมัติ
- **Container Apps** สำหรับตัวแทน router และ frontend
- **Azure Cosmos DB** สำหรับการจัดเก็บประวัติการสนทนา
- **Azure Key Vault** สำหรับการจัดการความลับ (ตัวเลือก)
- **Application Insights** และ Log Analytics สำหรับการตรวจสอบ (ตัวเลือก)
- **Document Intelligence** สำหรับการประมวลผลเอกสาร
- **Bing Search API** สำหรับข้อมูลแบบเรียลไทม์

### โหมดการปรับใช้

| โหมด | คำอธิบาย | กรณีการใช้งาน | ทรัพยากร |
|------|-------------|----------|-----------|
| **Minimal** | การปรับใช้พื้นฐานที่ประหยัดค่าใช้จ่าย | การพัฒนา, การทดสอบ | SKUs พื้นฐาน, ภูมิภาคเดียว, ความจุลดลง |
| **Standard** | การปรับใช้ที่สมดุลสำหรับงานในสภาพแวดล้อมการผลิต | การผลิต, ขนาดปานกลาง | SKUs มาตรฐาน, หลายภูมิภาค, ความจุมาตรฐาน |
| **Premium** | การปรับใช้ที่มีประสิทธิภาพสูงระดับองค์กร | องค์กร, ขนาดใหญ่ | SKUs ระดับพรีเมียม, หลายภูมิภาค, ความจุสูง |

## 📋 ข้อกำหนดเบื้องต้น

1. **Azure CLI** ติดตั้งและกำหนดค่าแล้ว
2. **การสมัครใช้งาน Azure ที่ใช้งานอยู่** พร้อมโควตาที่เพียงพอ
3. **สิทธิ์ที่เหมาะสม** ในการสร้างทรัพยากรในการสมัครใช้งานเป้าหมาย
4. **โควตาทรัพยากร** สำหรับ:
   - Azure OpenAI (ตรวจสอบความพร้อมใช้งานในภูมิภาค)
   - Container Apps (แตกต่างกันตามภูมิภาค)
   - AI Search (แนะนำระดับมาตรฐานหรือสูงกว่า)

## 🚀 การปรับใช้อย่างรวดเร็ว

### ตัวเลือกที่ 1: ใช้ Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### ตัวเลือกที่ 2: ใช้ Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### ตัวเลือกที่ 3: ใช้ Azure CLI โดยตรง

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ ตัวเลือกการกำหนดค่า

### พารามิเตอร์ของเทมเพลต

| พารามิเตอร์ | ประเภท | ค่าเริ่มต้น | คำอธิบาย |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | คำนำหน้าสำหรับชื่อทรัพยากรทั้งหมด |
| `location` | string | ตำแหน่งของกลุ่มทรัพยากร | ภูมิภาคการปรับใช้หลัก |
| `secondaryLocation` | string | "westus2" | ภูมิภาครองสำหรับการปรับใช้หลายภูมิภาค |
| `tertiaryLocation` | string | "francecentral" | ภูมิภาคสำหรับโมเดลการฝังข้อความ |
| `environmentName` | string | "dev" | การกำหนดสภาพแวดล้อม (dev/staging/prod) |
| `deploymentMode` | string | "standard" | การกำหนดค่าการปรับใช้ (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | เปิดใช้งานการปรับใช้หลายภูมิภาค |
| `enableMonitoring` | bool | true | เปิดใช้งาน Application Insights และการบันทึก |
| `enableSecurity` | bool | true | เปิดใช้งาน Key Vault และความปลอดภัยขั้นสูง |

### การปรับแต่งพารามิเตอร์

แก้ไข `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ ภาพรวมสถาปัตยกรรม

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 การใช้งานสคริปต์การปรับใช้

สคริปต์ `deploy.sh` ให้ประสบการณ์การปรับใช้งานแบบโต้ตอบ:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### คุณสมบัติของสคริปต์

- ✅ **การตรวจสอบข้อกำหนดเบื้องต้น** (Azure CLI, สถานะการเข้าสู่ระบบ, ไฟล์เทมเพลต)
- ✅ **การจัดการกลุ่มทรัพยากร** (สร้างหากยังไม่มี)
- ✅ **การตรวจสอบเทมเพลต** ก่อนการปรับใช้
- ✅ **การติดตามความคืบหน้า** พร้อมผลลัพธ์แบบมีสี
- ✅ **การแสดงผลลัพธ์การปรับใช้**
- ✅ **คำแนะนำหลังการปรับใช้**

## 📊 การตรวจสอบการปรับใช้

### ตรวจสอบสถานะการปรับใช้

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### ผลลัพธ์การปรับใช้

หลังการปรับใช้สำเร็จ ผลลัพธ์ต่อไปนี้จะพร้อมใช้งาน:

- **Frontend URL**: จุดเชื่อมต่อสาธารณะสำหรับเว็บอินเทอร์เฟซ
- **Router URL**: จุดเชื่อมต่อ API สำหรับตัวแทน router
- **OpenAI Endpoints**: จุดเชื่อมต่อบริการ OpenAI หลักและรอง
- **Search Service**: จุดเชื่อมต่อบริการ Azure AI Search
- **Storage Account**: ชื่อบัญชีจัดเก็บสำหรับเอกสาร
- **Key Vault**: ชื่อ Key Vault (หากเปิดใช้งาน)
- **Application Insights**: ชื่อบริการตรวจสอบ (หากเปิดใช้งาน)

## 🔧 การกำหนดค่าหลังการปรับใช้

### 1. กำหนดค่าดัชนีการค้นหา

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. อัปโหลดข้อมูลเริ่มต้น

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. ทดสอบจุดเชื่อมต่อตัวแทน

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. กำหนดค่า Container Apps

ARM template จะปรับใช้ภาพคอนเทนเนอร์ตัวอย่าง เพื่อปรับใช้โค้ดตัวแทนจริง:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ การแก้ไขปัญหา

### ปัญหาทั่วไป

#### 1. โควตา Azure OpenAI เกิน

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. การปรับใช้ Container Apps ล้มเหลว

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. การเริ่มต้นบริการค้นหา

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### การตรวจสอบการปรับใช้

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 การพิจารณาด้านความปลอดภัย

### การจัดการคีย์
- ความลับทั้งหมดถูกจัดเก็บใน Azure Key Vault (เมื่อเปิดใช้งาน)
- Container apps ใช้ managed identity สำหรับการตรวจสอบสิทธิ์
- บัญชีจัดเก็บมีค่าเริ่มต้นที่ปลอดภัย (HTTPS เท่านั้น, ไม่มีการเข้าถึง blob สาธารณะ)

### ความปลอดภัยเครือข่าย
- Container apps ใช้เครือข่ายภายในเมื่อเป็นไปได้
- บริการค้นหาถูกกำหนดค่าด้วยตัวเลือก private endpoints
- Cosmos DB ถูกกำหนดค่าด้วยสิทธิ์ที่จำเป็นขั้นต่ำ

### การกำหนดค่า RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 การเพิ่มประสิทธิภาพค่าใช้จ่าย

### การประมาณค่าใช้จ่าย (รายเดือน, USD)

| โหมด | OpenAI | Container Apps | Search | Storage | รวมประมาณการ |
|------|--------|----------------|--------|---------|------------|
| Minimal | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Standard | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### การตรวจสอบค่าใช้จ่าย

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 การอัปเดตและการบำรุงรักษา

### การอัปเดตเทมเพลต
- ควบคุมเวอร์ชันไฟล์ ARM template
- ทดสอบการเปลี่ยนแปลงในสภาพแวดล้อมการพัฒนาก่อน
- ใช้โหมดการปรับใช้อินเครเมนทัลสำหรับการอัปเดต

### การอัปเดตทรัพยากร
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### การสำรองข้อมูลและการกู้คืน
- เปิดใช้งานการสำรองข้อมูลอัตโนมัติสำหรับ Cosmos DB
- เปิดใช้งานการลบแบบนุ่มสำหรับ Key Vault
- รักษาการแก้ไข Container app สำหรับการย้อนกลับ

## 📞 การสนับสนุน

- **ปัญหาเกี่ยวกับเทมเพลต**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **การสนับสนุน Azure**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **ชุมชน**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ พร้อมที่จะปรับใช้โซลูชันหลายตัวแทนของคุณแล้วหรือยัง?**

เริ่มต้นด้วย: `./deploy.sh -g myResourceGroup`

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้