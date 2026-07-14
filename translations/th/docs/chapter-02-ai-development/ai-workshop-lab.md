# AI Workshop Lab: การทำให้โซลูชัน AI ของคุณพร้อมสำหรับการ deploy ด้วย AZD  

**การนำทางบทเรียน:**  
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)  
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาแบบ AI-First  
- **⬅️ ก่อนหน้า**: [การ deploy โมเดล AI](ai-model-deployment.md)  
- **➡️ ถัดไป**: [แนวปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต](production-ai-practices.md)  
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)  

## ภาพรวมเวิร์กช็อป  

แลปเชิงปฏิบัติการนี้จะแนะนำให้นักพัฒนาผ่านกระบวนการนำเทมเพลต AI ที่มีอยู่แล้วมา deploy โดยใช้ Azure Developer CLI (AZD) คุณจะได้เรียนรู้รูปแบบสำคัญสำหรับการ deploy AI ในการผลิตโดยใช้บริการ Microsoft Foundry  

> **หมายเหตุการตรวจสอบ (2026-07-13):** เวิร์กช็อปนี้ได้รับการทบทวนโดยใช้ `azd` เวอร์ชัน `1.27.1` หากการติดตั้งของคุณเวอร์ชันเก่ากว่า กรุณาอัปเดต AZD ก่อนเริ่ม เพื่อให้การทำงานของการยืนยันตัวตน, เทมเพลต และเวิร์กโฟลว์การ deploy ตรงตามขั้นตอนด้านล่าง  

**ระยะเวลา:** 2-3 ชั่วโมง  
**ระดับ:** ระดับกลาง  
**ข้อกำหนดเบื้องต้น:** ความรู้พื้นฐานของ Azure, คุ้นเคยกับแนวคิด AI/ML  

## 🎓 วัตถุประสงค์การเรียนรู้  

เมื่อจบเวิร์กช็อปนี้ คุณจะสามารถ:  
- ✅ แปลงแอปพลิเคชัน AI ที่มีอยู่ให้ใช้เทมเพลต AZD  
- ✅ กำหนดค่าบริการ Microsoft Foundry ด้วย AZD  
- ✅ นำแนวทางการจัดการข้อมูลรับรองอย่างปลอดภัยสำหรับบริการ AI ไปใช้  
- ✅ Deploy แอป AI ที่พร้อมใช้งานในผลิตจริงพร้อมระบบมอนิเตอร์  
- ✅ แก้ไขปัญหาทั่วไปในการ deploy AI  

## ข้อกำหนดเบื้องต้น  

