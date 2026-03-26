# AI Workshop Lab: ทำให้โซลูชัน AI ของคุณสามารถใช้งานร่วมกับ AZD ได้

**การนำทางบทความ:**
- **📚 หน้าแรกของคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ ก่อนหน้า**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ ถัดไป**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การตั้งค่า](../chapter-03-configuration/configuration.md)

## ภาพรวมของ Workshop

แลปลงมือปฏิบัตินี้แนะนำให้ผู้พัฒนาผ่านกระบวนการนำแม่แบบ AI ที่มีอยู่แล้วไปใช้งานจริงโดยใช้ Azure Developer CLI (AZD) คุณจะได้เรียนรู้รูปแบบสำคัญสำหรับการนำ AI เข้าสู่ผลิตภัณฑ์จริงโดยใช้บริการ Microsoft Foundry

**ระยะเวลา:** 2-3 ชั่วโมง  
**ระดับ:** ระดับกลาง  
**ข้อกำหนดเบื้องต้น:** ความรู้พื้นฐานของ Azure, ความคุ้นเคยกับแนวคิด AI/ML

## 🎓 วัตถุประสงค์การเรียนรู้

เมื่อสิ้นสุดเวิร์กช็อปนี้ คุณจะสามารถ:  
- ✅ แปลงแอปพลิเคชัน AI ที่มีอยู่แล้วให้ใช้แม่แบบ AZD  
- ✅ กำหนดค่าบริการ Microsoft Foundry ด้วย AZD  
- ✅ ใช้การจัดการข้อมูลรับรองที่ปลอดภัยสำหรับบริการ AI  
- ✅ นำแอปพลิเคชัน AI ที่พร้อมใช้งานจริงพร้อมระบบตรวจสอบผล  
- ✅ แก้ไขปัญหาทั่วไปในการปรับใช้งาน AI

## ข้อกำหนดเบื้องต้น

