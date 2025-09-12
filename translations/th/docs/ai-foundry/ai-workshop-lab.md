<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T21:35:26+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "th"
}
-->
# AI Workshop Lab: การทำให้โซลูชัน AI ของคุณพร้อมใช้งาน AZD

**ก่อนหน้า:** [การปรับใช้โมเดล AI](ai-model-deployment.md) | **ถัดไป:** [แนวปฏิบัติ AI ในการผลิต](production-ai-practices.md)

## ภาพรวมของเวิร์กช็อป

เวิร์กช็อปแบบลงมือปฏิบัตินี้จะนำทางนักพัฒนาผ่านกระบวนการปรับแอปพลิเคชัน AI ที่มีอยู่ให้สามารถปรับใช้ได้โดยใช้ Azure Developer CLI (AZD) คุณจะได้เรียนรู้รูปแบบสำคัญสำหรับการปรับใช้ AI ในการผลิตโดยใช้บริการ Azure AI Foundry

**ระยะเวลา:** 2-3 ชั่วโมง  
**ระดับ:** ระดับกลาง  
**ข้อกำหนดเบื้องต้น:** ความรู้พื้นฐานเกี่ยวกับ Azure, ความคุ้นเคยกับแนวคิด AI/ML

## 🎓 วัตถุประสงค์การเรียนรู้

เมื่อจบเวิร์กช็อปนี้ คุณจะสามารถ:
- ✅ เปลี่ยนแอปพลิเคชัน AI ที่มีอยู่ให้ใช้เทมเพลต AZD
- ✅ กำหนดค่าบริการ Azure AI Foundry ด้วย AZD
- ✅ ใช้การจัดการข้อมูลรับรองที่ปลอดภัยสำหรับบริการ AI
- ✅ ปรับใช้แอปพลิเคชัน AI ที่พร้อมใช้งานในระดับการผลิตพร้อมการตรวจสอบ
- ✅ แก้ไขปัญหาทั่วไปในการปรับใช้ AI

## ข้อกำหนดเบื้องต้น

