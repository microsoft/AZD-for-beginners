# AI Workshop Lab: ทำให้งาน AI ของคุณสามารถนำไปใช้งานกับ AZD ได้

**เมนูบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนาแบบ AI-First
- **⬅️ ก่อนหน้า**: [การใช้งานโมเดล AI](ai-model-deployment.md)
- **➡️ ถัดไป**: [แนวทางปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต](../chapter-08-production/production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การตั้งค่า](../chapter-03-configuration/configuration.md)

## ภาพรวมของเวิร์กช็อป

ห้องปฏิบัติการเชิงปฏิบัติการนี้จะชี้แนะนักพัฒนาในกระบวนการนำแม่แบบ AI ที่มีอยู่มาใช้งานและเผยแพร่โดยใช้ Azure Developer CLI (AZD) คุณจะได้เรียนรู้รูปแบบสำคัญสำหรับการใช้งาน AI ในการผลิตโดยใช้บริการ Microsoft Foundry

> **การตรวจสอบเวอร์ชัน (2026-11-04):** คำแนะนำคำสั่ง AZD และชื่อการตั้งค่าตัวอย่างได้รับการตรวจสอบเทียบกับ `azd` `1.37.2` เวอร์ชันและการตั้งค่าปัจจุบันของตัวอย่างที่ลิงก์ไว้ นี่เป็นการตรวจสอบเอกสาร ไม่ใช่การยืนยันการเผยแพร่จริง ห้องปฏิบัติการ RAG ไม่ต้องการส่วนขยายของเอเย่นต์ สำหรับการประเมินเอเย่นต์ ให้ใช้ส่วนขยาย `azure.ai.evaluations` แยกต่างหากและ [เวิร์กโฟลว์การประเมินปัจจุบัน](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) แทนคำสั่งประเมินเอเย่นต์แบบเก่า

**ระยะเวลา:** 2-3 ชั่วโมง  
**ระดับ:** ปานกลาง  
**ข้อกำหนดเบื้องต้น:** ความรู้พื้นฐานเกี่ยวกับ Azure, คุ้นเคยกับแนวคิด AI/ML

## 🎓 วัตถุประสงค์การเรียนรู้

เมื่อจบเวิร์กช็อปนี้ คุณจะสามารถ:
- ✅ สำรวจแม่แบบ AI AZD ที่มีอยู่และวางแผนการแปลงแอปพลิเคชันของคุณเอง
- ✅ ตั้งค่าบริการ Microsoft Foundry ด้วย AZD
- ✅ นำการจัดการข้อมูลรับรองอย่างปลอดภัยมาใช้กับบริการ AI
- ✅ เผยแพร่แอปพลิเคชันอ้างอิง AI พร้อมระบบตรวจสอบ
- ✅ แก้ไขปัญหาทั่วไปในการเผยแพร่ AI

## ข้อกำหนดเบื้องต้น