### เครื่องมือที่ต้องใช้  
- ติดตั้ง [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- ติดตั้ง [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)  
- ติดตั้ง [Git](https://git-scm.com/)  
- ตัวแก้ไขโค้ด (แนะนำ VS Code)  

### ทรัพยากรใน Azure  
- มี subscription ของ Azure ที่มีสิทธิ์ contributor  
- สามารถเข้าถึงบริการ Microsoft Foundry Models (หรือสามารถขอเข้าถึงได้)  
- สิทธิ์สร้าง resource group  

### ความรู้เบื้องต้น  
- เข้าใจบริการ Azure พื้นฐาน  
- คุ้นเคยกับอินเตอร์เฟสคำสั่งแบบ command-line  
- เข้าใจแนวคิด AI/ML เบื้องต้น (API, โมเดล, prompts)  

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

# เข้าสู่ระบบ Azure CLI ก็ต่อเมื่อคุณวางแผนที่จะเรียกใช้คำสั่ง az ในระหว่างการวินิจฉัยเท่านั้น
az login
```
  
หากคุณทำงานกับหลาย tenant หรือ subscription ไม่ถูกตรวจจับโดยอัตโนมัติ ให้ลองใหม่ด้วยคำสั่ง `azd auth login --tenant-id <tenant-id>`  

2. **โคลน repository ของเวิร์กช็อปนี้:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## โมดูล 1: ทำความเข้าใจโครงสร้าง AZD สำหรับแอป AI  

### สาระสำคัญของเทมเพลต AI AZD  

สำรวจไฟล์สำคัญในเทมเพลต AZD ที่พร้อมใช้กับ AI:  

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
  
**สิ่งที่ควรมองหา:**  
- คำจำกัดความบริการสำหรับส่วนประกอบ AI  
- การจับคู่ตัวแปรสภาพแวดล้อม  
- การตั้งค่าโฮสต์  

2. **ทบทวนโครงสร้างพื้นฐาน main.bicep:**  
```bash
cat infra/main.bicep
```
  
**รูปแบบ AI สำคัญที่ควรระบุ:**  
- การ provision บริการ Microsoft Foundry Models  
- การผสานรวม Azure AI Search  
- การจัดการกุญแจอย่างปลอดภัย  
- การตั้งค่าความปลอดภัยเครือข่าย  

### **หัวข้ออภิปราย:** ทำไมรูปแบบเหล่านี้ถึงสำคัญสำหรับ AI  

- **การพึ่งพาบริการ:** แอป AI มักต้องการบริการหลายอย่างที่ต้องประสานงานกัน  
- **ความปลอดภัย:** คีย์ API และ endpoints ต้องมีการจัดการอย่างปลอดภัย  
- **ความสามารถในการขยาย:** ภาระงาน AI มีความต้องการในการขยายพิเศษ  
- **การจัดการค่าใช้จ่าย:** บริการ AI อาจมีค่าใช้จ่ายสูงหากไม่ตั้งค่าอย่างเหมาะสม  

## โมดูล 2: Deploy แอป AI ตัวแรกของคุณ  

### ขั้นตอน 2.1: เริ่มต้นสภาพแวดล้อม  

1. **สร้างสภาพแวดล้อม AZD ใหม่:**  
```bash
azd env new myai-workshop
```
  
2. **ตั้งค่าพารามิเตอร์ที่ต้องการ:**  
```bash
# ตั้งค่าโซนภูมิภาค Azure ที่คุณต้องการ
azd env set AZURE_LOCATION eastus

# ตัวเลือก: ตั้งค่าโมเดล OpenAI ที่เฉพาะเจาะจง
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### ขั้นตอน 2.2: Deploy โครงสร้างพื้นฐานและแอปพลิเคชัน  

1. **Deploy ด้วย AZD:**  
```bash
azd up
```
  
**สิ่งที่เกิดขึ้นระหว่าง `azd up`:**  
- ✅ Provision บริการ Microsoft Foundry Models  
- ✅ สร้างบริการ Azure AI Search  
- ✅ ตั้งค่า App Service สำหรับเว็บแอปพลิเคชัน  
- ✅ กำหนดค่าเครือข่ายและความปลอดภัย  
- ✅ Deploy โค้ดแอปพลิเคชัน  
- ✅ ตั้งค่าการมอนิเตอร์และการบันทึกโลคส์  

2. **มอนิเตอร์ความคืบหน้าการ deploy** และสังเกตทรัพยากรที่ถูกสร้าง  

### ขั้นตอน 2.3: ตรวจสอบการ deploy  

1. **ตรวจสอบทรัพยากรที่ deploy:**  
```bash
azd show
```
  
2. **เปิดแอปพลิเคชันที่ deploy แล้ว:**  
```bash
azd show
```
  
เปิด endpoint เว็บที่แสดงในผลลัพธ์ `azd show`  

3. **ทดสอบฟังก์ชัน AI:**  
   - ไปยังเว็บแอปพลิเคชัน  
   - ลองคำถามตัวอย่าง  
   - ตรวจสอบว่าการตอบสนอง AI ทำงานถูกต้อง  

### **แบบฝึกหัดแลป 2.1: ฝึกการแก้ไขปัญหา**  

**สถานการณ์**: การ deploy สำเร็จแต่ AI ไม่ตอบสนอง  

**ปัญหาทั่วไปที่ควรตรวจสอบ:**  
1. **คีย์ API ของ OpenAI:** ตรวจสอบให้ถูกตั้งค่าอย่างถูกต้อง  
2. **โมเดลที่รองรับ:** ตรวจสอบว่าโมเดลในภูมิภาคของคุณใช้งานได้  
3. **การเชื่อมต่อเครือข่าย:** ตรวจสอบว่าบริการสามารถสื่อสารกันได้  
4. **สิทธิ์ RBAC:** ตรวจสอบว่าแอปเข้าถึง OpenAI ได้  

**คำสั่งการ debug:**  
```bash
# ตรวจสอบตัวแปรสภาพแวดล้อม
azd env get-values

# ดูบันทึกการปรับใช้
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# ตรวจสอบสถานะการปรับใช้ OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## โมดูล 3: ปรับแต่งแอป AI ของคุณให้เหมาะกับความต้องการ  

### ขั้นตอน 3.1: แก้ไขการกำหนดค่า AI  

1. **อัปเดตโมเดล OpenAI:**  
```bash
# เปลี่ยนไปใช้โมเดลอื่น (ถ้ามีให้บริการในพื้นที่ของคุณ)
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
  
### ขั้นตอน 3.2: การกำหนดค่าสำหรับแต่ละสภาพแวดล้อม  

**แนวทางปฏิบัติที่ดีที่สุด:** กำหนดค่าที่แตกต่างระหว่างการพัฒนาและการผลิต  

1. **สร้างสภาพแวดล้อมผลิต:**  
```bash
azd env new myai-production
```
  
2. **ตั้งค่าพารามิเตอร์สำหรับผลิต:**  
```bash
# การผลิตโดยปกติใช้ SKU ที่สูงกว่า
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# เปิดใช้งานฟีเจอร์ความปลอดภัยเพิ่มเติม
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **แบบฝึกหัดแลป 3.1: การเพิ่มประสิทธิภาพต้นทุน**  

**โจทย์:** กำหนดค่าเทมเพลตเพื่อพัฒนาอย่างประหยัดต้นทุน  

**งานที่ต้องทำ:**  
1. ระบุ SKU ที่สามารถตั้งเป็นฟรี/พื้นฐานได้  
2. กำหนดตัวแปรสภาพแวดล้อมเพื่อลดต้นทุนขั้นต่ำ  
3. Deploy และเปรียบเทียบต้นทุนกับการตั้งค่าผลิต  

**คำใบ้การแก้ปัญหา:**  
- ใช้ระดับ F0 (ฟรี) สำหรับบริการ Azure AI เมื่อเป็นไปได้  
- ใช้ระดับ Basic สำหรับ Search Service ในสภาพแวดล้อมพัฒนา  
- พิจารณาใช้แผน Consumption สำหรับฟังก์ชัน  

## โมดูล 4: ความปลอดภัยและแนวปฏิบัติที่ดีที่สุดในการผลิต  

### ขั้นตอน 4.1: การจัดการข้อมูลรับรองอย่างปลอดภัย  

**ความท้าทายในปัจจุบัน:** แอป AI หลายตัวใส่คีย์ API แบบ hardcode หรือใช้ที่เก็บข้อมูลที่ไม่ปลอดภัย  

**โซลูชัน AZD:** ใช้ Managed Identity + การผสานรวม Key Vault  

1. **ตรวจสอบการตั้งค่าความปลอดภัยในเทมเพลตของคุณ:**  
```bash
# ค้นหาการกำหนดค่า Key Vault และ Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **ยืนยันว่า Managed Identity ทำงาน:**  
```bash
# ตรวจสอบว่าเว็บแอปมีการตั้งค่าตัวตนที่ถูกต้องหรือไม่
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### ขั้นตอน 4.2: ความปลอดภัยเครือข่าย  

1. **เปิดใช้งาน private endpoints** (หากยังไม่ได้ตั้งค่า):  

เพิ่มลงในเทมเพลต bicep ของคุณ:  
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
  
### ขั้นตอน 4.3: การมอนิเตอร์และความสามารถในการสังเกต  

1. **กำหนดค่า Application Insights:**  
```bash
# ควรตั้งค่า Application Insights โดยอัตโนมัติ
# ตรวจสอบการตั้งค่า:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **ตั้งค่าการมอนิเตอร์เฉพาะ AI:**  

เพิ่มเมตริกกำหนดเองสำหรับการดำเนินงาน AI:  
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

**งาน:** ตรวจสอบการ deploy ของคุณตามแนวทางปฏิบัติความปลอดภัยที่ดีที่สุด  

**รายการตรวจสอบ:**  
- [ ] ไม่มีข้อมูลลับใดๆ ที่ถูกใส่ในโค้ดหรือการกำหนดค่าโดยตรง  
- [ ] ใช้ Managed Identity สำหรับการยืนยันตัวตนบริการต่อบริการ  
- [ ] Key Vault เก็บข้อมูลการกำหนดค่าที่สำคัญอย่างปลอดภัย  
- [ ] การเข้าถึงเครือข่ายถูกจำกัดอย่างเหมาะสม  
- [ ] เปิดใช้งานการมอนิเตอร์และบันทึก  

## โมดูล 5: การแปลงแอป AI ของคุณเอง  

### ขั้นตอน 5.1: แบบประเมิน  

**ก่อนที่จะแปลงแอปของคุณ** ให้ตอบคำถามเหล่านี้:  

1. **สถาปัตยกรรมแอป:**  
   - แอปของคุณใช้บริการ AI อะไรบ้าง?  
   - ต้องการทรัพยากรคำนวณใด?  
   - ต้องการฐานข้อมูลหรือไม่?  
   - การพึ่งพาระหว่างบริการเป็นอย่างไร?  

2. **ความต้องการด้านความปลอดภัย:**  
   - แอปของคุณจัดการข้อมูลลับใดบ้าง?  
   - คุณต้องปฏิบัติตามข้อกำหนดการปฏิบัติตามกฎหมายอะไร?  
   - คุณต้องการเครือข่ายส่วนตัวหรือไม่?  

3. **ความต้องการด้านการขยายตัว:**  
   - ภาระงานที่คาดหวังคือเท่าใด?  
   - คุณต้องการ auto-scaling หรือไม่?  
   - มีข้อกำหนดด้านภูมิภาคหรือไม่?  

### ขั้นตอน 5.2: สร้างเทมเพลต AZD ของคุณ  

**ทำตามรูปแบบนี้เพื่อแปลงแอปของคุณ:**  

1. **สร้างโครงสร้างพื้นฐานเบื้องต้น:**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# เริ่มต้นแม่แบบ AZD
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
  
### **แบบฝึกหัดแลป 5.1: ท้าทายการสร้างเทมเพลต**  

**โจทย์:** สร้างเทมเพลต AZD สำหรับแอป AI ประมวลผลเอกสาร  

**ข้อกำหนด:**  
- Microsoft Foundry Models สำหรับการวิเคราะห์เนื้อหา  
- Document Intelligence สำหรับ OCR  
- Storage Account สำหรับอัปโหลดเอกสาร  
- Function App สำหรับตรรกะการประมวลผล  
- เว็บแอปสำหรับอินเตอร์เฟสผู้ใช้  

**คะแนนพิเศษ:**  
- เพิ่มการจัดการข้อผิดพลาดที่เหมาะสม  
- รวมการประมาณค่าใช้จ่าย  
- ตั้งค่าดัชนีมอนิเตอร์  

## โมดูล 6: การแก้ไขปัญหาทั่วไป  

### ปัญหาการ deploy ที่พบบ่อย  

#### ปัญหา 1: เกินโควต้า OpenAI Service  
**อาการ:** การ deploy ล้มเหลวพร้อมข้อผิดพลาดโควต้า  
**วิธีแก้:**  
```bash
# ตรวจสอบโควตาปัจจุบัน
az cognitiveservices usage list --location eastus

# ขอเพิ่มโควตาหรือลองภูมิภาคอื่น
azd env set AZURE_LOCATION westus2
azd up
```
  
#### ปัญหา 2: โมเดลไม่พร้อมใช้งานในภูมิภาค  
**อาการ:** ตอบสนอง AI ล้มเหลวหรือผิดพลาดใน deploy โมเดล  
**วิธีแก้:**  
```bash
# ตรวจสอบความพร้อมใช้งานของโมเดลตามภูมิภาค
az cognitiveservices model list --location eastus

# อัปเดตเป็นโมเดลที่พร้อมใช้งานแล้ว
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  
#### ปัญหา 3: สิทธิ์การเข้าถึง  
**อาการ:** ได้ข้อผิดพลาด 403 Forbidden เมื่อเรียกใช้บริการ AI  
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
**ขั้นตอนการสืบสวน:**  
1. ดูเมตริกประสิทธิภาพใน Application Insights  
2. ทบทวนเมตริกบริการ OpenAI ใน Azure portal  
3. ตรวจสอบการเชื่อมต่อเครือข่ายและความหน่วงเวลา  

**วิธีแก้:**  
- ใช้ caching สำหรับคำถามที่ใช้งานบ่อย  
- ใช้โมเดล OpenAI ที่เหมาะสมกับกรณีใช้งาน  
- พิจารณาใช้ read replicas สำหรับสถานการณ์โหลดสูง  

### **แบบฝึกหัดแลป 6.1: ท้าทายการ debug**  

**สถานการณ์:** การ deploy สำเร็จแต่แอปพลิเคชันตอบกลับข้อผิดพลาด 500  

**งาน debug:**  
1. ตรวจสอบบันทึกแอปพลิเคชัน  
2. ตรวจสอบการเชื่อมต่อบริการ  
3. ทดสอบการยืนยันตัวตน  
4. ทบทวนการกำหนดค่า  

**เครื่องมือที่ใช้:**  
- `azd show` สำหรับภาพรวมการ deploy  
- Azure portal สำหรับบันทึกรายละเอียดบริการ  
- Application Insights สำหรับโทรเมทรีแอปพลิเคชัน  

## โมดูล 7: การมอนิเตอร์และการเพิ่มประสิทธิภาพ  

### ขั้นตอน 7.1: ตั้งค่าการมอนิเตอร์ครอบคลุม  

1. **สร้างแดชบอร์ดกำหนดเอง:**  

ไปที่ Azure portal และสร้างแดชบอร์ดที่ประกอบด้วย:  
- จำนวนคำขอและความหน่วงของ OpenAI  
- อัตราความผิดพลาดแอปพลิเคชัน  
- การใช้ทรัพยากร  
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
  
### ขั้นตอน 7.2: การเพิ่มประสิทธิภาพต้นทุน  

1. **วิเคราะห์ค่าใช้จ่ายปัจจุบัน:**  
```bash
# ใช้ Azure CLI เพื่อรับข้อมูลค่าใช้จ่าย
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **นำมาตรการควบคุมค่าใช้จ่ายไปใช้:**  
- ตั้งค่าการแจ้งเตืองบประมาณ  
- ใช้นโยบาย autoscaling  
- ใช้ caching สำหรับคำขอ  
- มอนิเตอร์การใช้โทเคนสำหรับ OpenAI  

### **แบบฝึกหัดแลป 7.1: การเพิ่มประสิทธิภาพประสิทธิภาพ**  

**งาน:** ปรับแต่งแอป AI ของคุณให้มีประสิทธิภาพและประหยัดค่าใช้จ่าย  

**เมตริกที่ต้องปรับปรุง:**  
- ลดเวลาตอบสนองเฉลี่ยลง 20%  
- ลดค่าใช้จ่ายรายเดือนลง 15%  
- รักษาค่า uptime ที่ 99.9%  

**กลยุทธ์ที่ลองใช้:**  
- ใช้ caching การตอบสนอง  
- ปรับ prompts ให้ใช้โทเคนอย่างมีประสิทธิภาพ  
- ใช้ SKU คำนวณที่เหมาะสม  
- ตั้งค่า autoscaling ที่เหมาะสม  

## ความท้าทายสุดท้าย: การใช้งานตั้งแต่ต้นจนจบ  

### สถานการณ์ท้าทาย  

คุณได้รับมอบหมายให้สร้าง chatbot บริการลูกค้าพร้อม AI ที่พร้อมใช้ในผลิตจริงโดยมีข้อกำหนดดังนี้:  

**ข้อกำหนดเชิงฟังก์ชัน:**  
- อินเตอร์เฟสเว็บสำหรับการโต้ตอบกับลูกค้า  
- การผสานรวมกับ Microsoft Foundry Models สำหรับตอบคำถาม  
- ความสามารถในการค้นหาเอกสารโดยใช้ Azure AI Search  
- การผสานรวมกับฐานข้อมูลลูกค้าที่มีอยู่  
- รองรับหลายภาษา  

**ข้อกำหนดที่ไม่ใช่เชิงฟังก์ชัน:**  
- รองรับผู้ใช้พร้อมกัน 1000 คน  
- SLA uptime 99.9%  
- ปฏิบัติตาม SOC 2  
- ค่าใช้จ่ายไม่เกิน $500/เดือน  
- Deploy ไปยังหลายสภาพแวดล้อม (dev, staging, prod)  

### ขั้นตอนการใช้งาน  

1. **ออกแบบสถาปัตยกรรม**  
2. **สร้างเทมเพลต AZD**  
3. **ดำเนินมาตรการความปลอดภัย**  
4. **ตั้งค่าการมอนิเตอร์และแจ้งเตือน**  
5. **สร้าง pipeline การ deploy**  
6. **จัดทำเอกสารโซลูชัน**  

### เกณฑ์การประเมิน  

- ✅ **ฟังก์ชันการทำงาน:** ตรงตามข้อกำหนดทั้งหมดหรือไม่?  
- ✅ **ความปลอดภัย:** มีการใช้แนวปฏิบัติที่ดีที่สุดหรือไม่?  
- ✅ **การขยายตัว:** จัดการภาระงานได้หรือไม่?  
- ✅ **การบำรุงรักษา:** โค้ดและโครงสร้างพื้นฐานเป็นระเบียบหรือไม่?  
- ✅ **ค่าใช้จ่าย:** อยู่ในงบประมาณหรือไม่?  

## แหล่งข้อมูลเพิ่มเติม  

### เอกสารของ Microsoft  
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [เอกสารบริการ Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [เอกสาร Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### เทมเพลตตัวอย่าง  
- [แอปแชท Microsoft Foundry Models ตัวอย่าง](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)  

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### แหล่งข้อมูลชุมชน
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 ใบรับรองการผ่านหลักสูตร

ยินดีด้วย! คุณได้ทำห้องปฏิบัติการ AI Workshop เสร็จสิ้นแล้ว ขณะนี้คุณควรจะสามารถ:

- ✅ แปลงแอปพลิเคชัน AI ที่มีอยู่เป็นเทมเพลต AZD
- ✅ ติดตั้งแอปพลิเคชัน AI ที่พร้อมใช้งานในสภาพแวดล้อมจริง
- ✅ นำแนวปฏิบัติด้านความปลอดภัยที่ดีที่สุดมาใช้กับงาน AI
- ✅ ตรวจสอบและปรับปรุงประสิทธิภาพแอปพลิเคชัน AI
- ✅ แก้ไขปัญหาทั่วไปในการติดตั้ง

### ขั้นตอนถัดไป
1. นำรูปแบบเหล่านี้ไปใช้กับโครงการ AI ของคุณเอง
2. มีส่วนร่วมในการส่งเทมเพลตกลับสู่ชุมชน
3. เข้าร่วม Microsoft Foundry Discord เพื่อรับการสนับสนุนต่อเนื่อง
4. สำรวจหัวข้อขั้นสูง เช่น การติดตั้งหลายภูมิภาค

---

**ข้อเสนอแนะเกี่ยวกับเวิร์กชอป**: ช่วยเราปรับปรุงเวิร์กชอปนี้โดยแบ่งปันประสบการณ์ของคุณใน [ช่อง #Azure ของ Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**การนำทางบท:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ ก่อนหน้า**: [การติดตั้งแบบจำลอง AI](ai-model-deployment.md)
- **➡️ ถัดไป**: [แนวทางปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต](production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมชุมชนของเราเพื่อรับการสนับสนุนและแลกเปลี่ยนความคิดเห็นเกี่ยวกับ AZD และการติดตั้ง AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->