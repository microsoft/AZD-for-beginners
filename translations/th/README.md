<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-17T22:50:46+00:00",
  "source_file": "README.md",
  "language_code": "th"
}
-->
# AZD สำหรับผู้เริ่มต้น: เส้นทางการเรียนรู้ที่มีโครงสร้าง

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.th.png) 

## เริ่มต้นกับคอร์สนี้

ทำตามขั้นตอนเหล่านี้เพื่อเริ่มต้นการเรียนรู้ AZD ของคุณ:

1. **Fork Repository**: คลิก [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **เข้าร่วมชุมชน**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) เพื่อรับการสนับสนุนจากผู้เชี่ยวชาญ
4. **เลือกเส้นทางการเรียนรู้ของคุณ**: เลือกบทที่เหมาะกับระดับประสบการณ์ของคุณด้านล่าง

### รองรับหลายภาษา

#### การแปลอัตโนมัติ (อัปเดตเสมอ)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](./README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## ภาพรวมของคอร์ส

เรียนรู้การใช้ Azure Developer CLI (azd) ผ่านบทเรียนที่มีโครงสร้างเพื่อการเรียนรู้ที่ก้าวหน้า **เน้นพิเศษในการปรับใช้แอปพลิเคชัน AI ด้วยการผสานรวม Azure AI Foundry**

### ทำไมคอร์สนี้จึงสำคัญสำหรับนักพัฒนาสมัยใหม่

จากข้อมูลเชิงลึกของชุมชน Azure AI Foundry Discord **45% ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI** แต่พบปัญหากับ:
- สถาปัตยกรรม AI หลายบริการที่ซับซ้อน
- แนวทางปฏิบัติที่ดีที่สุดในการปรับใช้ AI ในการผลิต  
- การผสานรวมและการตั้งค่าบริการ Azure AI
- การเพิ่มประสิทธิภาพต้นทุนสำหรับงาน AI
- การแก้ไขปัญหาเฉพาะการปรับใช้ AI

### วัตถุประสงค์การเรียนรู้

เมื่อจบคอร์สนี้ คุณจะสามารถ:
- **เข้าใจพื้นฐานของ AZD**: แนวคิดหลัก การติดตั้ง และการตั้งค่า
- **ปรับใช้แอปพลิเคชัน AI**: ใช้ AZD กับบริการ Azure AI Foundry
- **ใช้ Infrastructure as Code**: จัดการทรัพยากร Azure ด้วย Bicep templates
- **แก้ไขปัญหาการปรับใช้**: แก้ไขปัญหาทั่วไปและดีบัก
- **เพิ่มประสิทธิภาพสำหรับการผลิต**: ความปลอดภัย การปรับขนาด การตรวจสอบ และการจัดการต้นทุน
- **สร้างโซลูชัน Multi-Agent**: ปรับใช้สถาปัตยกรรม AI ที่ซับซ้อน

## 📚 บทเรียนการเรียนรู้

*เลือกเส้นทางการเรียนรู้ของคุณตามระดับประสบการณ์และเป้าหมาย*

### 🚀 บทที่ 1: พื้นฐานและเริ่มต้นอย่างรวดเร็ว
**ข้อกำหนดเบื้องต้น**: การสมัครสมาชิก Azure ความรู้พื้นฐานเกี่ยวกับ Command Line  
**ระยะเวลา**: 30-45 นาที  
**ความซับซ้อน**: ⭐

#### สิ่งที่คุณจะได้เรียนรู้
- เข้าใจพื้นฐานของ Azure Developer CLI
- การติดตั้ง AZD บนแพลตฟอร์มของคุณ
- การปรับใช้ครั้งแรกที่สำเร็จ

#### แหล่งข้อมูลการเรียนรู้
- **🎯 เริ่มต้นที่นี่**: [Azure Developer CLI คืออะไร?](../..)
- **📖 ทฤษฎี**: [AZD Basics](docs/getting-started/azd-basics.md) - แนวคิดและคำศัพท์หลัก
- **⚙️ การตั้งค่า**: [Installation & Setup](docs/getting-started/installation.md) - คู่มือเฉพาะแพลตฟอร์ม
- **🛠️ การลงมือปฏิบัติ**: [Your First Project](docs/getting-started/first-project.md) - บทแนะนำทีละขั้นตอน
- **📋 อ้างอิงด่วน**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### แบบฝึกหัด
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 ผลลัพธ์ของบทนี้**: ปรับใช้แอปพลิเคชันเว็บง่ายๆ ไปยัง Azure โดยใช้ AZD ได้สำเร็จ