### เครื่องมือที่จำเป็น
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) ติดตั้งแล้ว  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) ติดตั้งแล้ว  
- [Git](https://git-scm.com/) ติดตั้งแล้ว  
- โปรแกรมแก้ไขโค้ด (แนะนำ VS Code)  

บล็อกคำสั่งเหล่านี้ใช้ไวยากรณ์ Bash (รวมถึงการต่อบรรทัดและ `grep`) บน Windows ให้ใช้ Git Bash/WSL หรือแปลงโค้ดเหล่านี้เป็น PowerShell ติดตั้งภาษาที่ใช้ ตัวจัดการแพ็กเกจ และเครื่องมือคอนเทนเนอร์ที่ระบุใน [การตั้งค่าสภาพแวดล้อมในเครื่องของตัวอย่าง](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment) ด้วย  

### ทรัพยากร Azure  
- บัญชีผู้ใช้ Azure ที่มีสิทธิ์ในการจัดหาทรัพยากรและมอบหมายบทบาท (Contributor อย่างเดียวไม่สามารถสร้างการมอบหมาย RBAC ได้; ต้องใช้ผู้ดูแลระบบบทบาทที่ได้รับอนุญาตหรือเทียบเท่าที่ระบุในตัวอย่าง)  
- การเข้าถึงบริการ Microsoft Foundry Models (หรือต้องสามารถร้องขอการเข้าถึงได้)  
- สิทธิ์ในการสร้างกลุ่มทรัพยากร  

### ความรู้พื้นฐานที่ต้องมี
- ความเข้าใจพื้นฐานเกี่ยวกับบริการ Azure
- คุ้นเคยกับอินเทอร์เฟซบรรทัดคำสั่ง
- แนวคิดพื้นฐานเกี่ยวกับ AI/ML (API, โมเดล, prompt)

## การตั้งค่าห้องปฏิบัติการ

### ขั้นตอนที่ 1: การเตรียมสภาพแวดล้อม

1. **ตรวจสอบการติดตั้งเครื่องมือ:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

หากคุณทำงานข้ามหลาย tenant หรือการสมัครสมาชิกของคุณไม่ได้รับการตรวจสอบโดยอัตโนมัติ ให้ลองอีกครั้งด้วย `azd auth login --tenant-id <tenant-id>`

2. **โคลน repository ของ workshop:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## โมดูล 1: ทำความเข้าใจโครงสร้าง AZD สำหรับแอป AI

### โครงสร้างของเทมเพลต AI AZD

สำรวจไฟล์หลักในเทมเพลต AZD ที่พร้อมสำหรับ AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

ตัวอย่างที่ถูกเช็คเอาท์อาจเปลี่ยนแปลง; `.azure/` จะปรากฏหลังจากเริ่มต้นสภาพแวดล้อม ไม่จำเป็นต้องอยู่ในโคลนใหม่ ตรวจสอบ checkout จริงมากกว่าการสร้างไดเรกทอรีที่ขาดเพื่อให้ตรงกับแผนผังนี้

### **แบบฝึกหัดห้องทดลอง 1.1: สำรวจการตั้งค่า**

1. **ตรวจสอบไฟล์ azure.yaml:**
```bash
cat azure.yaml
```

**สิ่งที่ควรมองหา:**
- คำนิยามบริการสำหรับส่วนประกอบ AI
- การแมปตัวแปรสภาพแวดล้อม
- การตั้งค่าโฮสต์

2. **ตรวจสอบโครงสร้างพื้นฐาน main.bicep:**
```bash
cat infra/main.bicep
```

**รูปแบบ AI ที่สำคัญที่ควรระบุ:**
- การจัดเตรียมบริการ Microsoft Foundry Models
- การผสานรวม Azure AI Search
- การจัดการคีย์ที่ปลอดภัย
- การตั้งค่าความปลอดภัยเครือข่าย

### **จุดอภิปราย:** ทำไมรูปแบบเหล่านี้ถึงสำคัญสำหรับ AI

- **การพึ่งพาบริการ**: แอป AI มักต้องการบริการหลายอย่างที่ประสานกัน
- **ความปลอดภัย**: คีย์ API และ endpoints ต้องการการจัดการที่ปลอดภัย
- **การปรับขนาด**: งาน AI มีความต้องการการปรับขนาดเฉพาะ
- **การจัดการต้นทุน**: บริการ AI อาจมีราคาแพงถ้าไม่ได้ตั้งค่าอย่างเหมาะสม

## โมดูล 2: ปรับใช้แอป AI แรกของคุณ

### ขั้นตอน 2.1: เริ่มต้นสภาพแวดล้อม

1. **สร้างสภาพแวดล้อม AZD ใหม่:**
```bash
azd env new myai-workshop
```

2. **ตั้งค่าพารามิเตอร์ที่จำเป็น:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### ขั้นตอน 2.2: ปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน

1. **ปรับใช้ด้วย AZD:**
```bash
azd up
```

**สิ่งที่เกิดขึ้นระหว่าง `azd up`:**
- ✅ จัดเตรียมบริการ Microsoft Foundry Models
- ✅ สร้างบริการ Azure AI Search
- ✅ ตั้งค่า Azure Container Apps สำหรับ backend และ frontend ที่รวมไว้ (ตัวอย่างปัจจุบัน)
- ✅ กำหนดค่าเครือข่ายและความปลอดภัย
- ✅ ปรับใช้รหัสแอปพลิเคชัน
- ✅ ตั้งค่าการตรวจสอบและบันทึกข้อมูล

2. **ติดตามความคืบหน้าการปรับใช้** และบันทึกทรัพยากรที่ถูกสร้างขึ้น

### ขั้นตอน 2.3: ตรวจสอบการปรับใช้ของคุณ

1. **ตรวจสอบทรัพยากรที่ปรับใช้:**
```bash
azd show
```

2. **เปิดแอปพลิเคชันที่ปรับใช้:**
```bash
azd show
```

เปิดเว็บเอนด์พอยต์ที่แสดงในผลลัพธ์ `azd show`

3. **ทดสอบฟังก์ชัน AI:**
   - ไปยังเว็บแอปพลิเคชัน
   - ลองคำถามตัวอย่าง
   - ตรวจสอบการตอบสนอง AI ว่าทำงาน

### **แบบฝึกหัดห้องทดลอง 2.1: ฝึกแก้ไขปัญหา**

**สถานการณ์**: การปรับใช้สำเร็จแต่ AI ไม่ตอบสนอง

**ปัญหาทั่วไปที่ควรตรวจสอบ:**
1. **การตรวจสอบสิทธิ์**: ตรวจสอบ managed identity และ role assignments; ตรวจเฉพาะ API keys หากคุณเปิดใช้งานการตรวจสอบสิทธิ์ด้วยคีย์โดยเจตนา
2. **การใช้งานโมเดล**: ตรวจสอบว่าโซนของคุณรองรับโมเดลหรือไม่
3. **การเชื่อมต่อเครือข่าย**: ตรวจสอบให้แน่ใจว่าบริการสามารถติดต่อกันได้
4. **สิทธิ์ RBAC**: ตรวจสอบว่าแอปสามารถเข้าถึง OpenAI ได้

**คำสั่งแก้ไขปัญหา:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## โมดูล 3: ปรับแต่งแอป AI ตามความต้องการของคุณ

### ขั้นตอน 3.1: แก้ไขการตั้งค่า AI

1. **อัปเดตโมเดล OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **เพิ่มบริการ AI เพิ่มเติม:**

แก้ไข `infra/main.bicep` เพื่อเพิ่ม Document Intelligence:

ข้อความด้านล่างเป็นส่วนแสดงตัวอย่าง ไม่ใช่เทมเพลตสมบูรณ์ ตัวอย่างอาจจัดเตรียมบริการประมวลเอกสารแล้ว: ตรวจสอบโครงสร้างพื้นฐานปัจจุบันก่อนเพิ่มทรัพยากรซ้ำ การเพิ่มแบบกำหนดเองต้องเชื่อมโยงเอาต์พุต ระบุตัวตน และการตั้งค่าแอปพลิเคชัน

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

### ขั้นตอน 3.2: การตั้งค่าสำหรับสภาพแวดล้อมเฉพาะ

**แนวทางปฏิบัติที่ดีที่สุด**: การตั้งค่าที่แตกต่างกันสำหรับการพัฒนาและการผลิต

1. **สร้างสภาพแวดล้อมการผลิต:**
```bash
azd env new myai-production
```

2. **ตั้งค่าพารามิเตอร์เฉพาะการผลิต:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

ชื่อเหล่านี้มาจากตัวอย่างใน [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json). `azd env set` เก็บค่าไว้แต่ไม่ได้ทำให้ตัวแปรกำหนดเองมีผล เทมเพลตต้องใช้งาน Review ตัวอย่าง [แนวทางแยกเครือข่าย](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) ก่อนปิดการเข้าถึงสาธารณะ และใช้ `azd up` เพื่อใช้การเปลี่ยนแปลงโครงสร้างพื้นฐาน SKU OpenAI `S0` เพียงอย่างเดียวไม่กำหนดความสามารถของโมเดล; ประเภทและความจุของการปรับใช้โมเดลก็มีผลด้วย

### **แบบฝึกหัดห้องทดลอง 3.1: การเพิ่มประสิทธิภาพค่าใช้จ่าย**

**ความท้าทาย**: กำหนดค่าเทมเพลตเพื่อการพัฒนาที่ประหยัดค่าใช้จ่าย

**งานที่ต้องทำ:**
1. เลือกสภาพแวดล้อม workshop ที่ใช้แล้วทิ้ง: `azd env select myai-workshop`
2. บันทึก SKU Search ปัจจุบันและความจุของโมเดลจาก `infra/main.parameters.json` และสภาพแวดล้อมที่เลือก
3. ใช้ข้อมูลนำเข้าที่รองรับด้านล่าง หลังจากตรวจสอบโควต้าโมเดล/ภูมิภาค:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. ตรวจสอบ SKU Search และความจุการปรับใช้ในพอร์ทัล และประเมินความแตกต่างด้วยเครื่องคิดราคาค่าใช้จ่าย อย่าคาดหวังว่าข้อมูลบิลจะอัปเดตทันที

**เกณฑ์ความสำเร็จ:** Search ใช้ Basic, การปรับใช้แชทมีความจุที่รองรับที่ร้องขอ และแอปยังตอบคำถามตัวอย่าง ความจุ `10` เป็นการจัดสรรอัตราขีดจำกัด ไม่ใช่ส่วนลดราคาต่อโทเค็น การเปลี่ยนระดับชั้น Search อาจถูกจำกัดหรืออาจต้องสร้างใหม่ อย่าทดลองบนทรัพยากรผลิต F0 เป็นแบบบริการเฉพาะและไม่ใช่ SKU โมเดล Azure OpenAI

## โมดูล 4: ความปลอดภัยและแนวทางปฏิบัติที่ดีที่สุดสำหรับการผลิต

### ขั้นตอน 4.1: การจัดการข้อมูลรับรองที่ปลอดภัย

**ความท้าทายปัจจุบัน**: แอป AI หลายแอปฝังคีย์ API ไว้ตรงหรือใช้การเก็บข้อมูลที่ไม่ปลอดภัย

**วิธีแก้ AZD**: การจัดการระบุตัวตน + การรวม Key Vault

1. **ตรวจสอบการตั้งค่าความปลอดภัยในเทมเพลตของคุณ:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **ยืนยันว่า Managed Identity ทำงานได้:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### ขั้นตอน 4.2: ความปลอดภัยเครือข่าย

1. **เปิดใช้งาน private endpoints** โดยใช้การตั้งค่าเครือข่ายที่รองรับในตัวอย่าง (ถ้ายังไม่ได้ตั้งค่า)

สำหรับเทมเพลตของคุณเอง ชิ้นส่วนตัวอย่างนี้แสดงการเชื่อมต่อ endpoint ของ OpenAI นอกจากนี้ยังต้องการ VNet การตั้งค่า DNS ส่วนตัว และการเชื่อมต่อแอปพลิเคชัน อย่าวางซ้ำในตัวอย่างโดยไม่มีการเปลี่ยนแปลง ซึ่งมีโมดูล private-endpoint อยู่แล้ว:
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

### ขั้นตอน 4.3: การตรวจสอบและมองเห็น

1. **ตั้งค่า Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **เปิดใช้งานการรวม Application Insights ในตัวอย่าง:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

การใส่อุปกรณ์ในตัวอย่างจะส่งเทเลเมทรี; การตั้งค่า `OPENAI_MONITOR_ENABLED` แบบสุ่มไม่ได้เปิดใช้งานเมตริก AI ตรวจสอบการติดตามการเรียกโมเดล ความล่าช้า ความล้มเหลว และการใช้งานโทเค็น และหลีกเลี่ยงการบันทึกพรอมต์หรือการตอบสนองที่ละเอียดอ่อน

### **แบบฝึกหัดห้องทดลอง 4.1: การตรวจสอบความปลอดภัย**

**งาน**: ตรวจสอบการปรับใช้ของคุณสำหรับแนวทางปฏิบัติความปลอดภัยที่ดีที่สุด

**รายการตรวจสอบ:**
- [ ] ไม่มีความลับฝังตัวในโค้ดหรือการตั้งค่า
- [ ] ใช้ Managed Identity สำหรับการตรวจสอบสิทธิ์ระหว่างบริการ
- [ ] Key Vault เก็บการตั้งค่าที่ละเอียดอ่อน
- [ ] การเข้าถึงเครือข่ายถูกจำกัดอย่างเหมาะสม
- [ ] เปิดใช้งานการตรวจสอบและบันทึกข้อมูล

## โมดูล 5: การแปลงแอป AI ของคุณเอง

### ขั้นตอน 5.1: แบบประเมิน

**ก่อนแปลงแอปของคุณ** ให้ตอบคำถามเหล่านี้:

1. **สถาปัตยกรรมแอปพลิเคชัน:**
   - แอปของคุณใช้บริการ AI อะไรบ้าง?
   - ต้องการทรัพยากรคอมพิวต์อะไร?
   - ต้องการฐานข้อมูลไหม?
   - มีการพึ่งพาระหว่างบริการอย่างไร?

2. **ข้อกำหนดด้านความปลอดภัย:**
   - แอปของคุณจัดการข้อมูลละเอียดอ่อนอะไรบ้าง?
   - มีข้อกำหนดด้านการปฏิบัติตามกฎอะไรบ้าง?
   - ต้องการเครือข่ายส่วนตัวไหม?

3. **ข้อกำหนดการปรับขนาด:**
   - โหลดที่คาดหวังคืออะไร?
   - ต้องการการปรับขนาดอัตโนมัติไหม?
   - มีข้อกำหนดภูมิภาคไหม?

### ขั้นตอน 5.2: สร้างเทมเพลต AZD ของคุณ

**ปฏิบัติตามรูปแบบนี้เพื่อแปลงแอปของคุณ:**

**แค่โครงสร้าง:** ส่วนนี้ไม่รวมซอร์ส API/เว็บแอปพลิเคชัน โครงสร้างพื้นฐานโฮสต์ การปรับใช้โมเดล การจัดการระบุตัวตน/RBAC หรือ `main.parameters.json` ที่สมบูรณ์ Bicep ที่อยู่ในขอบเขต resource group แสดงให้เห็นการประกอบโมดูล; จุดเริ่มต้นในขอบเขต subscription ของ AZD ทั่วไปต้องสร้าง resource group และเรียกใช้ในขอบเขตนั้น อย่าคาดหวังว่า `azd up` จะปรับใช้แอปครบถ้วนหลังจากคัดลอกเฉพาะชิ้นส่วนเหล่านี้ สำหรับ baseline ที่ใช้งานได้ ให้ใช้เทมเพลต RAG จากโมดูล 1 ต่อไป

1. **สร้างโครงสร้างพื้นฐาน:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **แบบฝึกหัดห้องทดลอง 5.1: ความท้าทายการสร้างเทมเพลต**

**ความท้าทาย**: สร้างเทมเพลต AZD สำหรับแอป AI ประมวลผลเอกสาร

**ข้อกำหนด:**
- Microsoft Foundry Models สำหรับการวิเคราะห์เนื้อหา
- Document Intelligence สำหรับ OCR
- Storage Account สำหรับการอัปโหลดเอกสาร
- Function App สำหรับตรรกะการประมวลผล
- เว็บแอปสำหรับส่วนติดต่อผู้ใช้

**คะแนนโบนัส:**
- เพิ่มการจัดการข้อผิดพลาดที่เหมาะสม
- รวมการประเมินค่าใช้จ่าย
- ตั้งค่าดัชนีตรวจสอบ

## โมดูล 6: การแก้ไขปัญหาที่พบบ่อย

### ปัญหาการปรับใช้ทั่วไป

#### ปัญหา 1: เกินโควต้า OpenAI Service
**อาการ:** ปรับใช้ล้มเหลวพร้อมข้อผิดพลาดโควต้า
**วิธีแก้:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### ปัญหา 2: โมเดลไม่พร้อมใช้งานในภูมิภาค
**อาการ:** การตอบสนอง AI ล้มเหลวหรือข้อผิดพลาดการปรับใช้โมเดล
**วิธีแก้:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### ปัญหา 3: ปัญหาสิทธิ์
**อาการ:** ข้อผิดพลาด 403 Forbidden เมื่อเรียกใช้บริการ AI
**วิธีแก้:**
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
**ขั้นตอนตรวจสอบ:**
1. ตรวจสอบ Application Insights สำหรับเมตริกประสิทธิภาพ
2. ตรวจสอบเมตริกบริการ OpenAI ในพอร์ทัล Azure
3. ยืนยันการเชื่อมต่อเครือข่ายและความหน่วงเวลา

**วิธีแก้:**
- ใช้แคชสำหรับคำถามที่ใช้บ่อย
- ใช้โมเดล OpenAI ที่เหมาะสมกับกรณีการใช้งานของคุณ
- ปรับขนาดรีพลิกาของแอปหลังจากตรวจสอบข้อจำกัด RPM/TPM ของโมเดลแล้วเท่านั้น; การปรับใช้ Azure OpenAI ไม่เปิดเผยการตั้งค่า "read replica" แบบฐานข้อมูลทั่วไป

### **แบบฝึกหัดห้องทดลอง 6.1: ความท้าทายการแก้ไขปัญหา**

**สถานการณ์**: การปรับใช้สำเร็จ แต่แอปพลิเคชันส่งกลับข้อผิดพลาด 500

**งานแก้ไขปัญหา:**
1. ตรวจสอบบันทึกแอปพลิเคชัน
2. ตรวจสอบการเชื่อมต่อบริการ
3. ทดสอบการตรวจสอบสิทธิ์
4. ตรวจสอบการตั้งค่า

**เครื่องมือที่ใช้:**
- `azd show` สำหรับภาพรวมการปรับใช้
- พอร์ทัล Azure สำหรับบันทึกบริการโดยละเอียด
- Application Insights สำหรับการวัดการณ์ของแอปพลิเคชัน

## โมดูล 7: การตรวจสอบและการปรับแต่ง

### ขั้นตอนที่ 7.1: ตั้งค่าการตรวจสอบอย่างครบถ้วน

1. **สร้างแดชบอร์ดที่กำหนดเอง:**

ไปที่พอร์ทัล Azure และสร้างแดชบอร์ดที่มี:
- จำนวนคำขอและความหน่วงเวลาของ OpenAI
- อัตราความผิดพลาดของแอปพลิเคชัน
- การใช้ทรัพยากร
- การติดตามต้นทุน

2. **ตั้งค่าการแจ้งเตือน:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

ตรวจสอบว่าคอมโพเนนต์ส่งสัญญาณวัดการณ์คำขอและเพิ่มกลุ่มการดำเนินการถ้าต้องการการแจ้งเตือน เมตริกเป็นการนับจำนวน ไม่ใช่อัตราความล้มเหลว; การแจ้งเตือนอัตราต้องใช้การสืบค้นและตัวหารที่เหมาะสม

### ขั้นตอนที่ 7.2: การปรับแต่งต้นทุน

1. **วิเคราะห์ต้นทุนปัจจุบัน:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

แทนที่ช่องว่างวันที่ การสนับสนุน Consumption API แตกต่างกันตามข้อตกลงการเรียกเก็บเงิน; ใช้ Cost Management ในพอร์ทัลถ้าข้อมูลการใช้งานไม่สามารถใช้งานได้ ต้นทุนจะล่าช้า ไม่ใช่การทดสอบแบบเรียลไทม์

2. **ดำเนินการควบคุมต้นทุน:**
- ตั้งค่าการแจ้งเตือนงบประมาณ
- ใช้นโยบายการปรับสเกลอัตโนมัติ
- ดำเนินการแคชคำขอ
- ตรวจสอบการใช้โทเค็นสำหรับ OpenAI

### **แบบฝึกหัดห้องปฏิบัติการ 7.1: การปรับแต่งประสิทธิภาพ**

**งาน**: ปรับแต่งแอป AI ของคุณให้เหมาะสมทั้งด้านประสิทธิภาพและต้นทุน

**เมตริกที่ต้องปรับปรุง:**
- ลดเวลาเฉลี่ยในการตอบกลับลง 20%
- ลดต้นทุนรายเดือนลง 15%
- กำหนด SLO ความพร้อมใช้งาน 99.9% และช่วงเวลาการวัด (ห้องปฏิบัติการสั้นๆ ไม่สามารถแสดงเวลาทำงานรายเดือนได้)

**กลยุทธ์ที่ควรลอง:**
- ดำเนินการแคชการตอบกลับ
- ปรับแต่งพรอมต์ให้มีประสิทธิภาพโทเค็น
- ใช้ SKU คอมพิวต์ที่เหมาะสม
- ตั้งค่าการปรับสเกลอัตโนมัติที่เหมาะสม

## ความท้าทายขั้นสุดท้าย: การนำไปใช้แบบครบวงจร

### สถานการณ์ความท้าทาย

นี่คือ **ความท้าทายด้านสถาปัตยกรรม/การออกแบบแบบไม่บังคับ** ไม่ใช่แบบฝึกหัดที่สามารถรันได้หรือการรับรองการผลิต เสนอแชทบอทบริการลูกค้าที่ใช้ AI และบันทึกความต้องการที่ต้องการการนำไปใช้และหลักฐานเพิ่มเติม:

**ความต้องการเชิงหน้าที่:**
- อินเทอร์เฟซเว็บสำหรับการโต้ตอบของลูกค้า
- การรวมกับ Microsoft Foundry Models สำหรับคำตอบ
- ความสามารถในการค้นหาเอกสารโดยใช้ Azure AI Search
- การรวมกับฐานข้อมูลลูกค้าที่มีอยู่
- รองรับหลายภาษา

**ความต้องการเชิงไม่หน้าที่:**
- รองรับผู้ใช้พร้อมกัน 1000 คน
- SLA ความพร้อมใช้งาน 99.9%
- การปฏิบัติตาม SOC 2
- ต้นทุนต่ำกว่า $500/เดือน
- ปรับใช้ในหลายสภาพแวดล้อม (dev, staging, prod)

เหล่านี้เป็นข้อจำกัดสมมติของผู้มีส่วนได้ส่วนเสีย ไม่ใช่ผลลัพธ์ที่รับประกันพร้อมกัน กำหนดอัตราคำขอ ขนาดพรอมต์/ผลลัพธ์ และระยะเวลาการใช้งานก่อนประเมินต้นทุน; ผู้ใช้พร้อมกัน 1,000 คนไม่ได้กำหนดงานหรือพิสูจน์ว่างบ $500 เป็นไปได้ SOC 2 เป็นผลการตรวจสอบองค์กร ไม่ใช่สวิตช์ที่เปิดใช้งานโดยเทมเพลต AZD ระบุการแลกเปลี่ยนและปฏิเสธข้อจำกัดที่เป็นไปไม่ได้ด้วยหลักฐาน

### ขั้นตอนการนำไปใช้

1. **ออกแบบสถาปัตยกรรม**
2. **สร้างเทมเพลต AZD**
3. **ดำเนินการมาตรการรักษาความปลอดภัย**
4. **ตั้งค่าการตรวจสอบและการแจ้งเตือน**
5. **สร้างสายงานปรับใช้**
6. **จัดทำเอกสารโซลูชัน**

### เกณฑ์การประเมิน

- ✅ **ฟังก์ชันการทำงาน**: ความสามารถที่นำไปใช้แสดงให้เห็นอย่างชัดเจนและช่องว่างที่เหลือมีความชัดเจนหรือไม่?
- ✅ **ความปลอดภัย**: ได้ดำเนินการแนวทางปฏิบัติที่ดีที่สุดหรือไม่?
- ✅ **ความสามารถในการปรับขนาด**: สามารถรับมือกับภาระงานได้หรือไม่?
- ✅ **การบำรุงรักษา**: โค้ดและโครงสร้างพื้นฐานมีการจัดระเบียบดีหรือไม่?
- ✅ **ต้นทุน**: อยู่ในงบประมาณหรือไม่?

## ทรัพยากรเพิ่มเติม

### เอกสารของ Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### ตัวอย่างเทมเพลต
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### ทรัพยากรชุมชน
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 จุดตรวจสอบความสมบูรณ์

ยินดีด้วย! คุณได้ทำงานห้องปฏิบัติการ AI Workshop เสร็จเรียบร้อยแล้ว ตอนนี้คุณควรจะสามารถ:

- ✅ อธิบายวิธีปรับแอป AI ที่มีอยู่ให้เข้ากับเทมเพลต AZD
- ✅ ปรับใช้และทดสอบแอป AI อ้างอิง
- ✅ ดำเนินการแนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัยสำหรับภาระงาน AI
- ✅ ตรวจสอบและปรับแต่งประสิทธิภาพแอป AI
- ✅ แก้ไขปัญหาการปรับใช้ทั่วไป

**ล้างข้อมูล:** รัน `azd env list` เลือกแต่ละสภาพแวดล้อมที่ใช้แล้วทิ้งที่สร้างในห้องปฏิบัติการนี้ (`myai-workshop` และถ้าปรับใช้ `myai-production`/`myai-quota-test`) แล้วรัน `azd down` ในแต่ละสภาพแวดล้อม ตรวจสอบแผนการลบ; การลบเพียงการกำหนดค่าท้องถิ่นของสภาพแวดล้อมไม่ใช่การลบทรัพยากร Azure หลีกเลี่ยง `--purge` เว้นแต่คุณจะเข้าใจการลบทรัพยากรที่ถูกลบแบบนุ่มที่ไม่สามารถย้อนกลับได้

### ขั้นตอนถัดไป
1. นำรูปแบบเหล่านี้ไปใช้กับโครงการ AI ของคุณเอง
2. มีส่วนร่วมในการส่งเทมเพลตกลับสู่ชุมชน
3. เข้าร่วม Microsoft Foundry Discord เพื่อรับการสนับสนุนอย่างต่อเนื่อง
4. สำรวจหัวข้อขั้นสูง เช่น การปรับใช้หลายภูมิภาค

---

**ความคิดเห็นเกี่ยวกับเวิร์กช็อป**: ช่วยเราปรับปรุงเวิร์กช็อปนี้โดยการแบ่งปันประสบการณ์ของคุณใน [ช่อง Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**การนำทางบท:**
- **📚 หน้าแรกหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 2 - การพัฒนา AI-First
- **⬅️ ก่อนหน้า**: [การปรับใช้โมเดล AI](ai-model-deployment.md)
- **➡️ ถัดไป**: [แนวทางปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต](../chapter-08-production/production-ai-practices.md)
- **🚀 บทถัดไป**: [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/configuration.md)

**ต้องการความช่วยเหลือ?** เข้าร่วมชุมชนของเราเพื่อขอรับการสนับสนุนและหารือเกี่ยวกับ AZD และการปรับใช้ AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->