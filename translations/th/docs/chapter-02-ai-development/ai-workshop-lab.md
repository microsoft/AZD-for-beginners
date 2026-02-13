# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 หน้าหลักของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาแบบ AI-First
- **⬅️ ก่อนหน้า**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ ถัดไป**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

## ภาพรวมของ Workshop

แลปเชิงปฏิบัติการนี้แนะนำผู้พัฒนาผ่านกระบวนการนำเทมเพลต AI ที่มีอยู่แล้วมาปรับใช้โดยใช้ Azure Developer CLI (AZD) คุณจะได้เรียนรู้รูปแบบสำคัญสำหรับการปรับใช้ AI ในสภาพแวดล้อมการผลิตโดยใช้บริการ Microsoft Foundry

**ระยะเวลา:** 2-3 ชั่วโมง  
**ระดับ:** ระดับกลาง  
**ข้อกำหนดเบื้องต้น:** ความรู้พื้นฐานเกี่ยวกับ Azure, ความคุ้นเคยกับแนวคิด AI/ML

## 🎓 เป้าหมายการเรียนรู้

เมื่อจบ workshop นี้ คุณจะสามารถ:
- ✅ แปลงแอปพลิเคชัน AI ที่มีอยู่เพื่อใช้เทมเพลต AZD
- ✅ กำหนดค่าบริการ Microsoft Foundry ด้วย AZD
- ✅ นำการจัดการข้อมูลรับรองอย่างปลอดภัยไปใช้สำหรับบริการ AI
- ✅ ปรับใช้แอปพลิเคชัน AI ที่พร้อมสำหรับการผลิตพร้อมการตรวจสอบ
- ✅ แก้ไขปัญหาการปรับใช้ AI ที่พบบ่อย

## ข้อกำหนดเบื้องต้น