---

### 🤖 บทที่ 2: การพัฒนาแบบ AI-First (แนะนำสำหรับนักพัฒนา AI)
**ข้อกำหนดเบื้องต้น**: จบบทที่ 1  
**ระยะเวลา**: 1-2 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การผสานรวม Azure AI Foundry กับ AZD
- การปรับใช้แอปพลิเคชันที่ขับเคลื่อนด้วย AI
- เข้าใจการตั้งค่าบริการ AI

#### แหล่งข้อมูลการเรียนรู้
- **🎯 เริ่มต้นที่นี่**: [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 รูปแบบ**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - การปรับใช้และจัดการโมเดล AI
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - ทำให้โซลูชัน AI ของคุณพร้อมใช้งานกับ AZD
- **📋 Templates**: [Azure AI Foundry Templates](../..)

#### แบบฝึกหัด
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 ผลลัพธ์ของบทนี้**: ปรับใช้และตั้งค่าแอปพลิเคชันแชทที่ขับเคลื่อนด้วย AI พร้อมความสามารถ RAG

---

### ⚙️ บทที่ 3: การตั้งค่าและการตรวจสอบสิทธิ์
**ข้อกำหนดเบื้องต้น**: จบบทที่ 1  
**ระยะเวลา**: 45-60 นาที  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การตั้งค่าและการจัดการสภาพแวดล้อม
- แนวทางปฏิบัติที่ดีที่สุดด้านการตรวจสอบสิทธิ์และความปลอดภัย
- การตั้งชื่อและการจัดระเบียบทรัพยากร

#### แหล่งข้อมูลการเรียนรู้
- **📖 การตั้งค่า**: [Configuration Guide](docs/getting-started/configuration.md) - การตั้งค่าสภาพแวดล้อม
- **🔐 ความปลอดภัย**: รูปแบบการตรวจสอบสิทธิ์และ Managed Identity
- **📝 ตัวอย่าง**: [Database App Example](../../examples/database-app) - รูปแบบการตั้งค่า

#### แบบฝึกหัด
- ตั้งค่าสภาพแวดล้อมหลายแบบ (dev, staging, prod)
- ตั้งค่าการตรวจสอบสิทธิ์ Managed Identity
- ใช้การตั้งค่าที่เฉพาะเจาะจงสำหรับแต่ละสภาพแวดล้อม

**💡 ผลลัพธ์ของบทนี้**: จัดการสภาพแวดล้อมหลายแบบด้วยการตรวจสอบสิทธิ์และความปลอดภัยที่เหมาะสม

---

### 🏗️ บทที่ 4: Infrastructure as Code และการปรับใช้
**ข้อกำหนดเบื้องต้น**: จบบทที่ 1-3  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบการปรับใช้ขั้นสูง
- Infrastructure as Code ด้วย Bicep
- กลยุทธ์การจัดสรรทรัพยากร

#### แหล่งข้อมูลการเรียนรู้
- **📖 การปรับใช้**: [Deployment Guide](docs/deployment/deployment-guide.md) - เวิร์กโฟลว์ที่สมบูรณ์
- **🏗️ การจัดสรร**: [Provisioning Resources](docs/deployment/provisioning.md) - การจัดการทรัพยากร Azure
- **📝 ตัวอย่าง**: [Container App Example](../../examples/container-app) - การปรับใช้แบบ Containerized

#### แบบฝึกหัด
- สร้าง Bicep templates แบบกำหนดเอง
- ปรับใช้แอปพลิเคชันหลายบริการ
- ใช้กลยุทธ์การปรับใช้แบบ Blue-Green

**💡 ผลลัพธ์ของบทนี้**: ปรับใช้แอปพลิเคชันหลายบริการที่ซับซ้อนโดยใช้ Infrastructure templates แบบกำหนดเอง

---

### 🎯 บทที่ 5: โซลูชัน AI แบบ Multi-Agent (ขั้นสูง)
**ข้อกำหนดเบื้องต้น**: จบบทที่ 1-2  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบสถาปัตยกรรม Multi-Agent
- การจัดการและการประสานงานของ Agent
- การปรับใช้ AI ที่พร้อมสำหรับการผลิต

#### แหล่งข้อมูลการเรียนรู้
- **🤖 โปรเจกต์เด่น**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - การดำเนินการที่สมบูรณ์
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - การปรับใช้แบบคลิกเดียว
- **📖 สถาปัตยกรรม**: รูปแบบการประสานงาน Multi-Agent

#### แบบฝึกหัด
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ผลลัพธ์ของบทนี้**: ปรับใช้และจัดการโซลูชัน AI แบบ Multi-Agent ที่พร้อมสำหรับการผลิต พร้อม Agent ด้านลูกค้าและสินค้าคงคลัง

---

### 🔍 บทที่ 6: การตรวจสอบและวางแผนก่อนการปรับใช้
**ข้อกำหนดเบื้องต้น**: จบบทที่ 4  
**ระยะเวลา**: 1 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การวางแผนความจุและการตรวจสอบทรัพยากร
- กลยุทธ์การเลือก SKU
- การตรวจสอบก่อนการปรับใช้และการทำงานอัตโนมัติ

#### แหล่งข้อมูลการเรียนรู้
- **📊 การวางแผน**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - การตรวจสอบทรัพยากร
- **💰 การเลือก**: [SKU Selection](docs/pre-deployment/sku-selection.md) - ตัวเลือกที่คุ้มค่า
- **✅ การตรวจสอบ**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - สคริปต์อัตโนมัติ

#### แบบฝึกหัด
- รันสคริปต์ตรวจสอบความจุ
- เพิ่มประสิทธิภาพการเลือก SKU เพื่อลดต้นทุน
- ใช้การตรวจสอบก่อนการปรับใช้อัตโนมัติ

**💡 ผลลัพธ์ของบทนี้**: ตรวจสอบและเพิ่มประสิทธิภาพการปรับใช้ก่อนดำเนินการ

---

### 🚨 บทที่ 7: การแก้ไขปัญหาและดีบัก
**ข้อกำหนดเบื้องต้น**: จบบทการปรับใช้ใดๆ  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- วิธีการดีบักอย่างเป็นระบบ
- ปัญหาทั่วไปและวิธีแก้ไข
- การแก้ไขปัญหาเฉพาะ AI

#### แหล่งข้อมูลการเรียนรู้
- **🔧 ปัญหาทั่วไป**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ และวิธีแก้ไข
- **🕵️ การดีบัก**: [Debugging Guide](docs/troubleshooting/debugging.md) - กลยุทธ์ทีละขั้นตอน
- **🤖 ปัญหา AI**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - ปัญหาบริการ AI

#### แบบฝึกหัด
- วินิจฉัยความล้มเหลวในการปรับใช้
- แก้ไขปัญหาการตรวจสอบสิทธิ์
- ดีบักการเชื่อมต่อบริการ AI

**💡 ผลลัพธ์ของบทนี้**: วินิจฉัยและแก้ไขปัญหาการปรับใช้ทั่วไปได้อย่างอิสระ

---

### 🏢 บทที่ 8: รูปแบบการผลิตและองค์กร
**ข้อกำหนดเบื้องต้น**: จบบทที่ 1-4  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- กลยุทธ์การปรับใช้สำหรับการผลิต
- รูปแบบความปลอดภัยระดับองค์กร
- การตรวจสอบและการเพิ่มประสิทธิภาพต้นทุน

#### แหล่งข้อมูลการเรียนรู้
- **🏭 การผลิต**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - รูปแบบองค์กร
- **📝 ตัวอย่าง**: [Microservices Example](../../examples/microservices) - สถาปัตยกรรมที่ซับซ้อน
- **📊 การตรวจสอบ**: การผสานรวม Application Insights

#### แบบฝึกหัดเชิงปฏิบัติ
- ใช้รูปแบบความปลอดภัยระดับองค์กร
- ตั้งค่าการตรวจสอบที่ครอบคลุม
- ปรับใช้ในระบบการผลิตด้วยการกำกับดูแลที่เหมาะสม

**💡 ผลลัพธ์ของบทนี้**: ปรับใช้แอปพลิเคชันที่พร้อมใช้งานในระดับองค์กรด้วยความสามารถเต็มรูปแบบสำหรับการผลิต

---

## 📖 Azure Developer CLI คืออะไร?

Azure Developer CLI (azd) เป็นเครื่องมือบรรทัดคำสั่งที่เน้นนักพัฒนา ซึ่งช่วยเร่งกระบวนการสร้างและปรับใช้แอปพลิเคชันไปยัง Azure โดยมีคุณสมบัติดังนี้:

- **การปรับใช้ตามเทมเพลต** - ใช้เทมเพลตที่สร้างไว้ล่วงหน้าสำหรับรูปแบบแอปพลิเคชันทั่วไป
- **โครงสร้างพื้นฐานเป็นโค้ด** - จัดการทรัพยากร Azure ด้วย Bicep หรือ Terraform  
- **เวิร์กโฟลว์ที่ผสานรวม** - จัดเตรียม ปรับใช้ และตรวจสอบแอปพลิเคชันได้อย่างราบรื่น
- **เหมาะสำหรับนักพัฒนา** - ปรับให้เหมาะสมสำหรับประสิทธิภาพและประสบการณ์ของนักพัฒนา

### **AZD + Azure AI Foundry: เหมาะสำหรับการปรับใช้ AI**

**ทำไมต้องใช้ AZD สำหรับโซลูชัน AI?** AZD ช่วยแก้ปัญหาสำคัญที่นักพัฒนา AI เผชิญ:

- **เทมเพลตที่พร้อมใช้งาน AI** - เทมเพลตที่กำหนดค่าไว้ล่วงหน้าสำหรับ Azure OpenAI, Cognitive Services และ ML workloads
- **การปรับใช้ AI ที่ปลอดภัย** - รูปแบบความปลอดภัยในตัวสำหรับบริการ AI, API keys และ endpoints ของโมเดล  
- **รูปแบบการผลิต AI** - แนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้แอปพลิเคชัน AI ที่ปรับขนาดได้และคุ้มค่า
- **เวิร์กโฟลว์ AI แบบครบวงจร** - ตั้งแต่การพัฒนาโมเดลไปจนถึงการปรับใช้ในระบบการผลิตพร้อมการตรวจสอบที่เหมาะสม
- **การเพิ่มประสิทธิภาพต้นทุน** - กลยุทธ์การจัดสรรทรัพยากรและการปรับขนาดที่ชาญฉลาดสำหรับ workloads AI
- **การผสานรวม Azure AI Foundry** - การเชื่อมต่อที่ราบรื่นกับแคตตาล็อกโมเดลและ endpoints ของ AI Foundry

---

## 🎯 ไลบรารีเทมเพลตและตัวอย่าง

### แนะนำ: เทมเพลต Azure AI Foundry
**เริ่มต้นที่นี่หากคุณกำลังปรับใช้แอปพลิเคชัน AI!**

| เทมเพลต | บท | ความซับซ้อน | บริการ |
|----------|---------|------------|----------|
| [**เริ่มต้นกับ AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**เริ่มต้นกับ AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | บทที่ 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**การทำงานอัตโนมัติด้วย workflow หลาย agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**สร้างเอกสารจากข้อมูลของคุณ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**ปรับปรุงการประชุมลูกค้าด้วย agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**ปรับปรุงโค้ดของคุณด้วย agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**สร้าง conversational agent ของคุณ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**ปลดล็อกข้อมูลเชิงลึกจากข้อมูลการสนทนา**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**การประมวลผลเนื้อหาแบบ multi-modal**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### แนะนำ: เทมเพลตการเรียนรู้แบบครบวงจร
**เทมเพลตแอปพลิเคชันที่พร้อมใช้งานในระบบการผลิตที่เชื่อมโยงกับบทเรียน**

| เทมเพลต | บทเรียน | ความซับซ้อน | การเรียนรู้สำคัญ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | รูปแบบการปรับใช้ AI พื้นฐาน |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | การใช้งาน RAG ด้วย Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | บทที่ 4 | ⭐⭐ | การผสานรวม Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | เฟรมเวิร์ก agent และการเรียกฟังก์ชัน |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐ | การจัดการ AI ระดับองค์กร |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | สถาปัตยกรรม multi-agent พร้อม agent ลูกค้าและสินค้าคงคลัง |

### การเรียนรู้ตามประเภทตัวอย่าง

#### แอปพลิเคชันง่ายๆ (บทที่ 1-2)
- [Simple Web App](../../examples/simple-web-app) - รูปแบบการปรับใช้พื้นฐาน
- [Static Website](../../examples/static-site) - การปรับใช้เนื้อหาแบบคงที่
- [Basic API](../../examples/basic-api) - การปรับใช้ REST API

#### การผสานรวมฐานข้อมูล (บทที่ 3-4)  
- [Database App](../../examples/database-app) - รูปแบบการเชื่อมต่อฐานข้อมูล
- [Data Processing](../../examples/data-processing) - การปรับใช้ workflow ETL

#### รูปแบบขั้นสูง (บทที่ 4-8)
- [Container Apps](../../examples/container-app) - การปรับใช้แบบ containerized
- [Microservices](../../examples/microservices) - สถาปัตยกรรม multi-service  
- [Enterprise Solutions](../../examples/enterprise) - รูปแบบที่พร้อมใช้งานในระบบการผลิต

### คอลเลกชันเทมเพลตภายนอก
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - ตัวอย่างอย่างเป็นทางการจาก Microsoft
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - เทมเพลตที่ชุมชนมีส่วนร่วม
- [**Examples Directory**](examples/README.md) - ตัวอย่างการเรียนรู้ในพื้นที่พร้อมคำอธิบายโดยละเอียด

---

## 📚 ทรัพยากรการเรียนรู้และข้อมูลอ้างอิง

### ข้อมูลอ้างอิงด่วน
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - คำสั่ง azd ที่จำเป็นจัดเรียงตามบท
- [**Glossary**](resources/glossary.md) - คำศัพท์ Azure และ azd  
- [**FAQ**](resources/faq.md) - คำถามที่พบบ่อยจัดเรียงตามบทเรียน
- [**Study Guide**](resources/study-guide.md) - แบบฝึกหัดเชิงปฏิบัติที่ครอบคลุม

### เวิร์กช็อปแบบลงมือปฏิบัติ
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - ทำให้โซลูชัน AI ของคุณสามารถปรับใช้ด้วย AZD
- [**AZD For Beginners Workshop**](workshop/README.md) - วัสดุเวิร์กช็อปแบบลงมือปฏิบัติครบถ้วน

### ทรัพยากรการเรียนรู้ภายนอก
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 การจบหลักสูตรและการรับรอง

### การติดตามความก้าวหน้า
ติดตามความก้าวหน้าในการเรียนรู้ของคุณในแต่ละบท:

- [ ] **บทที่ 1**: พื้นฐานและเริ่มต้นอย่างรวดเร็ว ✅
- [ ] **บทที่ 2**: การพัฒนาแบบ AI-First ✅  
- [ ] **บทที่ 3**: การกำหนดค่าและการตรวจสอบสิทธิ์ ✅
- [ ] **บทที่ 4**: โครงสร้างพื้นฐานเป็นโค้ดและการปรับใช้ ✅
- [ ] **บทที่ 5**: โซลูชัน AI หลาย agent ✅
- [ ] **บทที่ 6**: การตรวจสอบก่อนการปรับใช้และการวางแผน ✅
- [ ] **บทที่ 7**: การแก้ไขปัญหาและการดีบัก ✅
- [ ] **บทที่ 8**: รูปแบบการผลิตและระดับองค์กร ✅

### การตรวจสอบการเรียนรู้
หลังจากจบบทเรียนแต่ละบท ให้ตรวจสอบความรู้ของคุณโดย:
1. **แบบฝึกหัดเชิงปฏิบัติ**: ทำการปรับใช้ตามบทเรียน
2. **การตรวจสอบความรู้**: ทบทวนส่วน FAQ สำหรับบทเรียนของคุณ
3. **การสนทนาชุมชน**: แบ่งปันประสบการณ์ของคุณใน Discord ของ Azure
4. **บทถัดไป**: ย้ายไปยังระดับความซับซ้อนถัดไป

### ประโยชน์ของการจบหลักสูตร
เมื่อจบบทเรียนทั้งหมด คุณจะได้รับ:
- **ประสบการณ์การผลิต**: ปรับใช้แอปพลิเคชัน AI จริงไปยัง Azure
- **ทักษะระดับมืออาชีพ**: ความสามารถในการปรับใช้ที่พร้อมใช้งานในระดับองค์กร  
- **การยอมรับในชุมชน**: สมาชิกที่กระตือรือร้นในชุมชนผู้พัฒนา Azure
- **ความก้าวหน้าในอาชีพ**: ความเชี่ยวชาญในการปรับใช้ AZD และ AI ที่เป็นที่ต้องการ

---

## 🤝 ชุมชนและการสนับสนุน

### ขอความช่วยเหลือและการสนับสนุน
- **ปัญหาทางเทคนิค**: [รายงานข้อบกพร่องและขอฟีเจอร์](https://github.com/microsoft/azd-for-beginners/issues)
- **คำถามการเรียนรู้**: [ชุมชน Microsoft Azure Discord](https://discord.gg/microsoft-azure)
- **ความช่วยเหลือเฉพาะ AI**: เข้าร่วม [#Azure channel](https://discord.gg/microsoft-azure) สำหรับการสนทนา AZD + AI Foundry
- **เอกสาร**: [เอกสาร Azure Developer CLI อย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### ข้อมูลเชิงลึกจากชุมชนใน Azure AI Foundry Discord

**ผลสำรวจล่าสุดจาก #Azure Channel:**
- **45%** ของนักพัฒนาต้องการใช้ AZD สำหรับ workloads AI
- **ความท้าทายหลัก**: การปรับใช้หลายบริการ การจัดการข้อมูลรับรอง ความพร้อมใช้งานในระบบการผลิต  
- **สิ่งที่ร้องขอมากที่สุด**: เทมเพลตเฉพาะ AI คู่มือแก้ไขปัญหา แนวทางปฏิบัติที่ดีที่สุด

**เข้าร่วมชุมชนของเราเพื่อ:**
- แบ่งปันประสบการณ์ AZD + AI ของคุณและรับความช่วยเหลือ
- เข้าถึงตัวอย่างเทมเพลต AI ใหม่ก่อนใคร
- มีส่วนร่วมในแนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ AI
- มีอิทธิพลต่อการพัฒนา AZD + AI ในอนาคต

### การมีส่วนร่วมในหลักสูตร
เรายินดีต้อนรับการมีส่วนร่วม! โปรดอ่าน [คู่มือการมีส่วนร่วม](CONTRIBUTING.md) สำหรับรายละเอียดเกี่ยวกับ:
- **การปรับปรุงเนื้อหา**: เพิ่มประสิทธิภาพบทเรียนและตัวอย่างที่มีอยู่
- **ตัวอย่างใหม่**: เพิ่มสถานการณ์และเทมเพลตในโลกจริง  
- **การแปล**: ช่วยรักษาการสนับสนุนหลายภาษา
- **รายงานข้อบกพร่อง**: ปรับปรุงความถูกต้องและความชัดเจน
- **มาตรฐานชุมชน**: ปฏิบัติตามแนวทางชุมชนที่ครอบคลุม

---

## 📄 ข้อมูลหลักสูตร

### ใบอนุญาต
โครงการนี้ได้รับอนุญาตภายใต้ MIT License - ดูไฟล์ [LICENSE](../../LICENSE) สำหรับรายละเอียด

### ทรัพยากรการเรียนรู้ที่เกี่ยวข้องจาก Microsoft

ทีมของเราผลิตหลักสูตรการเรียนรู้อื่นๆ ที่ครอบคลุม:

- [**ใหม่** Model Context Protocol (MCP) สำหรับผู้เริ่มต้น](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents สำหรับผู้เริ่มต้น](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI สำหรับผู้เริ่มต้นโดยใช้ .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI สำหรับผู้เริ่มต้น](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI สำหรับผู้เริ่มต้นโดยใช้ Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML สำหรับผู้เริ่มต้น](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science สำหรับผู้เริ่มต้น](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI สำหรับผู้เริ่มต้น](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity สำหรับผู้เริ่มต้น](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev สำหรับผู้เริ่มต้น](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT สำหรับผู้เริ่มต้น](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Development สำหรับผู้เริ่มต้น](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [การใช้งาน GitHub Copilot สำหรับการเขียนโปรแกรม AI แบบคู่](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [การใช้งาน GitHub Copilot สำหรับนักพัฒนา C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Choose Your Own Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ การนำทางหลักสูตร

**🚀 พร้อมเริ่มเรียนรู้หรือยัง?**

**ผู้เริ่มต้น**: เริ่มต้นที่ [บทที่ 1: พื้นฐานและเริ่มต้นอย่างรวดเร็ว](../..)  
**นักพัฒนา AI**: ข้ามไปที่ [บทที่ 2: การพัฒนาแบบ AI-First](../..)
**นักพัฒนาที่มีประสบการณ์**: เริ่มต้นที่ [บทที่ 3: การตั้งค่าและการตรวจสอบสิทธิ์](../..)

**ขั้นตอนถัดไป**: [เริ่มต้นบทที่ 1 - พื้นฐาน AZD](docs/getting-started/azd-basics.md) →

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้องมากที่สุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้