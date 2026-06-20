# AI Workshop Lab: ทำให้โซลูชัน AI ของคุณสามารถปรับใช้ด้วย AZD ได้

**การนำทางบทเรียน:**
- **📚 หน้าแรกหลักสูตร**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาแบบ AI-First
- **⬅️ ก่อนหน้า**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **➡️ ถัดไป**: [แนวปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต](production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

## ภาพรวมของ Workshop

แลปนี้ให้คำแนะนำแบบปฏิบัติแก่ผู้พัฒนาผ่านกระบวนการการนำแม่แบบ AI ที่มีอยู่แล้วมาใช้และปรับใช้โดยใช้ Azure Developer CLI (AZD) คุณจะได้เรียนรู้รูปแบบสำคัญสำหรับการปรับใช้ AI ในการผลิตโดยใช้บริการ Microsoft Foundry

> **หมายเหตุการตรวจสอบ (2026-03-25):** แลปนี้ได้รับการตรวจสอบกับ `azd` เวอร์ชัน `1.23.12` หากการติดตั้งในเครื่องของคุณเก่ากว่านี้ กรุณาอัปเดต AZD ก่อนเริ่มเพื่อให้กระบวนการการยืนยันตัวตน แม่แบบ และการปรับใช้สอดคล้องกับขั้นตอนด้านล่าง

**ระยะเวลา:** 2-3 ชั่วโมง  
**ระดับ:** ปานกลาง  
**ความรู้พื้นฐานที่ต้องมี:** ความรู้พื้นฐานเกี่ยวกับ Azure, ความคุ้นเคยกับแนวคิด AI/ML

## 🎓 วัตถุประสงค์การเรียนรู้

หลังจากจบ workshop นี้ คุณจะสามารถ:
- ✅ แปลงแอปพลิเคชัน AI ที่มีอยู่เพื่อใช้แม่แบบ AZD
- ✅ กำหนดค่าบริการ Microsoft Foundry ด้วย AZD
- ✅ นำการจัดการข้อมูลรับรองที่ปลอดภัยมาใช้สำหรับบริการ AI
- ✅ ปรับใช้แอป AI ที่พร้อมใช้ในกระบวนการผลิตพร้อมการตรวจสอบ
- ✅ แก้ไขปัญหาทั่วไปในการปรับใช้ AI

## ข้อกำหนดล่วงหน้า

### เครื่องมือที่ต้องใช้
- ติดตั้ง [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- ติดตั้ง [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- ติดตั้ง [Git](https://git-scm.com/)
- โปรแกรมแก้ไขโค้ด (แนะนำ VS Code)

### ทรัพยากร Azure
- การสมัครใช้งาน Azure พร้อมสิทธิ์ผู้ร่วมพัฒนา (contributor)
- การเข้าถึงบริการ Microsoft Foundry Models (หรือความสามารถในการร้องขอเข้าถึง)
- สิทธิ์สร้างกลุ่มทรัพยากร

### ความรู้พื้นฐานที่ต้องมี
- ความเข้าใจพื้นฐานเกี่ยวกับบริการ Azure
- ความคุ้นเคยกับอินเทอร์เฟซคำสั่ง
- แนวคิดพื้นฐานเกี่ยวกับ AI/ML (API, โมเดล, prompt)

## การตั้งค่าแลป

### ขั้นตอนที่ 1: เตรียมสภาพแวดล้อม

1. **ตรวจสอบการติดตั้งเครื่องมือ:**
```bash
# ตรวจสอบการติดตั้ง AZD
azd version

# ตรวจสอบ Azure CLI
az --version

# เข้าสู่ระบบ Azure สำหรับเวิร์กโฟลว์ AZD
azd auth login

# เข้าสู่ระบบ Azure CLI เฉพาะหากคุณวางแผนที่จะเรียกใช้คำสั่ง az ในระหว่างการวินิจฉัย
az login
```

หากคุณทำงานข้ามหลาย tenant หรือการสมัครใช้งานของคุณไม่ถูกตรวจพบโดยอัตโนมัติ ให้ลองอีกครั้งด้วยคำสั่ง `azd auth login --tenant-id <tenant-id>`

2. **โคลน repository ของ workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## โมดูล 1: ทำความเข้าใจโครงสร้าง AZD สำหรับแอป AI

### โครงสร้างของแม่แบบ AI AZD

สำรวจไฟล์สำคัญในแม่แบบ AZD ที่เตรียมพร้อมสำหรับ AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **แบบฝึกหัดแลป 1.1: สำรวจการกำหนดค่า**

1. **ตรวจสอบไฟล์ azure.yaml:**
```bash
cat azure.yaml
```

**สิ่งที่ควรสังเกต:**
- นิยามบริการสำหรับองค์ประกอบ AI
- การแมปตัวแปรสภาพแวดล้อม
- การกำหนดโฮสต์

2. **ทบทวน main.bicep โครงสร้างพื้นฐาน:**
```bash
cat infra/main.bicep
```

**รูปแบบ AI สำคัญที่ควรสังเกต:**
- การจัดเตรียมบริการ Microsoft Foundry Models
- การรวม Azure AI Search
- การจัดการคีย์อย่างปลอดภัย
- การกำหนดค่าความปลอดภัยของเครือข่าย

### **หัวข้ออภิปราย:** ทำไมรูปแบบเหล่านี้จึงสำคัญสำหรับ AI

- **การพึ่งพาบริการ**: แอป AI มักต้องใช้บริการหลายตัวที่ต้องประสานงานกัน
- **ความปลอดภัย**: คีย์ API และจุดปลายทางต้องจัดการอย่างปลอดภัย
- **การปรับขนาด**: งาน AI มีข้อกำหนดการปรับขนาดเฉพาะ
- **การจัดการค่าใช้จ่าย**: บริการ AI อาจมีค่าใช้จ่ายสูงถ้าไม่กำหนดค่าอย่างเหมาะสม

## โมดูล 2: ปรับใช้แอป AI ตัวแรกของคุณ

### ขั้นตอน 2.1: เริ่มต้นสภาพแวดล้อม

1. **สร้างสภาพแวดล้อม AZD ใหม่:**
```bash
azd env new myai-workshop
```

2. **ตั้งค่าพารามิเตอร์ที่จำเป็น:**
```bash
# ตั้งค่าภูมิภาค Azure ที่คุณต้องการ
azd env set AZURE_LOCATION eastus

# ตัวเลือก: ตั้งค่าโมเดล OpenAI เฉพาะเจาะจง
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### ขั้นตอน 2.2: ปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน

1. **ปรับใช้ด้วย AZD:**
```bash
azd up
```

**สิ่งที่จะเกิดขึ้นระหว่าง `azd up`:**
- ✅ จัดเตรียมบริการ Microsoft Foundry Models
- ✅ สร้างบริการ Azure AI Search
- ✅ ตั้งค่า App Service สำหรับเว็บแอปพลิเคชัน
- ✅ กำหนดค่าความปลอดภัยและเครือข่าย
- ✅ ปรับใช้โค้ดแอปพลิเคชัน
- ✅ ตั้งค่าการตรวจสอบและบันทึกข้อมูล

2. **ติดตามความคืบหน้าการปรับใช้** และบันทึกทรัพยากรที่ถูกสร้าง

### ขั้นตอน 2.3: ตรวจสอบการปรับใช้ของคุณ

1. **ตรวจสอบทรัพยากรที่ปรับใช้:**
```bash
azd show
```

2. **เปิดแอปพลิเคชันที่ปรับใช้:**
```bash
azd show
```

เปิดจุดเชื่อมต่อเว็บที่แสดงในผลลัพธ์ `azd show`

3. **ทดสอบฟังก์ชัน AI:**
   - ไปที่เว็บแอปพลิเคชัน
   - ลองคำถามตัวอย่าง
   - ตรวจสอบว่าการตอบสนอง AI ทำงานถูกต้อง

### **แบบฝึกหัดแลป 2.1: ฝึกแก้ไขปัญหา**

**สถานการณ์:** การปรับใช้ของคุณสำเร็จ แต่ AI ไม่ตอบสนอง

**ปัญหาทั่วไปที่ควรตรวจสอบ:**
1. **คีย์ API ของ OpenAI**: ตรวจสอบว่าตั้งค่าอย่างถูกต้อง
2. **ความพร้อมใช้งานของโมเดล**: ตรวจสอบว่าภูมิภาคของคุณรองรับโมเดลไหม
3. **การเชื่อมต่อเครือข่าย**: ตรวจสอบให้แน่ใจว่าสามารถสื่อสารกับบริการได้
4. **สิทธิ์ RBAC**: ตรวจสอบว่าแอปสามารถเข้าถึง OpenAI ได้

**คำสั่งดีบัก:**
```bash
# ตรวจสอบตัวแปรแวดล้อม
azd env get-values

# ดูบันทึกการปรับใช้
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# ตรวจสอบสถานะการปรับใช้ OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## โมดูล 3: ปรับแต่งแอป AI ให้ตรงกับความต้องการของคุณ

### ขั้นตอน 3.1: แก้ไขการกำหนดค่า AI

1. **อัปเดตโมเดล OpenAI:**
```bash
# เปลี่ยนเป็นโมเดลอื่น (ถ้ามีในพื้นที่ของคุณ)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ติดตั้งใหม่ด้วยการกำหนดค่าที่ปรับปรุงใหม่
azd deploy
```

2. **เพิ่มบริการ AI เพิ่มเติม:**

แก้ไข `infra/main.bicep` เพื่อเพิ่ม Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### ขั้นตอน 3.2: การกำหนดค่าสภาพแวดล้อมเฉพาะ

**แนวทางที่ดีที่สุด**: กำหนดค่าที่แตกต่างกันสำหรับสภาพแวดล้อมการพัฒนาและการผลิต

1. **สร้างสภาพแวดล้อมการผลิต:**
```bash
azd env new myai-production
```

2. **ตั้งค่าพารามิเตอร์เฉพาะสำหรับการผลิต:**
```bash
# การผลิตโดยปกติจะใช้ SKU ที่สูงกว่า
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# เปิดใช้งานคุณสมบัติความปลอดภัยเพิ่มเติม
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **แบบฝึกหัดแลป 3.1: การเพิ่มประสิทธิภาพค่าใช้จ่าย**

**ความท้าทาย:** กำหนดค่าแม่แบบเพื่อการพัฒนาที่คุ้มค่าประหยัด

**งานที่ต้องทำ:**
1. ระบุ SKU ใดบ้างที่สามารถตั้งเป็นระดับฟรี/พื้นฐานได้
2. กำหนดค่าตัวแปรสภาพแวดล้อมเพื่อลดค่าใช้จ่ายให้น้อยที่สุด
3. ปรับใช้และเปรียบเทียบค่าใช้จ่ายกับการกำหนดค่าผลิต

**เคล็ดลับคำตอบ:**
- ใช้ระดับ F0 (ฟรี) สำหรับบริการ Azure AI เมื่อเป็นไปได้
- ใช้ระดับ Basic สำหรับบริการค้นหาในสภาพแวดล้อมพัฒนา
- พิจารณาใช้แผน Consumption สำหรับ Functions

## โมดูล 4: ความปลอดภัยและแนวทางปฏิบัติที่ดีที่สุดสำหรับการผลิต

### ขั้นตอน 4.1: การจัดการข้อมูลรับรองอย่างปลอดภัย

**ความท้าทายในปัจจุบัน:** แอป AI หลายตัวใส่คีย์ API ลงในโค้ดหรือจัดเก็บในรูปแบบที่ไม่ปลอดภัย

**ทางแก้ของ AZD:** การรวม Managed Identity + Key Vault

1. **ทบทวนการกำหนดค่าความปลอดภัยในแม่แบบของคุณ:**
```bash
# ค้นหาการกำหนดค่า Key Vault และ Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **ยืนยันว่า Managed Identity ทำงาน:**
```bash
# ตรวจสอบว่าเว็บแอปมีการกำหนดค่าบัตรประจำตัวถูกต้องหรือไม่
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ขั้นตอน 4.2: ความปลอดภัยเครือข่าย

1. **เปิดใช้งาน private endpoints** (ถ้ายังไม่ได้กำหนดค่า):

เพิ่มในแม่แบบ bicep ของคุณ:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### ขั้นตอน 4.3: การตรวจสอบและการสังเกตการณ์

1. **กำหนดค่า Application Insights:**
```bash
# ควรตั้งค่า Application Insights โดยอัตโนมัติ
# ตรวจสอบการตั้งค่า:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **ตั้งค่าการตรวจสอบเฉพาะ AI:**

เพิ่มเมตริกที่กำหนดเองสำหรับการทำงาน AI:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **แบบฝึกหัดแลป 4.1: การตรวจสอบความปลอดภัย**

**งาน:** ตรวจสอบการปรับใช้ของคุณตามแนวทางปฏิบัติความปลอดภัย

**รายการตรวจสอบ:**
- [ ] ไม่มีความลับฝังในโค้ดหรือการกำหนดค่า
- [ ] ใช้ Managed Identity สำหรับการยืนยันตัวตนระหว่างบริการ
- [ ] ใช้ Key Vault ในการเก็บการตั้งค่าที่ละเอียดอ่อน
- [ ] จำกัดการเข้าถึงเครือข่ายอย่างเหมาะสม
- [ ] เปิดใช้งานการตรวจสอบและบันทึกข้อมูล

## โมดูล 5: การแปลงแอป AI ของคุณเอง

### ขั้นตอน 5.1: แบบประเมิน

**ก่อนแปลงแอปของคุณ** โปรดตอบคำถามเหล่านี้:

1. **สถาปัตยกรรมแอปพลิเคชัน:**
   - แอปของคุณใช้บริการ AI ใดบ้าง?
   - ต้องการทรัพยากรการประมวลผลแบบใด?
   - ต้องการฐานข้อมูลหรือไม่?
   - มีการพึ่งพาระหว่างบริการอย่างไร?

2. **ข้อกำหนดความปลอดภัย:**
   - ข้อมูลที่ละเอียดอ่อนไหนที่แอปของคุณจัดการ?
   - มีข้อกำหนดการปฏิบัติตามกฎระเบียบอย่างไรบ้าง?
   - ต้องการเครือข่ายส่วนตัวหรือไม่?

3. **ข้อกำหนดการปรับขนาด:**
   - โหลดที่คาดว่าจะเกิดขึ้นเป็นเท่าไร?
   - ต้องการการปรับขนาดอัตโนมัติหรือไม่?
   - มีข้อกำหนดเฉพาะเรื่องภูมิภาคหรือไม่?

### ขั้นตอน 5.2: สร้างแม่แบบ AZD ของคุณ

**ทำตามรูปแบบนี้เพื่อแปลงแอปของคุณ:**

1. **สร้างโครงสร้างพื้นฐานเบื้องต้น:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# เริ่มต้นแม่แบบ AZD
azd init --template minimal
```

2. **สร้างไฟล์ azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **สร้างแม่แบบโครงสร้างพื้นฐาน:**

**infra/main.bicep** - แม่แบบหลัก:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - โมดูล OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **แบบฝึกหัดแลป 5.1: ความท้าทายการสร้างแม่แบบ**

**ความท้าทาย:** สร้างแม่แบบ AZD สำหรับแอป AI ประมวลผลเอกสาร

**ข้อกำหนด:**
- Microsoft Foundry Models สำหรับการวิเคราะห์เนื้อหา
- Document Intelligence สำหรับ OCR
- Storage Account สำหรับการอัปโหลดเอกสาร
- Function App สำหรับตรรกะการประมวลผล
- เว็บแอปสำหรับส่วนติดต่อผู้ใช้

**คะแนนโบนัส:**
- เพิ่มการจัดการข้อผิดพลาดอย่างเหมาะสม
- รวมการประเมินค่าใช้จ่าย
- ตั้งค่าดashboard การตรวจสอบ

## โมดูล 6: การแก้ไขปัญหาทั่วไป

### ปัญหาการปรับใช้ที่พบได้บ่อย

#### ปัญหา 1: โควตาของบริการ OpenAI เกิน
**อาการ:** การปรับใช้ล้มเหลวพร้อมข้อผิดพลาดโควต้า
**วิธีแก้:**
```bash
# ตรวจสอบโควตาปัจจุบัน
az cognitiveservices usage list --location eastus

# ขอเพิ่มโควตาหรือลองภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up
```

#### ปัญหา 2: โมเดลไม่พร้อมใช้งานในภูมิภาค
**อาการ:** การตอบสนอง AI ล้มเหลว หรือเกิดข้อผิดพลาดการปรับใช้โมเดล
**วิธีแก้:**
```bash
# ตรวจสอบความพร้อมของรุ่นตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเป็นรุ่นที่พร้อมใช้งาน
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### ปัญหา 3: ปัญหาสิทธิ์
**อาการ:** ข้อผิดพลาด 403 Forbidden เมื่อเรียกใช้บริการ AI
**วิธีแก้:**
```bash
# ตรวจสอบการมอบหมายบทบาท
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# เพิ่มบทบาทที่ขาดหายไป
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ปัญหาด้านประสิทธิภาพ

#### ปัญหา 4: การตอบสนอง AI ช้า
**ขั้นตอนตรวจสอบ:**
1. ตรวจสอบ Application Insights สำหรับเมตริกประสิทธิภาพ
2. ตรวจสอบเมตริกบริการ OpenAI ในพอร์ทัล Azure
3. ยืนยันการเชื่อมต่อเครือข่ายและความหน่วงเวลา

**วิธีแก้:**
- นำแคชมาใช้สำหรับคำถามที่พบบ่อย
- ใช้โมเดล OpenAI ที่เหมาะสมกับกรณีการใช้งาน
- พิจารณาการใช้รีพลิกาคู่สำหรับสถานการณ์โหลดสูง

### **แบบฝึกหัดแลป 6.1: ความท้าทายการดีบัก**

**สถานการณ์:** การปรับใช้สำเร็จ แต่แอปพลิเคชันคืนค่า 500 errors

**งานดีบัก:**
1. ตรวจสอบบันทึกแอปพลิเคชัน
2. ยืนยันว่าสามารถเชื่อมต่อบริการได้
3. ทดสอบการตรวจสอบสิทธิ์
4. ตรวจสอบการกำหนดค่า

**เครื่องมือที่ใช้:**
- `azd show` เพื่อดูภาพรวมการปรับใช้
- พอร์ทัล Azure เพื่อดูบันทึกบริการรายละเอียดย่อย
- Application Insights สำหรับเทเลเมทรีแอปพลิเคชัน

## โมดูล 7: การตรวจสอบและการเพิ่มประสิทธิภาพ

### ขั้นตอน 7.1: ตั้งค่าการตรวจสอบอย่างครบวงจร

1. **สร้างแดชบอร์ดที่กำหนดเอง:**

ไปที่พอร์ทัล Azure สร้างแดชบอร์ดที่ประกอบด้วย:
- จำนวนการร้องขอ OpenAI และความหน่วงเวลา
- อัตราความผิดพลาดของแอปพลิเคชัน
- การใช้งานทรัพยากร
- การติดตามค่าใช้จ่าย

2. **ตั้งค่าการแจ้งเตือน:**
```bash
# แจ้งเตือนสำหรับอัตราความผิดพลาดสูง
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ขั้นตอน 7.2: การเพิ่มประสิทธิภาพค่าใช้จ่าย

1. **วิเคราะห์ค่าใช้จ่ายปัจจุบัน:**
```bash
# ใช้ Azure CLI เพื่อดึงข้อมูลค่าใช้จ่าย
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ดำเนินการควบคุมค่าใช้จ่าย:**
- ตั้งค่าการแจ้งเตือนงบประมาณ
- ใช้นโยบายการปรับขนาดอัตโนมัติ
- ใช้แคชสำหรับคำร้องขอ
- ติดตามการใช้งานโทเค็นสำหรับ OpenAI

### **แบบฝึกหัดแลป 7.1: การเพิ่มประสิทธิภาพด้านประสิทธิภาพ**

**งาน:** ปรับปรุงแอป AI ของคุณทั้งด้านประสิทธิภาพและค่าใช้จ่าย

**เมตริกที่ต้องปรับปรุง:**
- ลดเวลาตอบสนองเฉลี่ยลง 20%
- ลดค่าใช้จ่ายรายเดือนไม่ต่ำกว่า 15%
- รักษา uptime 99.9%

**กลยุทธ์ที่ทดลองใช้:**
- นำแคชสำหรับการตอบสนองมาใช้
- ปรับปรุง prompt ให้ใช้โทเค็นอย่างมีประสิทธิภาพ
- ใช้ SKU การประมวลผลที่เหมาะสม
- ตั้งค่าการปรับขนาดอัตโนมัติอย่างเหมาะสม

## ความท้าทายในขั้นสุดท้าย: การดำเนินการแบบครบวงจร

### สถานการณ์ความท้าทาย

คุณได้รับมอบหมายให้สร้างแชทบอทบริการลูกค้าที่พร้อมใช้งานจริงขับเคลื่อนด้วย AI โดยมีข้อกำหนดดังนี้:

**ข้อกำหนดเชิงฟังก์ชัน:**
- ส่วนติดต่อเว็บสำหรับการโต้ตอบกับลูกค้า
- การรวม Microsoft Foundry Models สำหรับการตอบสนอง
- ความสามารถในการค้นหาเอกสารโดยใช้ Azure AI Search
- การรวมกับฐานข้อมูลลูกค้าที่มีอยู่
- รองรับหลายภาษา

**ข้อกำหนดที่ไม่ใช่เชิงฟังก์ชัน:**
- รองรับผู้ใช้พร้อมกัน 1000 คน
- SLA uptime 99.9%
- ปฏิบัติตามมาตรฐาน SOC 2
- งบประมาณไม่เกิน $500 ต่อเดือน
- ปรับใช้ในหลายสภาพแวดล้อม (dev, staging, prod)

### ขั้นตอนการดำเนินการ

1. ออกแบบสถาปัตยกรรม
2. สร้างแม่แบบ AZD
3. นำมาตรการความปลอดภัยมาใช้
4. ตั้งค่าการตรวจสอบและแจ้งเตือน
5. สร้างท่อการปรับใช้
6. จัดทำเอกสารโซลูชัน

### เกณฑ์การประเมิน

- ✅ **ฟังก์ชันการทำงาน**: ตอบสนองทุกข้อกำหนดหรือไม่?
- ✅ **ความปลอดภัย**: นำแนวทางปฏิบัติที่ดีที่สุดมาใช้หรือไม่?
- ✅ **ความสามารถในการปรับขนาด**: รองรับโหลดได้หรือไม่?
- ✅ **ความง่ายต่อการดูแลรักษา**: โค้ดและโครงสร้างพื้นฐานจัดการได้ดีหรือไม่?
- ✅ **ค่าใช้จ่าย**: อยู่ในงบประมาณหรือไม่?

## แหล่งข้อมูลเพิ่มเติม

### เอกสารของ Microsoft
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [เอกสารบริการ Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [เอกสาร Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### แม่แบบตัวอย่าง
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ชุมชนทรัพยากร
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ใบรับรองการสำเร็จ

ขอแสดงความยินดี! คุณได้ทำเวิร์กช็อป AI Workshop Lab เสร็จสมบูรณ์แล้ว ตอนนี้คุณควรจะสามารถ:

- ✅ แปลงแอปพลิเคชัน AI ที่มีอยู่เป็นเทมเพลต AZD
- ✅ นำแอป AI ที่พร้อมใช้งานไปผลิต
- ✅ ดำเนินการตามแนวทางปฏิบัติด้านความปลอดภัยที่ดีที่สุดสำหรับงาน AI
- ✅ ตรวจสอบและปรับปรุงประสิทธิภาพของแอปพลิเคชัน AI
- ✅ แก้ไขปัญหาการติดตั้งที่พบบ่อย

### ขั้นตอนถัดไป
1. ใช้แบบแผนเหล่านี้กับโครงการ AI ของคุณเอง
2. มีส่วนร่วมในการส่งเทมเพลตกลับสู่ชุมชน
3. เข้าร่วม Microsoft Foundry Discord เพื่อรับการสนับสนุนอย่างต่อเนื่อง
4. สำรวจหัวข้อขั้นสูงเช่นการติดตั้งหลายภูมิภาค

---

**ความคิดเห็นเกี่ยวกับเวิร์กช็อป**: ช่วยเราปรับปรุงเวิร์กช็อปนี้โดยแบ่งปันประสบการณ์ของคุณในช่อง [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure)

---

**การนำทางบท:**
- **📚 หน้าหลักคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ ก่อนหน้า**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ ถัดไป**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมชุมชนของเราเพื่อรับการสนับสนุนและอภิปรายเกี่ยวกับ AZD และการนำ AI ไปใช้จริง

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->