### เครื่องมือที่ต้องมี
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ติดตั้งแล้ว
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ติดตั้งแล้ว
- [Git](https://git-scm.com/) ติดตั้งแล้ว
- โปรแกรมแก้ไขโค้ด (แนะนำ VS Code)

### ทรัพยากร Azure
- Subscription ของ Azure พร้อมสิทธิ์ contributor
- การเข้าถึง Azure OpenAI services (หรือความสามารถในการร้องขอการเข้าถึง)
- สิทธิ์ในการสร้าง resource group

### ความรู้พื้นฐานที่จำเป็น
- ความเข้าใจพื้นฐานเกี่ยวกับบริการ Azure
- ความคุ้นเคยกับอินเทอร์เฟซบรรทัดคำสั่ง
- แนวคิดพื้นฐาน AI/ML (APIs, models, prompts)

## การตั้งค่าแลป

### ขั้นตอนที่ 1: การเตรียมสภาพแวดล้อม

1. **ยืนยันการติดตั้งเครื่องมือ:**
```bash
# ตรวจสอบการติดตั้ง AZD
azd version

# ตรวจสอบ Azure CLI
az --version

# ลงชื่อเข้าใช้ Azure
az login
azd auth login
```

2. **โคลนรีโพสิทอรีของ workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

สำรวจไฟล์สำคัญในเทมเพลต AZD ที่พร้อมสำหรับ AI:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **ตรวจสอบไฟล์ azure.yaml:**
```bash
cat azure.yaml
```

**สิ่งที่ควรมองหา:**
- คำจำกัดความของบริการสำหรับคอมโพเนนต์ AI
- การแมปตัวแปรสภาพแวดล้อม
- การกำหนดค่าโฮสต์

2. **ทบทวน main.bicep ของโครงสร้างพื้นฐาน:**
```bash
cat infra/main.bicep
```

**รูปแบบ AI สำคัญที่ควรระบุ:**
- การจัดเตรียมบริการ Azure OpenAI
- การผสานรวม Cognitive Search
- การจัดการคีย์อย่างปลอดภัย
- การกำหนดค่าความปลอดภัยเครือข่าย

### **ประเด็นอภิปราย:** ทำไมรูปแบบเหล่านี้จึงสำคัญสำหรับ AI

- **การพึ่งพาบริการ**: แอป AI มักต้องการบริการหลายตัวที่ประสานงานกัน
- **ความปลอดภัย**: คีย์ API และ endpoints จำเป็นต้องจัดการอย่างปลอดภัย
- **ความสามารถในการปรับขนาด**: งาน AI มีข้อกำหนดการปรับขนาดที่เฉพาะเจาะจง
- **การจัดการต้นทุน**: บริการ AI อาจมีค่าใช้จ่ายสูงหากไม่ได้กำหนดค่าอย่างเหมาะสม

## Module 2: Deploy Your First AI Application

### ขั้นตอนที่ 2.1: การเริ่มต้นสภาพแวดล้อม

1. **สร้างสภาพแวดล้อม AZD ใหม่:**
```bash
azd env new myai-workshop
```

2. **ตั้งค่าพารามิเตอร์ที่จำเป็น:**
```bash
# ตั้งค่าภูมิภาค Azure ที่คุณต้องการ
azd env set AZURE_LOCATION eastus

# ไม่บังคับ: ตั้งค่ารุ่น OpenAI ที่เฉพาะเจาะจง
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### ขั้นตอนที่ 2.2: ปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน

1. **ปรับใช้ด้วย AZD:**
```bash
azd up
```

**สิ่งที่จะเกิดขึ้นระหว่าง `azd up`:**
- ✅ Provision บริการ Azure OpenAI
- ✅ สร้างบริการ Cognitive Search
- ✅ ตั้งค่า App Service สำหรับเว็บแอปพลิเคชัน
- ✅ กำหนดค่าเครือข่ายและความปลอดภัย
- ✅ ปรับใช้โค้ดแอปพลิเคชัน
- ✅ ตั้งค่าการตรวจสอบและการบันทึก

2. **ติดตามความคืบหน้าการปรับใช้** และสังเกตรายการทรัพยากรที่ถูกสร้างขึ้น

### ขั้นตอนที่ 2.3: ตรวจสอบการปรับใช้ของคุณ

1. **ตรวจสอบทรัพยากรที่ปรับใช้:**
```bash
azd show
```

2. **เปิดแอปพลิเคชันที่ปรับใช้:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **ทดสอบฟังก์ชัน AI:**
   - นำทางไปยังเว็บแอปพลิเคชัน
   - ลองคำค้นตัวอย่าง
   - ยืนยันว่าการตอบสนองของ AI ทำงานได้

### **Lab Exercise 2.1: Troubleshooting Practice**

**สถานการณ์**: การปรับใช้สำเร็จ แต่ AI ไม่ตอบสนอง

**ปัญหาทั่วไปที่ควรตรวจสอบ:**
1. **คีย์ OpenAI API**: ยืนยันว่าได้ตั้งค่าอย่างถูกต้อง
2. **การมีอยู่ของโมเดล**: ตรวจสอบว่าภูมิภาคของคุณรองรับโมเดลหรือไม่
3. **การเชื่อมต่อเครือข่าย**: ตรวจสอบให้แน่ใจว่าบริการสามารถสื่อสารกันได้
4. **สิทธิ์ RBAC**: ยืนยันว่าแอปสามารถเข้าถึง OpenAI

**คำสั่งสำหรับการดีบัก:**
```bash
# ตรวจสอบตัวแปรสภาพแวดล้อม
azd env get-values

# ดูบันทึกการปรับใช้
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# ตรวจสอบสถานะการปรับใช้ของ OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### ขั้นตอนที่ 3.1: แก้ไขการกำหนดค่า AI

1. **อัปเดตโมเดล OpenAI:**
```bash
# เปลี่ยนไปใช้โมเดลอื่น (ถ้ามีในภูมิภาคของคุณ)
azd env set AZURE_OPENAI_MODEL gpt-4

# ปรับใช้อีกครั้งด้วยการกำหนดค่าใหม่
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

### ขั้นตอนที่ 3.2: การกำหนดค่าสำหรับสภาพแวดล้อมเฉพาะ

**แนวปฏิบัติที่ดีที่สุด**: กำหนดค่าที่แตกต่างกันสำหรับการพัฒนาและการผลิต

1. **สร้างสภาพแวดล้อมการผลิต:**
```bash
azd env new myai-production
```

2. **ตั้งค่าพารามิเตอร์เฉพาะสำหรับการผลิต:**
```bash
# การผลิตโดยทั่วไปมักใช้ SKU ที่สูงกว่า
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# เปิดใช้งานฟีเจอร์ความปลอดภัยเพิ่มเติม
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**ความท้าทาย**: กำหนดค่าเทมเพลตให้เหมาะกับการพัฒนาโดยลดต้นทุน

**งานที่ต้องทำ:**
1. ระบุว่า SKU ใดสามารถตั้งเป็นระดับฟรี/พื้นฐานได้
2. กำหนดค่าตัวแปรสภาพแวดล้อมเพื่อลดต้นทุนให้น้อยที่สุด
3. ปรับใช้และเปรียบเทียบต้นทุนกับการกำหนดค่าการผลิต

**คำใบ้สำหรับวิธีแก้ปัญหา:**
- ใช้ระดับ F0 (ฟรี) สำหรับ Cognitive Services เมื่อเป็นไปได้
- ใช้ระดับ Basic สำหรับ Search Service ในการพัฒนา
- พิจารณาใช้แผน Consumption สำหรับ Functions

## Module 4: Security and Production Best Practices

### ขั้นตอนที่ 4.1: การจัดการข้อมูลรับรองอย่างปลอดภัย

**ความท้าทายปัจจุบัน**: แอป AI หลายตัวฝังคีย์ API ลงในโค้ดหรือใช้ที่เก็บที่ไม่ปลอดภัย

**โซลูชัน AZD**: การใช้ Managed Identity + การผสานรวม Key Vault

1. **ทบทวนการกำหนดค่าด้านความปลอดภัยในเทมเพลตของคุณ:**
```bash
# ค้นหาการกำหนดค่าของ Key Vault และ Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **ยืนยันว่า Managed Identity ทำงานได้:**
```bash
# ตรวจสอบว่าเว็บแอปมีการกำหนดค่าการยืนยันตัวตนที่ถูกต้อง
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### ขั้นตอนที่ 4.2: ความปลอดภัยของเครือข่าย

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

### ขั้นตอนที่ 4.3: การตรวจสอบและการสังเกตการณ์

1. **กำหนดค่า Application Insights:**
```bash
# ควรมีการกำหนดค่า Application Insights โดยอัตโนมัติ
# ตรวจสอบการกำหนดค่า:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **ตั้งค่าการตรวจสอบเฉพาะสำหรับ AI:**

เพิ่มเมตริกที่กำหนดเองสำหรับการดำเนินงาน AI:
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

### **Lab Exercise 4.1: Security Audit**

**งาน**: ตรวจสอบการปรับใช้ของคุณตามแนวปฏิบัติด้านความปลอดภัย

**รายการตรวจสอบ:**
- [ ] ไม่มีความลับที่ฝังอยู่ในโค้ดหรือการกำหนดค่า
- [ ] ใช้ Managed Identity สำหรับการยืนยันตัวตนระหว่างบริการ
- [ ] ใช้ Key Vault ในการเก็บการกำหนดค่าที่ละเอียดอ่อน
- [ ] จำกัดการเข้าถึงเครือข่ายอย่างเหมาะสม
- [ ] เปิดใช้งานการตรวจสอบและการบันทึก

## Module 5: Converting Your Own AI Application

### ขั้นตอนที่ 5.1: ใบงานการประเมิน

**ก่อนแปลงแอปของคุณ** ให้ตอบคำถามเหล่านี้:

1. **สถาปัตยกรรมแอปพลิเคชัน:**
   - แอปของคุณใช้บริการ AI ใดบ้าง?
   - ต้องการทรัพยากรคอมพิวต์อะไรบ้าง?
   - จำเป็นต้องมีฐานข้อมูลหรือไม่?
   - มีการพึ่งพาระหว่างบริการอย่างไร?

2. **ข้อกำหนดด้านความปลอดภัย:**
   - แอปของคุณจัดการข้อมูลที่ละเอียดอ่อนอะไรบ้าง?
   - มีข้อกำหนดด้านการปฏิบัติตามข้อกำหนดใดบ้าง?
   - จำเป็นต้องมีเครือข่ายส่วนตัวหรือไม่?

3. **ข้อกำหนดการปรับขนาด:**
   - ปริมาณงานที่คาดหวังคือเท่าใด?
   - ต้องการการปรับสเกลอัตโนมัติหรือไม่?
   - มีข้อกำหนดด้านภูมิภาคหรือไม่?

### ขั้นตอนที่ 5.2: สร้างเทมเพลต AZD ของคุณ

**ทำตามรูปแบบนี้เพื่อแปลงแอปของคุณ:**

1. **สร้างโครงสร้างพื้นฐานพื้นฐาน:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# เริ่มต้นเทมเพลต AZD
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

### **Lab Exercise 5.1: Template Creation Challenge**

**ความท้าทาย**: สร้างเทมเพลต AZD สำหรับแอป AI ประมวลผลเอกสาร

**ข้อกำหนด:**
- Azure OpenAI สำหรับการวิเคราะห์เนื้อหา
- Document Intelligence สำหรับ OCR
- Storage Account สำหรับอัปโหลดเอกสาร
- Function App สำหรับตรรกะการประมวลผล
- เว็บแอปสำหรับอินเทอร์เฟซผู้ใช้

**คะแนนโบนัส:**
- เพิ่มการจัดการข้อผิดพลาดที่เหมาะสม
- รวมการประเมินต้นทุน
- ตั้งค่าพอร์ทัลการตรวจสอบ

## Module 6: Troubleshooting Common Issues

### ปัญหาการปรับใช้ที่พบบ่อย

#### Issue 1: OpenAI Service Quota Exceeded
**อาการ:** การปรับใช้ล้มเหลวด้วยข้อผิดพลาดโควต้า
**วิธีแก้ไข:**
```bash
# ตรวจสอบโควตาปัจจุบัน
az cognitiveservices usage list --location eastus

# ขอเพิ่มโควตาหรือลองใช้ภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**อาการ:** การตอบสนองของ AI ล้มเหลวหรือเกิดข้อผิดพลาดในการปรับใช้โมเดล
**วิธีแก้ไข:**
```bash
# ตรวจสอบความพร้อมใช้งานของโมเดลตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเป็นโมเดลที่มีให้ใช้งาน
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**อาการ:** ข้อผิดพลาด 403 Forbidden เมื่อเรียกใช้บริการ AI
**วิธีแก้ไข:**
```bash
# ตรวจสอบการมอบหมายบทบาท
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# เพิ่มบทบาทที่ขาดหายไป
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### ปัญหาประสิทธิภาพ

#### Issue 4: Slow AI Responses
**ขั้นตอนการตรวจสอบ:**
1. ตรวจสอบ Application Insights สำหรับเมตริกประสิทธิภาพ
2. ทบทวนเมตริกของบริการ OpenAI ในพอร์ทัล Azure
3. ยืนยันการเชื่อมต่อเครือข่ายและความหน่วงเวลา

**วิธีแก้ไข:**
- นำการแคชไปใช้สำหรับคำค้นที่ใช้บ่อย
- ใช้โมเดล OpenAI ที่เหมาะสมกับกรณีใช้งานของคุณ
- พิจารณาใช้ read replicas สำหรับสถานการณ์ที่มีภาระสูง

### **Lab Exercise 6.1: Debugging Challenge**

**สถานการณ์**: การปรับใช้สำเร็จ แต่แอปพลิเคชันส่งคืนข้อผิดพลาด 500

**งานสำหรับการดีบัก:**
1. ตรวจสอบบันทึกแอปพลิเคชัน
2. ยืนยันการเชื่อมต่อระหว่างบริการ
3. ทดสอบการยืนยันตัวตน
4. ทบทวนการกำหนดค่า

**เครื่องมือที่ใช้:**
- `azd show` สำหรับภาพรวมการปรับใช้
- พอร์ทัล Azure สำหรับบันทึกรายละเอียดของบริการ
- Application Insights สำหรับเทเลเมทรีของแอปพลิเคชัน

## Module 7: Monitoring and Optimization

### ขั้นตอนที่ 7.1: ตั้งค่าการตรวจสอบแบบครบวงจร

1. **สร้างแดชบอร์ดที่กำหนดเอง:**

ไปที่พอร์ทัล Azure และสร้างแดชบอร์ดที่มี:
- จำนวนคำขอและความหน่วงของ OpenAI
- อัตราข้อผิดพลาดของแอปพลิเคชัน
- การใช้งานทรัพยากร
- การติดตามต้นทุน

2. **ตั้งค่าแจ้งเตือน:**
```bash
# เตือนเมื่ออัตราข้อผิดพลาดสูง
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### ขั้นตอนที่ 7.2: การเพิ่มประสิทธิภาพต้นทุน

1. **วิเคราะห์ต้นทุนปัจจุบัน:**
```bash
# ใช้ Azure CLI เพื่อดึงข้อมูลค่าใช้จ่าย
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **นำการควบคุมต้นทุนไปใช้:**
- ตั้งค่าแจ้งเตือนงบประมาณ
- ใช้นโยบายการปรับสเกลอัตโนมัติ
- นำการแคชคำขอไปใช้
- ตรวจสอบการใช้โทเค็นสำหรับ OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**งาน**: ปรับแต่งแอป AI ของคุณทั้งด้านประสิทธิภาพและต้นทุน

**เมตริกที่ต้องปรับปรุง:**
- ลดเวลาเฉลี่ยตอบสนองลง 20%
- ลดต้นทุนรายเดือนลง 15%
- รักษาเวลาให้บริการ 99.9%

**กลยุทธ์ที่ควรลอง:**
- นำการแคชการตอบกลับไปใช้
- ปรับแต่ง prompts เพื่อประสิทธิภาพโทเค็น
- ใช้ SKU คอมพิวต์ที่เหมาะสม
- ตั้งค่าการปรับสเกลอัตโนมัติอย่างเหมาะสม

## ความท้าทายสุดท้าย: การนำไปใช้แบบ End-to-End

### สถานการณ์ความท้าทาย

คุณได้รับมอบหมายให้สร้างแชทบอทให้บริการลูกค้าที่พร้อมสำหรับการผลิตด้วยข้อกำหนดเหล่านี้:

**ข้อกำหนดเชิงหน้าที่:**
- อินเทอร์เฟซเว็บสำหรับการโต้ตอบกับลูกค้า
- การผสานรวมกับ Azure OpenAI สำหรับการตอบกลับ
- ความสามารถในการค้นหาเอกสารโดยใช้ Cognitive Search
- การผสานรวมกับฐานข้อมูลลูกค้าที่มีอยู่
- รองรับหลายภาษา

**ข้อกำหนดเชิงไม่ใช้งาน:** 
- รองรับผู้ใช้งานพร้อมกัน 1000 คน
- SLA 99.9% uptime
- ปฏิบัติตาม SOC 2
- ต้นทุนต่ำกว่า $500/เดือน
- ปรับใช้ไปยังหลายสภาพแวดล้อม (dev, staging, prod)

### ขั้นตอนการนำไปใช้

1. **ออกแบบสถาปัตยกรรม**
2. **สร้างเทมเพลต AZD**
3. **นำมาตรการด้านความปลอดภัยไปใช้**
4. **ตั้งค่าการตรวจสอบและการแจ้งเตือน**
5. **สร้างพายไลน์การปรับใช้**
6. **จัดทำเอกสารโซลูชัน**

### เกณฑ์การประเมิน

- ✅ **ฟังก์ชันการทำงาน**: ตรงตามข้อกำหนดทั้งหมดหรือไม่?
- ✅ **ความปลอดภัย**: นำแนวปฏิบัติที่ดีที่สุดไปใช้หรือไม่?
- ✅ **ความสามารถในการปรับขนาด**: สามารถรองรับภาระงานได้หรือไม่?
- ✅ **ความสามารถในการบำรุงรักษา**: โค้ดและโครงสร้างพื้นฐานจัดระเบียบดีหรือไม่?
- ✅ **ต้นทุน**: อยู่ในงบประมาณหรือไม่?

## แหล่งข้อมูลเพิ่มเติม

### เอกสารของ Microsoft
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [เอกสาร Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [เอกสาร Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### ต้นแบบตัวอย่าง
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### แหล่งชุมชน
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ใบรับรองความสำเร็จ
ขอแสดงความยินดี! คุณได้ทำห้องปฏิบัติการ AI Workshop เสร็จเรียบร้อยแล้ว คุณควรจะสามารถ:

- ✅ แปลงแอปพลิเคชัน AI ที่มีอยู่เป็นเทมเพลต AZD
- ✅ ปรับใช้แอปพลิเคชัน AI ที่พร้อมใช้งานจริง
- ✅ นำแนวปฏิบัติด้านความปลอดภัยที่ดีที่สุดไปใช้กับงาน AI
- ✅ ตรวจติดตามและปรับปรุงประสิทธิภาพของแอปพลิเคชัน AI
- ✅ แก้ไขปัญหาการปรับใช้ที่พบบ่อย

### ขั้นตอนถัดไป
1. นำรูปแบบเหล่านี้ไปใช้กับโครงการ AI ของคุณเอง
2. ส่งเทมเพลตกลับไปยังชุมชน
3. เข้าร่วม Microsoft Foundry Discord เพื่อรับการสนับสนุนอย่างต่อเนื่อง
4. สำรวจหัวข้อขั้นสูง เช่น การปรับใช้ในหลายภูมิภาค

---

**คำติชมเกี่ยวกับเวิร์กช็อป**: ช่วยเราปรับปรุงเวิร์กช็อปนี้โดยแบ่งปันประสบการณ์ของคุณใน [ช่อง #Azure ของ Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**การนำทางบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาโดยมุ่งเน้น AI
- **⬅️ ก่อนหน้า**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **➡️ ถัดไป**: [แนวปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต](production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมชุมชนของเราเพื่อขอความช่วยเหลือและร่วมอภิปรายเกี่ยวกับ AZD และการปรับใช้ AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิด:
เอกสารฉบับนี้แปลโดยใช้บริการแปลด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อนได้ เอกสารต้นฉบับในภาษาต้นทางควรถูกถือเป็นแหล่งอ้างอิงที่เป็นทางการ สำหรับข้อมูลสำคัญ ขอแนะนำให้ใช้การแปลโดยผู้เชี่ยวชาญมนุษย์ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใด ๆ ที่เกิดจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->