### เครื่องมือที่จำเป็น
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ติดตั้งแล้ว
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ติดตั้งแล้ว
- [Git](https://git-scm.com/) ติดตั้งแล้ว
- โปรแกรมแก้ไขโค้ด (แนะนำ VS Code)

### ทรัพยากร Azure
- การสมัครใช้งาน Azure พร้อมสิทธิ์ผู้สนับสนุน
- การเข้าถึงบริการ Azure OpenAI (หรือความสามารถในการขอการเข้าถึง)
- สิทธิ์ในการสร้างกลุ่มทรัพยากร

### ความรู้ที่จำเป็น
- ความเข้าใจพื้นฐานเกี่ยวกับบริการ Azure
- ความคุ้นเคยกับอินเทอร์เฟซบรรทัดคำสั่ง
- แนวคิดพื้นฐาน AI/ML (API, โมเดล, คำสั่ง)

## การตั้งค่าเวิร์กช็อป

### ขั้นตอนที่ 1: การเตรียมสภาพแวดล้อม

1. **ตรวจสอบการติดตั้งเครื่องมือ:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **โคลนที่เก็บเวิร์กช็อป:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## โมดูล 1: การทำความเข้าใจโครงสร้าง AZD สำหรับแอปพลิเคชัน AI

### โครงสร้างของเทมเพลต AZD ที่พร้อมใช้งาน AI

สำรวจไฟล์สำคัญในเทมเพลต AZD ที่พร้อมใช้งาน AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **การฝึกปฏิบัติ 1.1: สำรวจการกำหนดค่า**

1. **ตรวจสอบไฟล์ azure.yaml:**
```bash
cat azure.yaml
```

**สิ่งที่ควรสังเกต:**
- คำจำกัดความของบริการสำหรับส่วนประกอบ AI
- การจับคู่ตัวแปรสภาพแวดล้อม
- การกำหนดค่าของโฮสต์

2. **ตรวจสอบโครงสร้าง main.bicep:**
```bash
cat infra/main.bicep
```

**รูปแบบ AI ที่สำคัญที่ควรระบุ:**
- การจัดเตรียมบริการ Azure OpenAI
- การรวม Cognitive Search
- การจัดการคีย์ที่ปลอดภัย
- การกำหนดค่าความปลอดภัยเครือข่าย

### **จุดอภิปราย:** ทำไมรูปแบบเหล่านี้จึงสำคัญสำหรับ AI

- **การพึ่งพาบริการ**: แอป AI มักต้องการบริการที่ประสานงานกันหลายตัว
- **ความปลอดภัย**: คีย์ API และจุดสิ้นสุดต้องการการจัดการที่ปลอดภัย
- **ความสามารถในการปรับขนาด**: งาน AI มีข้อกำหนดการปรับขนาดเฉพาะ
- **การจัดการต้นทุน**: บริการ AI อาจมีค่าใช้จ่ายสูงหากไม่ได้กำหนดค่าอย่างเหมาะสม

## โมดูล 2: การปรับใช้แอปพลิเคชัน AI ครั้งแรกของคุณ

### ขั้นตอน 2.1: การเริ่มต้นสภาพแวดล้อม

1. **สร้างสภาพแวดล้อม AZD ใหม่:**
```bash
azd env new myai-workshop
```

2. **ตั้งค่าพารามิเตอร์ที่จำเป็น:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### ขั้นตอน 2.2: การปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน

1. **ปรับใช้ด้วย AZD:**
```bash
azd up
```

**สิ่งที่เกิดขึ้นระหว่าง `azd up`:**
- ✅ จัดเตรียมบริการ Azure OpenAI
- ✅ สร้างบริการ Cognitive Search
- ✅ ตั้งค่า App Service สำหรับแอปพลิเคชันเว็บ
- ✅ กำหนดค่าเครือข่ายและความปลอดภัย
- ✅ ปรับใช้โค้ดแอปพลิเคชัน
- ✅ ตั้งค่าการตรวจสอบและการบันทึก

2. **ตรวจสอบความคืบหน้าการปรับใช้** และสังเกตทรัพยากรที่ถูกสร้างขึ้น

### ขั้นตอน 2.3: ตรวจสอบการปรับใช้ของคุณ

1. **ตรวจสอบทรัพยากรที่ปรับใช้:**
```bash
azd show
```

2. **เปิดแอปพลิเคชันที่ปรับใช้:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **ทดสอบฟังก์ชัน AI:**
   - ไปที่แอปพลิเคชันเว็บ
   - ลองใช้คำสั่งตัวอย่าง
   - ตรวจสอบว่าการตอบสนองของ AI ทำงานได้

### **การฝึกปฏิบัติ 2.1: การฝึกแก้ไขปัญหา**

**สถานการณ์**: การปรับใช้สำเร็จ แต่ AI ไม่ตอบสนอง

**ปัญหาทั่วไปที่ควรตรวจสอบ:**
1. **คีย์ API OpenAI**: ตรวจสอบว่าตั้งค่าอย่างถูกต้อง
2. **ความพร้อมใช้งานของโมเดล**: ตรวจสอบว่าภูมิภาคของคุณรองรับโมเดล
3. **การเชื่อมต่อเครือข่าย**: ตรวจสอบว่าบริการสามารถสื่อสารกันได้
4. **สิทธิ์ RBAC**: ตรวจสอบว่าแอปสามารถเข้าถึง OpenAI ได้

**คำสั่งแก้ไขปัญหา:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## โมดูล 3: การปรับแต่งแอปพลิเคชัน AI ให้เหมาะกับความต้องการของคุณ

### ขั้นตอน 3.1: ปรับเปลี่ยนการกำหนดค่า AI

1. **อัปเดตโมเดล OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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

### ขั้นตอน 3.2: การกำหนดค่าที่เฉพาะเจาะจงสำหรับสภาพแวดล้อม

**แนวปฏิบัติที่ดีที่สุด**: การกำหนดค่าที่แตกต่างกันสำหรับการพัฒนาและการผลิต

1. **สร้างสภาพแวดล้อมการผลิต:**
```bash
azd env new myai-production
```

2. **ตั้งค่าพารามิเตอร์เฉพาะสำหรับการผลิต:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **การฝึกปฏิบัติ 3.1: การเพิ่มประสิทธิภาพต้นทุน**

**ความท้าทาย**: กำหนดค่าเทมเพลตสำหรับการพัฒนาที่คุ้มค่า

**งานที่ต้องทำ:**
1. ระบุว่า SKUs ใดสามารถตั้งค่าเป็นระดับฟรี/พื้นฐาน
2. กำหนดค่าตัวแปรสภาพแวดล้อมเพื่อลดต้นทุน
3. ปรับใช้และเปรียบเทียบต้นทุนกับการกำหนดค่าการผลิต

**คำแนะนำในการแก้ปัญหา:**
- ใช้ระดับ F0 (ฟรี) สำหรับ Cognitive Services เมื่อเป็นไปได้
- ใช้ระดับ Basic สำหรับ Search Service ในการพัฒนา
- พิจารณาใช้แผน Consumption สำหรับ Functions

## โมดูล 4: แนวปฏิบัติด้านความปลอดภัยและการผลิต

### ขั้นตอน 4.1: การจัดการข้อมูลรับรองที่ปลอดภัย

**ความท้าทายปัจจุบัน**: แอป AI หลายตัวฝังคีย์ API หรือใช้ที่เก็บข้อมูลที่ไม่ปลอดภัย

**โซลูชัน AZD**: การรวม Managed Identity + Key Vault

1. **ตรวจสอบการกำหนดค่าความปลอดภัยในเทมเพลตของคุณ:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **ตรวจสอบว่า Managed Identity ทำงานได้:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ขั้นตอน 4.2: ความปลอดภัยเครือข่าย

1. **เปิดใช้งาน private endpoints** (หากยังไม่ได้กำหนดค่า):

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

### ขั้นตอน 4.3: การตรวจสอบและการสังเกตการณ์

1. **กำหนดค่า Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **ตั้งค่าการตรวจสอบเฉพาะ AI:**

เพิ่มเมตริกที่กำหนดเองสำหรับการดำเนินการ AI:
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

### **การฝึกปฏิบัติ 4.1: การตรวจสอบความปลอดภัย**

**งานที่ต้องทำ**: ตรวจสอบการปรับใช้ของคุณเพื่อแนวปฏิบัติด้านความปลอดภัย

**รายการตรวจสอบ:**
- [ ] ไม่มีความลับที่ฝังอยู่ในโค้ดหรือการกำหนดค่า
- [ ] ใช้ Managed Identity สำหรับการตรวจสอบระหว่างบริการ
- [ ] Key Vault เก็บการกำหนดค่าที่ละเอียดอ่อน
- [ ] การเข้าถึงเครือข่ายถูกจำกัดอย่างเหมาะสม
- [ ] การตรวจสอบและการบันทึกถูกเปิดใช้งาน

## โมดูล 5: การแปลงแอปพลิเคชัน AI ของคุณเอง

### ขั้นตอน 5.1: แบบประเมิน

**ก่อนแปลงแอปของคุณ** ให้ตอบคำถามเหล่านี้:

1. **สถาปัตยกรรมแอปพลิเคชัน:**
   - แอปของคุณใช้บริการ AI อะไรบ้าง?
   - ต้องการทรัพยากรคอมพิวเตอร์อะไรบ้าง?
   - ต้องการฐานข้อมูลหรือไม่?
   - มีการพึ่งพาระหว่างบริการอย่างไร?

2. **ข้อกำหนดด้านความปลอดภัย:**
   - แอปของคุณจัดการข้อมูลที่ละเอียดอ่อนอะไรบ้าง?
   - มีข้อกำหนดด้านการปฏิบัติตามกฎระเบียบอะไรบ้าง?
   - ต้องการเครือข่ายส่วนตัวหรือไม่?

3. **ข้อกำหนดด้านการปรับขนาด:**
   - โหลดที่คาดหวังคืออะไร?
   - ต้องการการปรับขนาดอัตโนมัติหรือไม่?
   - มีข้อกำหนดด้านภูมิภาคหรือไม่?

### ขั้นตอน 5.2: สร้างเทมเพลต AZD ของคุณ

**ทำตามรูปแบบนี้เพื่อแปลงแอปของคุณ:**

1. **สร้างโครงสร้างพื้นฐานพื้นฐาน:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **สร้าง azure.yaml:**
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

### **การฝึกปฏิบัติ 5.1: ความท้าทายในการสร้างเทมเพลต**

**ความท้าทาย**: สร้างเทมเพลต AZD สำหรับแอป AI ประมวลผลเอกสาร

**ข้อกำหนด:**
- Azure OpenAI สำหรับการวิเคราะห์เนื้อหา
- Document Intelligence สำหรับ OCR
- Storage Account สำหรับการอัปโหลดเอกสาร
- Function App สำหรับตรรกะการประมวลผล
- แอปเว็บสำหรับอินเทอร์เฟซผู้ใช้

**คะแนนโบนัส:**
- เพิ่มการจัดการข้อผิดพลาดที่เหมาะสม
- รวมการประมาณต้นทุน
- ตั้งค่าแดชบอร์ดการตรวจสอบ

## โมดูล 6: การแก้ไขปัญหาทั่วไป

### ปัญหาการปรับใช้ทั่วไป

#### ปัญหา 1: โควตาบริการ OpenAI เกิน
**อาการ:** การปรับใช้ล้มเหลวพร้อมข้อผิดพลาดโควตา
**วิธีแก้ไข:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### ปัญหา 2: โมเดลไม่พร้อมใช้งานในภูมิภาค
**อาการ:** การตอบสนอง AI ล้มเหลวหรือข้อผิดพลาดการปรับใช้โมเดล
**วิธีแก้ไข:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### ปัญหา 3: ปัญหาสิทธิ์
**อาการ:** ข้อผิดพลาด 403 Forbidden เมื่อเรียกใช้บริการ AI
**วิธีแก้ไข:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ปัญหาด้านประสิทธิภาพ

#### ปัญหา 4: การตอบสนอง AI ช้า
**ขั้นตอนการตรวจสอบ:**
1. ตรวจสอบ Application Insights สำหรับเมตริกประสิทธิภาพ
2. ตรวจสอบเมตริกบริการ OpenAI ในพอร์ทัล Azure
3. ตรวจสอบการเชื่อมต่อเครือข่ายและความหน่วง

**วิธีแก้ไข:**
- ใช้การแคชสำหรับคำสั่งทั่วไป
- ใช้โมเดล OpenAI ที่เหมาะสมกับกรณีการใช้งานของคุณ
- พิจารณาใช้สำเนาอ่านสำหรับสถานการณ์โหลดสูง

### **การฝึกปฏิบัติ 6.1: ความท้าทายในการแก้ไขปัญหา**

**สถานการณ์**: การปรับใช้สำเร็จ แต่แอปพลิเคชันส่งคืนข้อผิดพลาด 500

**งานแก้ไขปัญหา:**
1. ตรวจสอบบันทึกแอปพลิเคชัน
2. ตรวจสอบการเชื่อมต่อบริการ
3. ทดสอบการตรวจสอบสิทธิ์
4. ตรวจสอบการกำหนดค่า

**เครื่องมือที่ใช้:**
- `azd show` สำหรับภาพรวมการปรับใช้
- พอร์ทัล Azure สำหรับบันทึกบริการโดยละเอียด
- Application Insights สำหรับข้อมูลการทำงานของแอปพลิเคชัน

## โมดูล 7: การตรวจสอบและการเพิ่มประสิทธิภาพ

### ขั้นตอน 7.1: ตั้งค่าการตรวจสอบที่ครอบคลุม

1. **สร้างแดชบอร์ดที่กำหนดเอง:**

ไปที่พอร์ทัล Azure และสร้างแดชบอร์ดที่มี:
- จำนวนคำขอและความหน่วง OpenAI
- อัตราข้อผิดพลาดของแอปพลิเคชัน
- การใช้ทรัพยากร
- การติดตามต้นทุน

2. **ตั้งค่าการแจ้งเตือน:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ขั้นตอน 7.2: การเพิ่มประสิทธิภาพต้นทุน

1. **วิเคราะห์ต้นทุนปัจจุบัน:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **ใช้การควบคุมต้นทุน:**
- ตั้งค่าการแจ้งเตือนงบประมาณ
- ใช้นโยบายการปรับขนาดอัตโนมัติ
- ใช้การแคชคำขอ
- ตรวจสอบการใช้โทเค็นสำหรับ OpenAI

### **การฝึกปฏิบัติ 7.1: การเพิ่มประสิทธิภาพประสิทธิภาพ**

**งานที่ต้องทำ**: เพิ่มประสิทธิภาพแอปพลิเคชัน AI ของคุณทั้งในด้านประสิทธิภาพและต้นทุน

**เมตริกที่ต้องปรับปรุง:**
- ลดเวลาเฉลี่ยในการตอบสนองลง 20%
- ลดต้นทุนรายเดือนลง 15%
- รักษา SLA uptime 99.9%

**กลยุทธ์ที่ควรลอง:**
- ใช้การแคชการตอบสนอง
- ปรับคำสั่งให้มีประสิทธิภาพการใช้โทเค็น
- ใช้ SKUs คอมพิวเตอร์ที่เหมาะสม
- ตั้งค่านโยบายการปรับขนาดอัตโนมัติที่เหมาะสม

## ความท้าทายสุดท้าย: การดำเนินการแบบครบวงจร

### สถานการณ์ความท้าทาย

คุณได้รับมอบหมายให้สร้างแชทบอทบริการลูกค้าที่ขับเคลื่อนด้วย AI ที่พร้อมใช้งานในระดับการผลิต โดยมีข้อกำหนดดังนี้:

**ข้อกำหนดด้านฟังก์ชัน:**
- อินเทอร์เฟซเว็บสำหรับการโต้ตอบกับลูกค้า
- การรวม Azure OpenAI สำหรับการตอบสนอง
- ความสามารถในการค้นหาเอกสารโดยใช้ Cognitive Search
- การรวมฐานข้อมูลลูกค้าที่มีอยู่
- รองรับหลายภาษา

**ข้อกำหนดที่ไม่ใช่ฟังก์ชัน:**
- รองรับผู้ใช้พร้อมกัน 1000 คน
- SLA uptime 99.9%
- การปฏิบัติตาม SOC 2
- ค่าใช้จ
- ✅ ปฏิบัติตามแนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัยสำหรับงาน AI
- ✅ ตรวจสอบและปรับปรุงประสิทธิภาพของแอปพลิเคชัน AI
- ✅ แก้ไขปัญหาทั่วไปในการปรับใช้งาน

### ขั้นตอนถัดไป
1. นำรูปแบบเหล่านี้ไปใช้กับโครงการ AI ของคุณเอง
2. มีส่วนร่วมในการส่งเทมเพลตกลับคืนสู่ชุมชน
3. เข้าร่วม Discord ของ Azure AI Foundry เพื่อรับการสนับสนุนอย่างต่อเนื่อง
4. สำรวจหัวข้อขั้นสูง เช่น การปรับใช้งานในหลายภูมิภาค

---

**ความคิดเห็นเกี่ยวกับเวิร์กช็อป**: ช่วยเราปรับปรุงเวิร์กช็อปนี้โดยแบ่งปันประสบการณ์ของคุณใน [ช่อง #Azure ของ Discord Azure AI Foundry](https://discord.gg/microsoft-azure)

---

**ก่อนหน้า:** [การปรับใช้โมเดล AI](ai-model-deployment.md) | **ถัดไป:** [แนวปฏิบัติ AI ในการผลิต](production-ai-practices.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมชุมชนของเราเพื่อรับการสนับสนุนและพูดคุยเกี่ยวกับ AZD และการปรับใช้งาน AI

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้