### เครื่องมือที่ต้องใช้
- ติดตั้ง [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- ติดตั้ง [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)  
- ติดตั้ง [Git](https://git-scm.com/)  
- ตัวแก้ไขโค้ด (แนะนำ VS Code)

### ทรัพยากร Azure
- มีสิทธิ์ Contributor ใน subscription ของ Azure  
- การเข้าถึงบริการ Microsoft Foundry Models (หรือสามารถขอสิทธิ์ได้)  
- สิทธิ์สร้างกลุ่มทรัพยากร (Resource group)

### ความรู้เบื้องต้น
- ความเข้าใจพื้นฐานเกี่ยวกับบริการ Azure  
- คุ้นเคยกับอินเทอร์เฟซบรรทัดคำสั่ง  
- แนวคิดพื้นฐาน AI/ML (API, โมเดล, prompt)

## การตั้งค่าแลป

### ขั้นตอนที่ 1: การเตรียมสภาพแวดล้อม

1. **ตรวจสอบการติดตั้งเครื่องมือ:**  
```bash
# ตรวจสอบการติดตั้ง AZD
azd version

# ตรวจสอบ Azure CLI
az --version

# ลงชื่อเข้าใช้ Azure
az login
azd auth login
```
  
2. **โคลนรีโพสิทอรีเวิร์กช็อป:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## โมดูล 1: ทำความเข้าใจโครงสร้าง AZD สำหรับแอป AI

### โครงสร้างแม่แบบ AI AZD

สำรวจไฟล์สำคัญในแม่แบบ AZD ที่พร้อมใช้งานสำหรับ AI:

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
  
### **แบบฝึกหัดแลป 1.1: สำรวจการตั้งค่า**

1. **ตรวจสอบไฟล์ azure.yaml:**  
```bash
cat azure.yaml
```
  
**สิ่งที่ควรมองหา:**  
- คำนิยามบริการของส่วนประกอบ AI  
- การเชื่อมโยงตัวแปรสภาพแวดล้อม  
- การตั้งค่าฮอสต์  

2. **ทบทวนโครงสร้างพื้นฐาน main.bicep:**  
```bash
cat infra/main.bicep
```
  
**รูปแบบ AI สำคัญที่ควรระบุ:**  
- การจัดเตรียมบริการ Microsoft Foundry Models  
- การผนวก Cognitive Search  
- การจัดการคีย์อย่างปลอดภัย  
- การตั้งค่าความปลอดภัยเครือข่าย  

### **ประเด็นอภิปราย:** ทำไมรูปแบบเหล่านี้จึงสำคัญสำหรับ AI

- **การพึ่งพาบริการ:** แอป AI มักต้องใช้บริการหลายตัวพร้อมกัน  
- **ความปลอดภัย:** คีย์ API และจุดเชื่อมต่อจำเป็นต้องมีการจัดการอย่างปลอดภัย  
- **ความสามารถในการขยายตัว:** งาน AI มีความต้องการการปรับขนาดเฉพาะ  
- **การจัดการต้นทุน:** บริการ AI อาจมีค่าใช้จ่ายสูงถ้าไม่ได้ตั้งค่าอย่างเหมาะสม  

## โมดูล 2: นำแอป AI แรกของคุณขึ้นใช้งาน

### ขั้นตอน 2.1: เริ่มต้นสภาพแวดล้อม

1. **สร้างสภาพแวดล้อม AZD ใหม่:**  
```bash
azd env new myai-workshop
```
  
2. **ตั้งค่าพารามิเตอร์ที่ต้องการ:**  
```bash
# ตั้งค่าเขต Azure ที่คุณต้องการ
azd env set AZURE_LOCATION eastus

# ตัวเลือก: ตั้งค่าโมเดล OpenAI เฉพาะเจาะจง
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```
  
### ขั้นตอน 2.2: นำโครงสร้างพื้นฐานและแอปพลิเคชันขึ้นใช้งาน

1. **นำขึ้นใช้งานด้วย AZD:**  
```bash
azd up
```
  
**สิ่งที่จะเกิดขึ้นระหว่าง `azd up`:**  
- ✅ จัดเตรียมบริการ Microsoft Foundry Models  
- ✅ สร้างบริการ Cognitive Search  
- ✅ ตั้งค่า App Service สำหรับเว็บแอป  
- ✅ ตั้งค่าเครือข่ายและความปลอดภัย  
- ✅ นำโค้ดแอปพลิเคชันขึ้นใช้งาน  
- ✅ ตั้งค่าการตรวจสอบและบันทึกข้อมูล  

2. **ติดตามความคืบหน้าการใช้งาน** และสังเกตทรัพยากรที่ถูกสร้าง

### ขั้นตอน 2.3: ตรวจสอบการนำขึ้นใช้งาน

1. **ตรวจสอบทรัพยากรที่นำขึ้นใช้งาน:**  
```bash
azd show
```
  
2. **เปิดแอปพลิเคชันที่นำขึ้นใช้งาน:**  
```bash
azd show --output json | grep "webAppUrl"
```
  
3. **ทดสอบฟังก์ชันการทำงาน AI:**  
   - เยี่ยมชมเว็บแอป  
   - ลองคำค้นตัวอย่าง  
   - ตรวจสอบว่า AI ตอบสนองอย่างถูกต้อง  

### **แบบฝึกหัดแลป 2.1: ฝึกแก้ไขปัญหา**

**สถานการณ์:** การนำขึ้นใช้งานสำเร็จแต่ AI ไม่ตอบกลับ

**ปัญหาทั่วไปที่ต้องตรวจสอบ:**  
1. **คีย์ API OpenAI:** ตรวจสอบว่าตั้งค่าอย่างถูกต้อง  
2. **การมีอยู่ของโมเดล:** ตรวจสอบว่าโซนของคุณรองรับโมเดลนั้น  
3. **การเชื่อมต่อเครือข่าย:** ตรวจสอบว่าบริการสามารถสื่อสารกันได้  
4. **สิทธิ์ RBAC:** ตรวจสอบว่าแอปเข้าถึง OpenAI ได้  

**คำสั่งสำหรับดีบัก:**  
```bash
# ตรวจสอบตัวแปรสภาพแวดล้อม
azd env get-values

# ดูบันทึกการติดตั้งใช้งาน
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# ตรวจสอบสถานะการติดตั้งใช้งาน OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## โมดูล 3: ปรับแต่งแอป AI ตามความต้องการ

### ขั้นตอน 3.1: แก้ไขการตั้งค่า AI

1. **อัปเดตโมเดล OpenAI:**  
```bash
# เปลี่ยนเป็นโมเดลอื่น (ถ้ามีในพื้นที่ของคุณ)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# ติดตั้งใหม่ด้วยการตั้งค่าใหม่
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
  
### ขั้นตอน 3.2: การตั้งค่าสภาพแวดล้อมเฉพาะ

**แนวทางปฏิบัติที่ดีที่สุด:** ตั้งค่าต่างกันสำหรับการพัฒนาและการผลิต

1. **สร้างสภาพแวดล้อมสำหรับการผลิต:**  
```bash
azd env new myai-production
```
  
2. **ตั้งค่าพารามิเตอร์เฉพาะของการผลิต:**  
```bash
# การผลิตโดยทั่วไปใช้ SKU ที่สูงกว่า
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# เปิดใช้งานคุณสมบัติด้านความปลอดภัยเพิ่มเติม
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **แบบฝึกหัดแลป 3.1: การปรับค่าใช้จ่าย**

**ความท้าทาย:** กำหนดค่าแม่แบบให้คุ้มค่าต่อการพัฒนา

**งานที่ต้องทำ:**  
1. ระบุ SKU ที่สามารถตั้งค่าเป็นแบบฟรี/พื้นฐานได้  
2. กำหนดตัวแปรสภาพแวดล้อมสำหรับต้นทุนต่ำสุด  
3. นำขึ้นใช้งานและเปรียบเทียบต้นทุนกับการตั้งค่าผลิตจริง

**คำแนะนำ:**  
- ใช้ tier F0 (ฟรี) สำหรับ Cognitive Services เมื่อเป็นไปได้  
- ใช้ tier Basic สำหรับ Search Service ในสภาพแวดล้อมพัฒนา  
- พิจารณาใช้แผน Consumption สำหรับ Functions  

## โมดูล 4: ความปลอดภัยและแนวปฏิบัติที่ดีที่สุดสำหรับการใช้งานจริง

### ขั้นตอน 4.1: การจัดการข้อมูลรับรองอย่างปลอดภัย

**ความท้าทายปัจจุบัน:** แอป AI หลายตัวใช้คีย์ API แบบฝังโค้ดหรือเก็บในที่ไม่ปลอดภัย

**โซลูชัน AZD:** การใช้ Managed Identity + การผนวกกับ Key Vault

1. **ทบทวนการตั้งค่าความปลอดภัยในแม่แบบของคุณ:**  
```bash
# ค้นหาการกำหนดค่า Key Vault และ Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **ตรวจสอบว่า Managed Identity ทำงานได้:**  
```bash
# ตรวจสอบว่าแอปเว็บมีการกำหนดตัวตนที่ถูกต้องหรือไม่
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### ขั้นตอน 4.2: ความปลอดภัยเครือข่าย

1. **เปิดใช้งาน private endpoints** (ถ้ายังไม่ได้ตั้งค่า):

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
  
### ขั้นตอน 4.3: การตรวจสอบและการมองเห็นระบบ

1. **ตั้งค่า Application Insights:**  
```bash
# ควรตั้งค่า Application Insights โดยอัตโนมัติ
# ตรวจสอบการตั้งค่า:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **ตั้งค่าการตรวจสอบเฉพาะ AI:**

เพิ่มเมตริกส์กำหนดเองสำหรับการดำเนินงาน AI:  
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
  
### **แบบฝึกหัดแลป 4.1: ตรวจสอบความปลอดภัย**

**งาน:** ทบทวนการนำขึ้นใช้งานของคุณตามแนวปฏิบัติความปลอดภัยที่ดีที่สุด

**รายการตรวจสอบ:**  
- [ ] ไม่มีความลับฝังในโค้ดหรือการตั้งค่า  
- [ ] ใช้ Managed Identity สำหรับการยืนยันตัวตนบริการต่อบริการ  
- [ ] Key Vault เก็บการตั้งค่าที่มีความอ่อนไหว  
- [ ] จำกัดการเข้าถึงเครือข่ายอย่างเหมาะสม  
- [ ] เปิดใช้งานการตรวจสอบและบันทึกข้อมูล  

## โมดูล 5: การแปลงแอป AI ของคุณเอง

### ขั้นตอน 5.1: แบบประเมิน

**ก่อนแปลงแอปของคุณ** โปรดตอบคำถามต่อไปนี้:

1. **สถาปัตยกรรมแอปพลิเคชัน:**  
   - แอปของคุณใช้บริการ AI อะไรบ้าง?  
   - ต้องการทรัพยากรคอมพิวเตอร์แบบไหน?  
   - ต้องการฐานข้อมูลหรือไม่?  
   - การพึ่งพาระหว่างบริการเป็นอย่างไร?  

2. **ข้อกำหนดด้านความปลอดภัย:**  
   - แอปของคุณจัดการข้อมูลที่มีความอ่อนไหวอะไรบ้าง?  
   - มีข้อกำหนดด้าน compliance ใด?  
   - ต้องการเครือข่ายส่วนตัวหรือไม่?  

3. **ข้อกำหนดการปรับขนาด:**  
   - คาดการณ์โหลดอย่างไร?  
   - ต้องการ auto-scaling หรือไม่?  
   - มีข้อกำหนดด้านพื้นที่หรือภูมิภาคหรือไม่?  

### ขั้นตอน 5.2: สร้างแม่แบบ AZD ของคุณ

**ปฏิบัติตามรูปแบบนี้เพื่อแปลงแอปของคุณ:**

1. **สร้างโครงสร้างพื้นฐานพื้นฐาน:**  
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
- Microsoft Foundry Models สำหรับวิเคราะห์เนื้อหา  
- Document Intelligence สำหรับ OCR  
- Storage Account สำหรับอัปโหลดเอกสาร  
- Function App สำหรับตรรกะประมวลผล  
- เว็บแอปสำหรับส่วนติดต่อผู้ใช้  

**คะแนนโบนัส:**  
- เพิ่มการจัดการข้อผิดพลาดอย่างเหมาะสม  
- รวมการประมาณต้นทุน  
- ตั้งค่าดาชบอร์ดตรวจสอบระบบ  

## โมดูล 6: การแก้ไขปัญหาที่พบบ่อย

### ปัญหาที่พบบ่อยในการนำขึ้นใช้งาน

#### ปัญหา 1: โควต้าบริการ OpenAI เกินขีดจำกัด  
**อาการ:** การนำขึ้นใช้งานล้มเหลวพร้อมข้อความโควต้าเกิน  
**แนวทางแก้ไข:**  
```bash
# ตรวจสอบโควต้าปัจจุบัน
az cognitiveservices usage list --location eastus

# ขอเพิ่มโควต้าหรือลองใช้ภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up
```
  
#### ปัญหา 2: โมเดลไม่พร้อมใช้งานในพื้นที่  
**อาการ:** AI ตอบสนองล้มเหลวหรือมีข้อผิดพลาดในการนำโมเดลขึ้นใช้งาน  
**แนวทางแก้ไข:**  
```bash
# ตรวจสอบความพร้อมใช้งานของโมเดลตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเป็นโมเดลที่มีให้ใช้งาน
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```
  
#### ปัญหา 3: ปัญหาสิทธิ์การเข้าถึง  
**อาการ:** ข้อผิดพลาด 403 Forbidden เมื่อเรียกใช้บริการ AI  
**แนวทางแก้ไข:**  
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

#### ปัญหา 4: AI ตอบกลับช้า  
**ขั้นตอนการสืบสวน:**  
1. ตรวจสอบข้อมูลเมตริกประสิทธิภาพใน Application Insights  
2. ทบทวนเมตริกบริการ OpenAI ในพอร์ทัล Azure  
3. ตรวจสอบการเชื่อมต่อเครือข่ายและความหน่วงเวลา  

**แนวทางแก้ไข:**  
- ใช้การแคชสำหรับคำค้นหาที่ใช้บ่อย  
- ใช้โมเดล OpenAI ที่เหมาะสมกับกรณีการใช้งานของคุณ  
- พิจารณาสร้างรีพลิกาอ่านสำหรับสภาวะโหลดสูง  

### **แบบฝึกหัดแลป 6.1: ความท้าทายการดีบัก**

**สถานการณ์:** การนำขึ้นใช้งานสำเร็จ แต่แอปส่งคืนข้อผิดพลาด 500

**งานดีบัก:**  
1. ตรวจสอบบันทึกแอปพลิเคชัน  
2. ตรวจสอบการเชื่อมต่อบริการ  
3. ทดสอบการยืนยันตัวตน  
4. ทบทวนการตั้งค่า  

**เครื่องมือที่ใช้:**  
- `azd show` สำหรับภาพรวมการนำขึ้นใช้งาน  
- พอร์ทัล Azure สำหรับบันทึกรายละเอียดของบริการ  
- Application Insights สำหรับเทเลเมทรีแอปพลิเคชัน  

## โมดูล 7: การตรวจสอบและปรับแต่ง

### ขั้นตอน 7.1: ตั้งค่าการตรวจสอบเชิงลึก

1. **สร้างแดชบอร์ดกำหนดเอง:**

ไปที่พอร์ทัล Azure และสร้างแดชบอร์ดพร้อม:  
- จำนวนและความหน่วงเวลาในการร้องขอ OpenAI  
- อัตราข้อผิดพลาดของแอป  
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
  
### ขั้นตอน 7.2: การปรับค่าใช้จ่าย

1. **วิเคราะห์ค่าใช้จ่ายปัจจุบัน:**  
```bash
# ใช้ Azure CLI เพื่อรับข้อมูลค่าใช้จ่าย
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **ใช้การควบคุมค่าใช้จ่าย:**  
- ตั้งค่าการแจ้งเตือนงบประมาณ  
- ใช้นโยบายการปรับขนาดอัตโนมัติ  
- ใช้แคชสำหรับคำร้องขอ  
- ติดตามการใช้โทเค็นสำหรับ OpenAI  

### **แบบฝึกหัดแลป 7.1: การปรับปรุงประสิทธิภาพ**

**งาน:** ปรับปรุงแอป AI ของคุณทั้งด้านประสิทธิภาพและต้นทุน

**เมตริกที่ต้องปรับปรุง:**  
- ลดเวลาเฉลี่ยการตอบกลับลง 20%  
- ลดต้นทุนรายเดือนลง 15%  
- รักษาระดับเวลาการให้บริการ 99.9%  

**กลยุทธ์ที่ควรลอง:**  
- ใช้การแคชตอบกลับ  
- ปรับ prompt ให้ประหยัดโทเค็น  
- ใช้ SKU คำนวณที่เหมาะสม  
- ตั้งค่าสเกลอัตโนมัติอย่างเหมาะสม  

## ความท้าทายสุดท้าย: การนำไปใช้งานครบวงจร

### สถานการณ์ความท้าทาย

คุณได้รับมอบหมายให้สร้างแชทบอท AI สำหรับบริการลูกค้าที่พร้อมใช้งานจริงโดยมีข้อกำหนดดังนี้:

**ข้อกำหนดฟังก์ชัน:**  
- อินเทอร์เฟซเว็บสำหรับปฏิสัมพันธ์กับลูกค้า  
- รวม Microsoft Foundry Models สำหรับการตอบสนอง  
- ความสามารถค้นหาเอกสารด้วย Cognitive Search  
- รวมฐานข้อมูลลูกค้าที่มีอยู่  
- รองรับหลายภาษา  

**ข้อกำหนดที่ไม่ใช่ฟังก์ชัน:**  
- รองรับผู้ใช้พร้อมกัน 1000 คน  
- SLA 99.9% uptime  
- ปฏิบัติตาม SOC 2  
- ค่าใช้จ่ายไม่เกิน $500/เดือน  
- นำไปใช้งานหลายสภาพแวดล้อม (dev, staging, prod)  

### ขั้นตอนการนำไปใช้

1. **ออกแบบสถาปัตยกรรม**  
2. **สร้างแม่แบบ AZD**  
3. **นำมาตรการความปลอดภัยมาใช้**  
4. **ตั้งค่าการตรวจสอบและแจ้งเตือน**  
5. **สร้าง pipeline การนำขึ้นใช้งาน**  
6. **จัดทำเอกสารโซลูชัน**  

### เกณฑ์การประเมิน

- ✅ **ฟังก์ชันการทำงาน:** ครบถ้วนตามข้อกำหนดหรือไม่?  
- ✅ **ความปลอดภัย:** นำแนวปฏิบัติที่ดีที่สุดไปใช้หรือไม่?  
- ✅ **การปรับขนาด:** รองรับโหลดตามต้องการหรือไม่?  
- ✅ **การบำรุงรักษา:** โค้ดและโครงสร้างพื้นฐานจัดการอย่างดีหรือไม่?  
- ✅ **ค่าใช้จ่าย:** อยู่ภายใต้งบประมาณหรือไม่?  

## แหล่งข้อมูลเพิ่มเติม

### เอกสารของ Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)  

### แม่แบบตัวอย่าง
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)  
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)  

### แหล่งข้อมูลชุมชน
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)  
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)  

## 🎓 ใบประกาศนียบัตรการสำเร็จ

ขอแสดงความยินดี! คุณได้ทำเวิร์กช็อป AI Workshop Lab เสร็จสมบูรณ์แล้ว ตอนนี้คุณควรจะสามารถ:
- ✅ แปลงแอปพลิเคชัน AI ที่มีอยู่เป็นเทมเพลต AZD
- ✅ ปรับใช้แอปพลิเคชัน AI ที่พร้อมใช้งานในสภาพแวดล้อมการผลิต
- ✅ ใช้แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัยสำหรับภาระงาน AI
- ✅ ตรวจสอบและปรับประสิทธิภาพของแอปพลิเคชัน AI
- ✅ แก้ไขปัญหาทั่วไปในการปรับใช้

### ขั้นตอนถัดไป
1. นำแพตเทิร์นเหล่านี้ไปใช้กับโครงการ AI ของคุณเอง
2. ร่วมส่งเทมเพลตกลับไปยังชุมชน
3. เข้าร่วม Microsoft Foundry Discord เพื่อรับการสนับสนุนอย่างต่อเนื่อง
4. สำรวจหัวข้อขั้นสูง เช่น การปรับใช้หลายภูมิภาค

---

**ข้อเสนอแนะจากการอบรม**: ช่วยเราปรับปรุงการอบรมนี้โดยการแบ่งปันประสบการณ์ของคุณในช่อง [Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure)

---

**การนำทางบทเรียน:**
- **📚 หน้าหลักหลักสูตร**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาแบบ AI-First
- **⬅️ ก่อนหน้า**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **➡️ ถัดไป**: [แนวปฏิบัติที่ดีที่สุดสำหรับ AI ในสภาพแวดล้อมการผลิต](production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมชุมชนของเราเพื่อขอรับการสนับสนุนและอภิปรายเกี่ยวกับ AZD และการปรับใช้ AI

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**คำปฏิเสธความรับผิดชอบ**:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลโดยมนุษย์มืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->