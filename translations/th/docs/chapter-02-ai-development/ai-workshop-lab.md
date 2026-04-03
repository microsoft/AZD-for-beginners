# ห้องปฏิบัติการ AI Workshop: การทำให้โซลูชัน AI ของคุณสามารถปรับใช้ด้วย AZD

**การนำทางบท:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาแบบ AI-First
- **⬅️ ก่อนหน้า**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **➡️ ถัดไป**: [แนวปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต](production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

## ภาพรวมการอบรม

ห้องปฏิบัติการเชิงปฏิบัตินี้แนะนำให้นักพัฒนาผ่านกระบวนการนำเทมเพลต AI ที่มีอยู่แล้วไปปรับใช้โดยใช้ Azure Developer CLI (AZD) คุณจะได้เรียนรู้รูปแบบที่จำเป็นสำหรับการปรับใช้ AI ในสภาพแวดล้อมการผลิตโดยใช้บริการ Microsoft Foundry

> **หมายเหตุการตรวจสอบ (2026-03-25):** ห้องปฏิบัติการนี้ได้รับการตรวจสอบกับ `azd` เวอร์ชัน `1.23.12` หากการติดตั้งในเครื่องของคุณเก่ากว่านี้ กรุณาอัปเดต AZD ก่อนเริ่มเพื่อให้เวิร์กโฟลว์การตรวจสอบสิทธิ์ เทมเพลต และการปรับใช้งานตรงกับขั้นตอนด้านล่าง

**ระยะเวลา:** 2-3 ชั่วโมง  
**ระดับ:** ระดับกลาง  
**ความรู้พื้นฐาน:** ความรู้พื้นฐานเกี่ยวกับ Azure, ความคุ้นเคยกับแนวคิด AI/ML

## 🎓 วัตถุประสงค์การเรียนรู้

เมื่อสิ้นสุดห้องปฏิบัติการนี้ คุณจะสามารถ:
- ✅ แปลงแอปพลิเคชัน AI ที่มีอยู่ให้ใช้เทมเพลต AZD
- ✅ กำหนดค่าบริการ Microsoft Foundry ด้วย AZD
- ✅ นำการจัดการข้อมูลประจำตัวที่ปลอดภัยมาใช้สำหรับบริการ AI
- ✅ ปรับใช้แอปพลิเคชัน AI ที่พร้อมใช้งานในสภาพแวดล้อมการผลิตพร้อมการเฝ้าติดตาม
- ✅ แก้ไขปัญหาการปรับใช้ AI ที่พบบ่อย

## ความต้องการเบื้องต้น

### เครื่องมือที่ต้องมี
- ติดตั้ง [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- ติดตั้ง [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- ติดตั้ง [Git](https://git-scm.com/)
- ตัวแก้ไขโค้ด (แนะนำ VS Code)

### ทรัพยากร Azure
- การสมัครใช้งาน Azure ที่มีสิทธิ์ contributor
- เข้าถึงบริการ Microsoft Foundry Models (หรือติดต่อขอสิทธิ์)
- สิทธิ์ในการสร้างกลุ่มทรัพยากร

### ความรู้เบื้องต้น
- เข้าใจบริการ Azure เบื้องต้น
- คุ้นเคยกับอินเทอร์เฟซบรรทัดคำสั่ง
- แนวคิดเบื้องต้นเกี่ยวกับ AI/ML (API, โมเดล, คำสั่ง)

## การตั้งค่าห้องปฏิบัติการ

### ขั้นตอนที่ 1: เตรียมสภาพแวดล้อม

1. **ตรวจสอบการติดตั้งเครื่องมือ:**
```bash
# ตรวจสอบการติดตั้ง AZD
azd version

# ตรวจสอบ Azure CLI
az --version

# ลงชื่อเข้าใช้ Azure สำหรับเวิร์กโฟลว์ AZD
azd auth login

# ลงชื่อเข้าใช้ Azure CLI ก็ต่อเมื่อคุณวางแผนที่จะเรียกใช้คำสั่ง az ระหว่างการวินิจฉัยเท่านั้น
az login
```

ถ้าคุณทำงานกับหลายเทนแนนต์หรือระบบไม่ตรวจพบการสมัครใช้งานโดยอัตโนมัติ ให้ลองใหม่ด้วยคำสั่ง `azd auth login --tenant-id <tenant-id>`

2. **โคลนรีโพซิทอรีของเวิร์กช็อป:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## โมดูล 1: ทำความเข้าใจโครงสร้าง AZD สำหรับแอปพลิเคชัน AI

### องค์ประกอบของเทมเพลต AI AZD

สำรวจไฟล์สำคัญในเทมเพลต AZD ที่พร้อมสำหรับ AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **แบบฝึกหัดห้องปฏิบัติการ 1.1: สำรวจการกำหนดค่า**

1. **ตรวจสอบไฟล์ azure.yaml:**
```bash
cat azure.yaml
```

**สิ่งที่ต้องดู:**
- การกำหนดบริการสำหรับส่วนประกอบ AI
- การแมปตัวแปรสภาพแวดล้อม
- การกำหนดโฮสต์

2. **ทบทวนโครงสร้างพื้นฐานใน main.bicep:**
```bash
cat infra/main.bicep
```

**รูปแบบ AI ที่สำคัญที่ควรสังเกต:**
- การจัดเตรียมบริการ Microsoft Foundry Models
- การผสานรวม Cognitive Search
- การจัดการคีย์อย่างปลอดภัย
- การกำหนดค่าความปลอดภัยเครือข่าย

### **ประเด็นอภิปราย:** ทำไมรูปแบบเหล่านี้จึงสำคัญต่อ AI

- **การพึ่งพาบริการ:** แอป AI มักต้องประสานงานบริการหลายอย่าง
- **ความปลอดภัย:** คีย์ API และจุดเชื่อมต่อจำเป็นต้องจัดการอย่างปลอดภัย
- **การปรับขนาด:** งาน AI มีความต้องการการปรับขนาดเฉพาะตัว
- **การจัดการค่าใช้จ่าย:** บริการ AI อาจมีค่าใช้จ่ายสูงหากไม่ได้ตั้งค่าอย่างเหมาะสม

## โมดูล 2: ปรับใช้แอปพลิเคชัน AI แรกของคุณ

### ขั้นตอน 2.1: เริ่มต้นสภาพแวดล้อม

1. **สร้างสภาพแวดล้อม AZD ใหม่:**
```bash
azd env new myai-workshop
```

2. **ตั้งค่าพารามิเตอร์ที่จำเป็น:**
```bash
# ตั้งค่าเขตภูมิภาค Azure ที่คุณต้องการ
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
- ✅ สร้างบริการ Cognitive Search
- ✅ ตั้งค่า App Service สำหรับเว็บแอปพลิเคชัน
- ✅ กำหนดค่าเครือข่ายและความปลอดภัย
- ✅ นำรหัสแอปพลิเคชันขึ้นใช้งาน
- ✅ ตั้งค่าการเฝ้าติดตามและบันทึกข้อมูล

2. **ติดตามความคืบหน้าการปรับใช้** และจดบันทึกทรัพยากรที่ถูกสร้าง

### ขั้นตอน 2.3: ตรวจสอบการปรับใช้ของคุณ

1. **ตรวจสอบทรัพยากรที่ปรับใช้:**
```bash
azd show
```

2. **เปิดแอปพลิเคชันที่ปรับใช้:**
```bash
azd show
```

เปิดเอ็นด์พอยต์เว็บที่แสดงในผลลัพธ์ของ `azd show`

3. **ทดสอบฟังก์ชัน AI:**
   - ไปที่เว็บแอปพลิเคชัน
   - ลองคำค้นสอบตัวอย่าง
   - ตรวจสอบว่า AI ตอบสนองอย่างถูกต้อง

### **แบบฝึกหัดห้องปฏิบัติการ 2.1: ฝึกแก้ไขปัญหา**

**สถานการณ์:** การปรับใช้สำเร็จแต่ AI ไม่ตอบสนอง

**ปัญหาทั่วไปที่ควรตรวจสอบ:**
1. **คีย์ OpenAI API:** ตรวจสอบให้ตั้งค่าอย่างถูกต้อง
2. **ความพร้อมของโมเดล:** ตรวจสอบว่าภูมิภาคของคุณรองรับโมเดลนี้หรือไม่
3. **การเชื่อมต่อเครือข่าย:** ตรวจสอบให้บริการสามารถสื่อสารกันได้
4. **สิทธิ์ RBAC:** ตรวจสอบว่าแอปสามารถเข้าถึง OpenAI ได้

**คำสั่งสำหรับการดีบัก:**
```bash
# ตรวจสอบตัวแปรแวดล้อม
azd env get-values

# ดูบันทึกการปรับใช้
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# ตรวจสอบสถานะการปรับใช้ OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## โมดูล 3: ปรับแต่งแอปพลิเคชัน AI ให้เหมาะกับความต้องการของคุณ

### ขั้นตอน 3.1: แก้ไขการกำหนดค่า AI

1. **อัปเดตโมเดล OpenAI:**
```bash
# เปลี่ยนเป็นโมเดลอื่น (ถ้ามีในภูมิภาคของคุณ)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ติดตั้งใหม่ด้วยการกำหนดค่าด้วยรุ่นใหม่
azd deploy
```

2. **เพิ่มบริการ AI เพิ่มเติม:**

แก้ไขไฟล์ `infra/main.bicep` เพื่อเพิ่ม Document Intelligence:

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

**แนวปฏิบัติที่ดีที่สุด:** กำหนดค่าที่แตกต่างกันสำหรับการพัฒนากับการผลิต

1. **สร้างสภาพแวดล้อมสำหรับการผลิต:**
```bash
azd env new myai-production
```

2. **ตั้งค่าพารามิเตอร์เฉพาะสำหรับการผลิต:**
```bash
# การผลิตมักใช้ SKU ที่สูงกว่า
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# เปิดใช้งานคุณสมบัติความปลอดภัยเพิ่มเติม
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **แบบฝึกหัดห้องปฏิบัติการ 3.1: การเพิ่มประสิทธิภาพต้นทุน**

**ความท้าทาย:** กำหนดค่าเทมเพลตให้รองรับการพัฒนาด้วยต้นทุนต่ำ

**งานที่ต้องทำ:**
1. ระบุ SKU ที่สามารถตั้งค่าเป็นฟรี/ขั้นพื้นฐาน
2. กำหนดค่าตัวแปรสภาพแวดล้อมเพื่อใช้ต้นทุนน้อยที่สุด
3. ปรับใช้และเปรียบเทียบค่าใช้จ่ายกับการกำหนดค่าการผลิต

**คำแนะนำ:**
- ใช้ F0 (ฟรี) สำหรับ Cognitive Services หากเป็นไปได้
- ใช้ Basic tier สำหรับ Search Service ในการพัฒนา
- พิจารณาใช้แผน Consumption สำหรับ Functions

## โมดูล 4: ความปลอดภัยและแนวปฏิบัติที่ดีที่สุดในสภาพแวดล้อมการผลิต

### ขั้นตอน 4.1: การจัดการข้อมูลรับรองที่ปลอดภัย

**ความท้าทายในปัจจุบัน:** แอป AI จำนวนมากใช้การเข้ารหัสคีย์ API ตรงในโค้ดหรือเก็บไว้ในสถานที่ไม่ปลอดภัย

**ทางแก้ไขด้วย AZD:** ใช้ Managed Identity + การผสานรวมกับ Key Vault

1. **ทบทวนการกำหนดค่าความปลอดภัยในเทมเพลตของคุณ:**
```bash
# ค้นหาการกำหนดค่า Key Vault และ Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **ตรวจสอบการทำงานของ Managed Identity:**
```bash
# ตรวจสอบว่าเว็บแอปมีการกำหนดค่าตัวตนที่ถูกต้องหรือไม่
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ขั้นตอน 4.2: ความปลอดภัยเครือข่าย

1. **เปิดใช้งาน private endpoints** (ถ้ายังไม่ได้กำหนดค่า):

เพิ่มในเทมเพลต bicep ของคุณ:
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

### ขั้นตอน 4.3: การเฝ้าติดตามและการสังเกตการณ์

1. **กำหนดค่า Application Insights:**
```bash
# Application Insights ควรถูกตั้งค่าอัตโนมัติ
# ตรวจสอบการตั้งค่า:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **ตั้งค่าการเฝ้าติดตามเฉพาะสำหรับ AI:**

เพิ่มเมตริกส์กำหนดเองสำหรับการทำงานของ AI:
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

### **แบบฝึกหัดห้องปฏิบัติการ 4.1: การตรวจสอบความปลอดภัย**

**งาน:** ทบทวนการปรับใช้ของคุณเพื่อให้เป็นไปตามแนวปฏิบัติความปลอดภัยที่ดีที่สุด

**รายการตรวจสอบ:**
- [ ] ไม่มีความลับที่ถูกฝังในโค้ดหรือการกำหนดค่า
- [ ] ใช้ Managed Identity สำหรับการรับรองความถูกต้องระหว่างบริการ
- [ ] Key Vault จัดเก็บการกำหนดค่าที่ละเอียดอ่อน
- [ ] การเข้าถึงเครือข่ายถูกจำกัดอย่างเหมาะสม
- [ ] เปิดใช้งานการเฝ้าติดตามและบันทึกข้อมูล

## โมดูล 5: การแปลงแอปพลิเคชัน AI ของคุณเอง

### ขั้นตอน 5.1: แบบประเมิน

**ก่อนแปลงแอปของคุณ** ให้ตอบคำถามเหล่านี้:

1. **สถาปัตยกรรมแอปพลิเคชัน:**
   - แอปของคุณใช้บริการ AI อะไรบ้าง?
   - ต้องการทรัพยากรคอมพิวต์อะไร?
   - จำเป็นต้องใช้ฐานข้อมูลหรือไม่?
   - มีการพึ่งพาระหว่างบริการอย่างไร?

2. **ข้อกำหนดด้านความปลอดภัย:**
   - แอปของคุณจัดการกับข้อมูลที่ละเอียดอ่อนอะไรบ้าง?
   - มีข้อกำหนดด้านการปฏิบัติตามกฎระเบียบใดหรือไม่?
   - ต้องการเครือข่ายส่วนตัวหรือไม่?

3. **ข้อกำหนดการปรับขนาด:**
   - คาดการณ์ปริมาณใช้งานอย่างไร?
   - ต้องการการปรับขนาดอัตโนมัติหรือไม่?
   - มีข้อกำหนดในภูมิภาคหรือไม่?

### ขั้นตอน 5.2: สร้างเทมเพลต AZD ของคุณ

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

3. **สร้างเทมเพลตโครงสร้างพื้นฐาน:**

**infra/main.bicep** - เทมเพลตหลัก:
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

### **แบบฝึกหัดห้องปฏิบัติการ 5.1: ความท้าทายในการสร้างเทมเพลต**

**ความท้าทาย:** สร้างเทมเพลต AZD สำหรับแอป AI ประมวลผลเอกสาร

**ข้อกำหนด:**
- Microsoft Foundry Models สำหรับการวิเคราะห์เนื้อหา
- Document Intelligence สำหรับ OCR
- บัญชีจัดเก็บข้อมูลสำหรับอัปโหลดเอกสาร
- Function App สำหรับตรรกะการประมวลผล
- เว็บแอปสำหรับอินเทอร์เฟซผู้ใช้

**คะแนนโบนัส:**
- เพิ่มการจัดการข้อผิดพลาดที่เหมาะสม
- รวมการประเมินต้นทุน
- ตั้งค่าหน้าปัดการเฝ้าติดตาม

## โมดูล 6: การแก้ไขปัญหาที่พบบ่อย

### ปัญหาการปรับใช้ทั่วไป

#### ปัญหา 1: โควต้าบริการ OpenAI เกินขีดจำกัด
**อาการ:** การปรับใช้ล้มเหลวพร้อมข้อผิดพลาดโควต้า  
**วิธีแก้ไข:**
```bash
# ตรวจสอบโควต้าปัจจุบัน
az cognitiveservices usage list --location eastus

# ขอเพิ่มโควต้าหรือทดลองใช้ภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up
```

#### ปัญหา 2: โมเดลไม่พร้อมใช้ในภูมิภาค
**อาการ:** AI ตอบสนองล้มเหลวหรือข้อผิดพลาดการปรับใช้โมเดล  
**วิธีแก้ไข:**
```bash
# ตรวจสอบความพร้อมของโมเดลตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเป็นโมเดลที่พร้อมใช้งาน
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### ปัญหา 3: ปัญหาด้านสิทธิ์
**อาการ:** ข้อผิดพลาด 403 Forbidden เมื่อเรียกใช้บริการ AI  
**วิธีแก้ไข:**
```bash
# ตรวจสอบการกำหนดบทบาท
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# เพิ่มบทบาทที่ขาดหายไป
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ปัญหาด้านประสิทธิภาพ

#### ปัญหา 4: AI ตอบสนองช้า
**ขั้นตอนการตรวจสอบ:**
1. ตรวจสอบ Application Insights สำหรับเมตริกประสิทธิภาพ
2. ทบทวนเมตริกของบริการ OpenAI ใน Azure portal
3. ตรวจสอบการเชื่อมต่อเครือข่ายและความหน่วง

**วิธีแก้ไข:**
- ใช้แคชสำหรับคำค้นหาที่พบบ่อย
- ใช้โมเดล OpenAI ที่เหมาะสมกับกรณีใช้งานของคุณ
- พิจารณาใช้อ่านสำเนาสำหรับสถานการณ์โหลดสูง

### **แบบฝึกหัดห้องปฏิบัติการ 6.1: ความท้าทายการดีบัก**

**สถานการณ์:** การปรับใช้สำเร็จ แต่แอปพลิเคชันส่งคืนข้อผิดพลาด 500

**งานดีบัก:**
1. ตรวจสอบบันทึกแอปพลิเคชัน
2. ตรวจสอบการเชื่อมต่อบริการ
3. ทดสอบการยืนยันตัวตน
4. ทบทวนการกำหนดค่า

**เครื่องมือที่ใช้:**
- `azd show` สำหรับภาพรวมการปรับใช้
- พอร์ทัล Azure สำหรับบันทึกรายละเอียดบริการ
- Application Insights สำหรับการวัดข้อมูลแอปพลิเคชัน

## โมดูล 7: การเฝ้าติดตามและการเพิ่มประสิทธิภาพ

### ขั้นตอน 7.1: ตั้งค่าการเฝ้าติดตามครบวงจร

1. **สร้างแดชบอร์ดกำหนดเอง:**

ไปที่พอร์ทัล Azure และสร้างแดชบอร์ดพร้อม:
- จำนวนคำขอและความล่าช้าของ OpenAI
- อัตราการเกิดข้อผิดพลาดของแอปพลิเคชัน
- การใช้ทรัพยากร
- การติดตามค่าใช้จ่าย

2. **ตั้งค่าการแจ้งเตือน:**
```bash
# แจ้งเตือนสำหรับอัตราข้อผิดพลาดสูง
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
# ใช้ Azure CLI เพื่อดึงข้อมูลต้นทุน
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **นำมาตรการควบคุมค่าใช้จ่ายไปใช้:**
- ตั้งค่าการแจ้งเตือนงบประมาณ
- ใช้นโยบาย autoscaling
- ใช้แคชคำขอ
- เฝ้าติดตามการใช้โทเค็นสำหรับ OpenAI

### **แบบฝึกหัดห้องปฏิบัติการ 7.1: การเพิ่มประสิทธิภาพประสิทธิภาพ**

**งาน:** ปรับปรุงแอป AI ของคุณทั้งประสิทธิภาพและต้นทุน

**เมตริกที่ต้องปรับปรุง:**
- ลดเวลาเฉลี่ยในการตอบสนองลง 20%
- ลดต้นทุนรายเดือนลง 15%
- รักษาความพร้อมใช้งานที่ 99.9%

**กลยุทธ์ที่ควรลอง:**
- ใช้แคชตอบสนอง
- ปรับแต่งคำสั่งให้ประหยัดโทเค็น
- ใช้ SKU คอมพิวต์ที่เหมาะสม
- ตั้งค่า autoscaling อย่างถูกต้อง

## ความท้าทายสุดท้าย: การดำเนินการตั้งแต่ต้นจนจบ

### สถานการณ์ความท้าทาย

คุณได้รับมอบหมายให้สร้างแชทบอทบริการลูกค้าพลัง AI ที่พร้อมใช้ในสภาพแวดล้อมการผลิตด้วยข้อกำหนดดังนี้:

**ข้อกำหนดเชิงฟังก์ชัน:**
- อินเทอร์เฟซเว็บสำหรับการโต้ตอบกับลูกค้า
- การผสานรวม Microsoft Foundry Models สำหรับการตอบกลับ
- ความสามารถค้นหาเอกสารด้วย Cognitive Search
- การผสานรวมกับฐานข้อมูลลูกค้าที่มีอยู่
- รองรับหลายภาษา

**ข้อกำหนดไม่ใช่ฟังก์ชัน:**
- รองรับผู้ใช้พร้อมกัน 1000 ราย
- SLA ความพร้อมใช้งาน 99.9%
- ปฏิบัติตาม SOC 2
- ค่าใช้จ่ายไม่เกิน $500/เดือน
- ปรับใช้ในหลายสภาพแวดล้อม (dev, staging, prod)

### ขั้นตอนการดำเนินการ

1. **ออกแบบสถาปัตยกรรม**
2. **สร้างเทมเพลต AZD**
3. **ดำเนินมาตรการความปลอดภัย**
4. **ตั้งค่าการเฝ้าติดตามและแจ้งเตือน**
5. **สร้างสายงานปรับใช้**
6. **จัดทำเอกสารโซลูชัน**

### เกณฑ์การประเมิน

- ✅ **ฟังก์ชันการทำงาน:** ตรงตามข้อกำหนดทั้งหมดหรือไม่
- ✅ **ความปลอดภัย:** มีการนำแนวปฏิบัติที่ดีที่สุดไปใช้หรือไม่
- ✅ **การปรับขนาด:** รองรับโหลดได้ดีหรือไม่
- ✅ **การดูแลรักษา:** โค้ดและโครงสร้างพื้นฐานมีการจัดการอย่างดีหรือไม่
- ✅ **ต้นทุน:** อยู่ในงบประมาณหรือไม่

## แหล่งข้อมูลเพิ่มเติม

### เอกสาร Microsoft
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [เอกสารบริการ Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [เอกสาร Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### เทมเพลตตัวอย่าง
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### แหล่งข้อมูลชุมชน
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ใบรับรองการสำเร็จ

ยินดีด้วย! คุณได้ผ่านเวิร์กช็อป AI แล้ว ตอนนี้คุณควรจะสามารถ:

- ✅ แปลงแอปพลิเคชัน AI ที่มีอยู่เป็นเท็มเพลต AZD
- ✅ นำแอปพลิเคชัน AI ที่พร้อมใช้งานในโปรดักชันไปใช้งาน
- ✅ นำแนวทางปฏิบัติด้านความปลอดภัยที่ดีที่สุดสำหรับงาน AI ไปใช้
- ✅ ตรวจสอบและเพิ่มประสิทธิภาพการทำงานของแอป AI
- ✅ แก้ไขปัญหาทั่วไปในการนำแอปไปใช้งาน

### ขั้นตอนถัดไป
1. นำรูปแบบเหล่านี้ไปใช้กับโปรเจกต์ AI ของคุณเอง
2. ร่วมแบ่งปันเท็มเพลตกับชุมชน
3. เข้าร่วม Microsoft Foundry Discord เพื่อรับการสนับสนุนอย่างต่อเนื่อง
4. สำรวจหัวข้อขั้นสูง เช่น การนำไปใช้งานหลายภูมิภาค

---

**ข้อเสนอแนะเวิร์กช็อป**: ช่วยเราปรับปรุงเวิร์กช็อปนี้โดยการแบ่งปันประสบการณ์ของคุณใน [ช่องทาง Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure)

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกหลักสูตร**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ ก่อนหน้า**: [การนำโมเดล AI ไปใช้งาน](ai-model-deployment.md)
- **➡️ ถัดไป**: [แนวปฏิบัติที่ดีที่สุดสำหรับ AI ในโปรดักชัน](production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมชุมชนของเราเพื่อรับการสนับสนุนและการสนทนาเกี่ยวกับ AZD และการนำ AI ไปใช้งาน.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความแม่นยำ โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่น่าเชื่อถือ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้บริการแปลโดยมนุษย์ผู้เชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->