<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee9a026a572535444287d531dbd75d78",
  "translation_date": "2025-09-12T20:55:40+00:00",
  "source_file": "README.md",
  "language_code": "th"
}
-->
# AZD สำหรับผู้เริ่มต้น

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.th.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)  
![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)  

ทำตามขั้นตอนเหล่านี้เพื่อเริ่มต้นใช้งานทรัพยากรเหล่านี้:  
1. **Fork Repository**: คลิก [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Clone Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**เข้าร่วมชุมชน Azure Discord เพื่อพบปะผู้เชี่ยวชาญและนักพัฒนาคนอื่นๆ**](https://discord.com/invite/ByRwuEEgH4)  

### รองรับหลายภาษา

#### รองรับผ่าน GitHub Action (อัตโนมัติและอัปเดตเสมอ)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](./README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**หากคุณต้องการให้มีการรองรับภาษาเพิ่มเติม รายการภาษาที่รองรับมีอยู่ [ที่นี่](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## บทนำ

ยินดีต้อนรับสู่คู่มือฉบับสมบูรณ์สำหรับ Azure Developer CLI (azd) Repository นี้ถูกออกแบบมาเพื่อช่วยนักพัฒนาทุกระดับ ตั้งแต่นักเรียนไปจนถึงนักพัฒนามืออาชีพ ในการเรียนรู้และเชี่ยวชาญการใช้งาน Azure Developer CLI เพื่อการปรับใช้ระบบคลาวด์อย่างมีประสิทธิภาพ **โดยเน้นเป็นพิเศษที่การปรับใช้แอปพลิเคชัน AI ด้วย Azure AI Foundry** ทรัพยากรการเรียนรู้นี้มีการเรียนรู้แบบลงมือปฏิบัติจริงเกี่ยวกับการปรับใช้ระบบคลาวด์ของ Azure การแก้ไขปัญหาที่พบบ่อย และการนำแนวทางปฏิบัติที่ดีที่สุดไปใช้สำหรับการปรับใช้เทมเพลต AZD อย่างประสบความสำเร็จ  

### **เหตุผลที่คู่มือนี้สำคัญสำหรับนักพัฒนา AI**
จากผลสำรวจล่าสุดในชุมชน Azure AI Foundry Discord **45% ของนักพัฒนาสนใจใช้ AZD สำหรับงาน AI** แต่พบปัญหาในเรื่อง:  
- สถาปัตยกรรม AI หลายบริการที่ซับซ้อน  
- แนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ AI ในการผลิต  
- การผสานรวมและการตั้งค่าบริการ Azure AI  
- การปรับต้นทุนให้เหมาะสมสำหรับงาน AI  
- การแก้ไขปัญหาเฉพาะสำหรับการปรับใช้ AI  

## เป้าหมายการเรียนรู้

เมื่อทำงานผ่าน Repository นี้ คุณจะ:  
- เชี่ยวชาญพื้นฐานและแนวคิดหลักของ Azure Developer CLI  
- เรียนรู้การปรับใช้และจัดเตรียมทรัพยากร Azure โดยใช้ Infrastructure as Code  
- พัฒนาทักษะการแก้ไขปัญหาสำหรับปัญหาการปรับใช้ AZD ที่พบบ่อย  
- เข้าใจการตรวจสอบก่อนการปรับใช้และการวางแผนความจุ  
- นำแนวทางปฏิบัติด้านความปลอดภัยและการปรับต้นทุนไปใช้  
- สร้างความมั่นใจในการปรับใช้แอปพลิเคชันที่พร้อมใช้งานจริงบน Azure  

## ผลลัพธ์การเรียนรู้

หลังจากจบหลักสูตรนี้ คุณจะสามารถ:  
- ติดตั้ง ตั้งค่า และใช้งาน Azure Developer CLI ได้สำเร็จ  
- สร้างและปรับใช้แอปพลิเคชันโดยใช้เทมเพลต AZD  
- แก้ไขปัญหาการรับรองความถูกต้อง โครงสร้างพื้นฐาน และปัญหาการปรับใช้  
- ดำเนินการตรวจสอบก่อนการปรับใช้ รวมถึงการวางแผนความจุและการเลือก SKU  
- นำแนวทางปฏิบัติด้านการตรวจสอบ ความปลอดภัย และการจัดการต้นทุนไปใช้  
- ผสานรวมเวิร์กโฟลว์ AZD เข้ากับ CI/CD pipelines  

## สารบัญ

- [Azure Developer CLI คืออะไร?](../..)  
- [เริ่มต้นใช้งาน](../..)  
- [เส้นทางการเรียนรู้](../..)  
  - [สำหรับนักพัฒนา AI (แนะนำให้เริ่มที่นี่!)](../..)  
  - [สำหรับนักเรียนและผู้เริ่มต้น](../..)  
  - [สำหรับนักพัฒนา](../..)  
  - [สำหรับวิศวกร DevOps](../..)  
- [เอกสาร](../..)  
  - [เริ่มต้นใช้งาน](../..)  
  - [การปรับใช้และการจัดเตรียม](../..)  
  - [การตรวจสอบก่อนการปรับใช้](../..)  
  - [AI และ Azure AI Foundry](../..)  
  - [การแก้ไขปัญหา](../..)  
- [ตัวอย่างและเทมเพลต](../..)  
  - [แนะนำ: เทมเพลต Azure AI Foundry](../..)  
  - [แนะนำ: สถานการณ์ E2E ของ Azure AI Foundry](../..)  
  - [เทมเพลต AZD เพิ่มเติม](../..)  
  - [ห้องปฏิบัติการและเวิร์กช็อป](../..)  
- [ทรัพยากร](../..)  
- [การมีส่วนร่วม](../..)  
- [การสนับสนุน](../..)  
- [ชุมชน](../..)  

## Azure Developer CLI คืออะไร?

Azure Developer CLI (azd) เป็นเครื่องมือบรรทัดคำสั่งที่เน้นนักพัฒนา ซึ่งช่วยเร่งกระบวนการสร้างและปรับใช้แอปพลิเคชันไปยัง Azure โดยมีคุณสมบัติ:  
- **การปรับใช้ตามเทมเพลต** - ใช้เทมเพลตที่สร้างไว้ล่วงหน้าสำหรับรูปแบบแอปพลิเคชันทั่วไป  
- **Infrastructure as Code** - จัดการทรัพยากร Azure โดยใช้ Bicep หรือ Terraform  
- **เวิร์กโฟลว์แบบบูรณาการ** - จัดเตรียม ปรับใช้ และตรวจสอบแอปพลิเคชันได้อย่างราบรื่น  
- **เหมาะสำหรับนักพัฒนา** - ปรับให้เหมาะสมสำหรับประสิทธิภาพและประสบการณ์ของนักพัฒนา  

### **AZD + Azure AI Foundry: เหมาะสำหรับการปรับใช้ AI**

**ทำไมต้องใช้ AZD สำหรับโซลูชัน AI?** AZD ช่วยแก้ปัญหาสำคัญที่นักพัฒนา AI เผชิญ:  
- **เทมเพลตที่พร้อมสำหรับ AI** - เทมเพลตที่ตั้งค่าไว้ล่วงหน้าสำหรับ Azure OpenAI, Cognitive Services และงาน ML  
- **การปรับใช้ AI อย่างปลอดภัย** - รูปแบบความปลอดภัยในตัวสำหรับบริการ AI, API keys และ endpoints ของโมเดล  
- **รูปแบบ AI สำหรับการผลิต** - แนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้แอปพลิเคชัน AI ที่ปรับขนาดได้และคุ้มค่า  
- **เวิร์กโฟลว์ AI แบบครบวงจร** - ตั้งแต่การพัฒนาโมเดลไปจนถึงการปรับใช้ในระบบผลิตพร้อมการตรวจสอบที่เหมาะสม  
- **การปรับต้นทุนให้เหมาะสม** - กลยุทธ์การจัดสรรทรัพยากรและการปรับขนาดที่ชาญฉลาดสำหรับงาน AI  
- **การผสานรวม Azure AI Foundry** - การเชื่อมต่อกับแคตตาล็อกโมเดลและ endpoints ของ AI Foundry อย่างราบรื่น  

## เริ่มต้นใช้งาน

### ข้อกำหนดเบื้องต้น  
- การสมัครใช้งาน Azure  
- ติดตั้ง Azure CLI  
- Git (สำหรับการโคลนเทมเพลต)  

### การติดตั้ง  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### การปรับใช้ครั้งแรกของคุณ  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

### การปรับใช้ AI ครั้งแรกของคุณ  
```bash
# Initialize an AI-powered chat application with Azure OpenAI
azd init --template azure-search-openai-demo

# Configure AI services and deploy
azd up

# Or try other AI templates:
azd init --template openai-chat-app-quickstart
azd init --template ai-document-processing
azd init --template contoso-chat
```  

## เส้นทางการเรียนรู้

### สำหรับนักพัฒนา AI (แนะนำให้เริ่มที่นี่!)  
1. **เริ่มต้นใช้งาน**: ลองใช้เทมเพลต [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)  
2. **เรียนรู้พื้นฐาน**: [AZD Basics](docs/getting-started/azd-basics.md) + [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)  
3. **ฝึกปฏิบัติ**: ทำ [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md)  
4. **พร้อมใช้งานจริง**: ทบทวน [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md)  
5. **ขั้นสูง**: ปรับใช้เทมเพลตองค์กร [contoso-chat](https://github.com/Azure-Samples/contoso-chat)  

### สำหรับนักเรียนและผู้เริ่มต้น  
1. เริ่มต้นด้วย [AZD Basics](docs/getting-started/azd-basics.md)  
2. ทำตาม [คู่มือการติดตั้ง](docs/getting-started/installation.md)  
3. ทำ [โปรเจกต์แรกของคุณ](docs/getting-started/first-project.md)  
4. ฝึกฝนด้วย [ตัวอย่างแอปเว็บง่ายๆ](../../examples/simple-web-app)  

### สำหรับนักพัฒนา  
1. ทบทวน [คู่มือการตั้งค่า](docs/getting-started/configuration.md)  
2. ศึกษา [คู่มือการปรับใช้](docs/deployment/deployment-guide.md)  
3. ทำงานผ่าน [ตัวอย่างแอปฐานข้อมูล](../../examples/database-app)  
4. สำรวจ [ตัวอย่างแอปคอนเทนเนอร์](../../examples/container-app)  

### สำหรับวิศวกร DevOps  
1. เชี่ยวชาญ [การจัดเตรียมทรัพยากร](docs/deployment/provisioning.md)  
2. ดำเนินการ [การตรวจสอบก่อนการปรับใช้](docs/pre-deployment/preflight-checks.md)  
3. ฝึกฝน [การวางแผนความจุ](docs/pre-deployment/capacity-planning.md)  
4. ขั้นสูง [ตัวอย่างไมโครเซอร์วิส](../../examples/microservices)  

## เอกสาร

### เริ่มต้นใช้งาน  
- [**AZD Basics**](docs/getting-started/azd-basics.md) - แนวคิดและคำศัพท์หลัก  
- [**การติดตั้งและตั้งค่า**](docs/getting-started/installation.md) - คู่มือการติดตั้งเฉพาะแพลตฟอร์ม  
- [**การตั้งค่า**](docs/getting-started/configuration.md) - การตั้งค่าสภาพแวดล้อมและการรับรองความถูกต้อง  
- [**โปรเจกต์แรกของคุณ**](docs/getting-started/first-project.md) - บทแนะนำทีละขั้นตอน  

### การปรับใช้และการจัดเตรียม  
- [**คู่มือการปรับใช้**](docs/deployment/deployment-guide.md) - เวิร์กโฟลว์การปรับใช้อย่างสมบูรณ์  
- [**การจัดเตรียมทรัพยากร**](docs/deployment/provisioning.md) - การจัดการทรัพยากร Azure  

### การตรวจสอบก่อนการปรับใช้  
- [**การวางแผนความจุ**](docs/pre-deployment/capacity-planning.md) - การตรวจสอบความจุทรัพยากร Azure  
- [**การเลือก SKU**](docs/pre-deployment/sku-selection.md) - การเลือก SKU ของ Azure ที่เหมาะสม  
- [**การตรวจสอบก่อนการปรับใช้**](docs/pre-deployment/preflight-checks.md) - สคริปต์การตรวจสอบอัตโนมัติ  

### AI และ Azure AI Foundry  
- [**การผสานรวม Azure AI Foundry**](docs/ai-foundry/azure-ai-foundry-integration.md) - เชื่อมต่อ AZD กับบริการ Azure AI Foundry  
- [**รูปแบบการปรับใช้โมเดล AI**](docs/ai-foundry/ai-model-deployment.md) - ปรับใช้และจัดการโมเดล AI ด้วย AZD  
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - ห้องปฏิบัติการ: ทำให้โซลูชัน AI พร้อมใช้งานกับ AZD  
- [**แนวทางปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต**](docs/ai-foundry/production-ai-practices.md) - ความปลอดภัย การปรับขนาด และการตรวจสอบสำหรับงาน AI  

### การแก้ไขปัญหา  
- [**ปัญหาที่พบบ่อย**](docs/troubleshooting/common-issues.md) - ปัญหาและวิธีแก้ไขที่พบบ่อย
- [**คู่มือการดีบัก**](docs/troubleshooting/debugging.md) - กลยุทธ์การดีบักทีละขั้นตอน  
- [**การแก้ไขปัญหาเฉพาะด้าน AI**](docs/troubleshooting/ai-troubleshooting.md) - ปัญหาการให้บริการ AI และการปรับใช้โมเดล  

## ตัวอย่างและเทมเพลต  

### [แนะนำ: เทมเพลต Azure AI Foundry](https://ai.azure.com/resource/build/templates)  
**เริ่มต้นที่นี่หากคุณกำลังปรับใช้แอปพลิเคชัน AI!**  

| เทมเพลต | คำอธิบาย | ความซับซ้อน | บริการ |  
|----------|-------------|------------|----------|  
| [**เริ่มต้นกับ AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | สร้างและปรับใช้แอปพลิเคชันแชทพื้นฐานที่ผสานรวมกับข้อมูลและข้อมูลเชิงลึกด้านเทเลเมทรีของคุณโดยใช้ Azure Container Apps |⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |  
| [**เริ่มต้นกับ AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | สร้างและปรับใช้แอปพลิเคชันเอเจนต์พื้นฐานพร้อมการดำเนินการและข้อมูลเชิงลึกด้านเทเลเมทรีโดยใช้ Azure Container Apps |⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|  
| [**การทำงานอัตโนมัติด้วยหลายเอเจนต์**](https://github.com/Azure-Samples/get-started-with-ai-chat) | เพิ่มประสิทธิภาพการวางแผนงานและการทำงานอัตโนมัติโดยการจัดการและควบคุมกลุ่ม AI agents |⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**สร้างเอกสารจากข้อมูลของคุณ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | เร่งการสร้างเอกสาร เช่น สัญญา ใบแจ้งหนี้ และข้อเสนอการลงทุน โดยการค้นหาและสรุปข้อมูลที่เกี่ยวข้องจากข้อมูลของคุณ |⭐⭐⭐ | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|  
| [**ปรับปรุงการประชุมลูกค้าด้วยเอเจนต์**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ย้ายโค้ดเก่าไปยังภาษาสมัยใหม่โดยใช้ทีมเอเจนต์ |⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |  
| [**ปรับปรุงโค้ดของคุณด้วยเอเจนต์**](https://github.com/Azure-Samples/get-started-with-ai-chat) | สร้างและปรับใช้แอปพลิเคชันแชทพื้นฐานที่ผสานรวมกับข้อมูลและข้อมูลเชิงลึกด้านเทเลเมทรีของคุณโดยใช้ Azure Container Apps |⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|  
| [**สร้างเอเจนต์สนทนาของคุณ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ใช้ความเข้าใจการสนทนาขั้นสูงเพื่อสร้างและปรับปรุงแชทบอทและเอเจนต์ด้วยเวิร์กโฟลว์ที่กำหนดได้และควบคุมโดยมนุษย์ |⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|  
| [**ปลดล็อกข้อมูลเชิงลึกจากข้อมูลการสนทนา**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ปรับปรุงประสิทธิภาพของศูนย์บริการลูกค้าโดยค้นหาข้อมูลเชิงลึกจากชุดข้อมูลเสียงและข้อความขนาดใหญ่โดยใช้ความสามารถในการทำความเข้าใจเนื้อหาขั้นสูง |⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|  
| [**การประมวลผลเนื้อหาหลายรูปแบบ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ประมวลผลการเรียกร้อง ใบแจ้งหนี้ สัญญา และเอกสารอื่น ๆ อย่างรวดเร็วและแม่นยำโดยการดึงข้อมูลจากเนื้อหาที่ไม่มีโครงสร้างและแปลงเป็นรูปแบบที่มีโครงสร้าง เทมเพลตนี้รองรับข้อความ รูปภาพ ตาราง และกราฟ |⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|  

### แนะนำ: Azure AI Foundry E2E Scenarios  
**เริ่มต้นที่นี่หากคุณกำลังปรับใช้แอปพลิเคชัน AI!**  

| เทมเพลต | คำอธิบาย | ความซับซ้อน | บริการ |  
|----------|-------------|------------|----------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | อินเทอร์เฟซแชทง่าย ๆ กับ Azure OpenAI | ⭐ | AzureOpenAI + Container Apps |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | แอปแชทที่เปิดใช้งาน RAG กับ Azure OpenAI | ⭐⭐ | AzureOpenAI + Search + App Service |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | การวิเคราะห์เอกสารด้วยบริการ AI | ⭐⭐ | Azure Document Intelligence + Functions |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | เฟรมเวิร์ก AI agent พร้อมการเรียกฟังก์ชัน | ⭐⭐⭐ | AzureOpenAI + Azure Container Apps + Functions |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | แชทสำหรับองค์กรพร้อมการจัดการ AI | ⭐⭐⭐ | AzureOpenAI + Azure AI Search + Container Apps |  

### เทมเพลต AZD เพิ่มเติม  
- [**ไดเรกทอรีตัวอย่าง**](examples/README.md) - ตัวอย่างจริง เทมเพลต และสถานการณ์ในโลกจริง  
- [**เทมเพลต AZD ของ Azure-Samples**](https://github.com/Azure-Samples/azd-templates) - เทมเพลตตัวอย่างอย่างเป็นทางการของ Microsoft  
- [**แกลเลอรี AZD ที่ยอดเยี่ยม**](https://azure.github.io/awesome-azd/) - เทมเพลตที่ชุมชนมีส่วนร่วม  

### ห้องปฏิบัติการและเวิร์กช็อป  
- [**ห้องปฏิบัติการเวิร์กช็อป AI**](docs/ai-foundry/ai-workshop-lab.md) - **ใหม่**: ทำให้โซลูชัน AI ของคุณสามารถปรับใช้ AZD ได้  
- [**เวิร์กช็อป AZD สำหรับผู้เริ่มต้น**](workshop/README.md) - มุ่งเน้นไปที่การปรับใช้เทมเพลต AZD สำหรับ AI Agents  

## ทรัพยากร  

### อ้างอิงด่วน  
- [**ชีทคำสั่ง**](resources/cheat-sheet.md) - คำสั่ง azd ที่จำเป็น  
- [**อภิธานศัพท์**](resources/glossary.md) - คำศัพท์ Azure และ azd  
- [**คำถามที่พบบ่อย**](resources/faq.md) - คำถามที่พบบ่อย  
- [**คู่มือการศึกษา**](resources/study-guide.md) - วัตถุประสงค์การเรียนรู้และแบบฝึกหัดที่ครอบคลุม  

### ทรัพยากรภายนอก  
- [เอกสาร CLI สำหรับนักพัฒนา Azure](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [เครื่องคำนวณราคา Azure](https://azure.microsoft.com/pricing/calculator/)  
- [สถานะ Azure](https://status.azure.com/)  

## การมีส่วนร่วม  

เรายินดีรับการมีส่วนร่วม! โปรดอ่าน [คู่มือการมีส่วนร่วม](CONTRIBUTING.md) สำหรับรายละเอียดเกี่ยวกับ:  
- วิธีส่งปัญหาและคำขอฟีเจอร์  
- แนวทางการมีส่วนร่วมในโค้ด  
- การปรับปรุงเอกสาร  
- มาตรฐานชุมชน  

## การสนับสนุน  

- **ปัญหา**: [รายงานข้อบกพร่องและขอฟีเจอร์](https://github.com/microsoft/azd-for-beginners/issues)  
- **การสนทนา**: [ถามตอบและการสนทนาในชุมชน Microsoft Azure Discord](https://discord.gg/microsoft-azure)  
- **การสนับสนุนเฉพาะด้าน AI**: เข้าร่วม [ช่อง #Azure](https://discord.gg/microsoft-azure) สำหรับการสนทนา AZD + AI Foundry  
- **อีเมล**: สำหรับการสอบถามส่วนตัว  
- **Microsoft Learn**: [เอกสาร CLI สำหรับนักพัฒนา Azure อย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### ข้อมูลเชิงลึกจากชุมชนใน Azure AI Foundry Discord  

**ผลสำรวจจากช่อง #Azure:**  
- **45%** ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI  
- **ความท้าทายหลัก**: การปรับใช้หลายบริการ การจัดการข้อมูลรับรอง ความพร้อมใช้งานในระดับการผลิต  
- **สิ่งที่ร้องขอมากที่สุด**: เทมเพลตเฉพาะด้าน AI คู่มือการแก้ไขปัญหา แนวทางปฏิบัติที่ดีที่สุด  

**เข้าร่วมชุมชนของเราเพื่อ:**  
- แบ่งปันประสบการณ์ AZD + AI ของคุณและรับความช่วยเหลือ  
- เข้าถึงตัวอย่างเทมเพลต AI ใหม่ก่อนใคร  
- มีส่วนร่วมในแนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ AI  
- มีอิทธิพลต่อการพัฒนาฟีเจอร์ AI + AZD ในอนาคต  

## ใบอนุญาต  

โครงการนี้ได้รับอนุญาตภายใต้ใบอนุญาต MIT - ดูไฟล์ [LICENSE](../../LICENSE) สำหรับรายละเอียด  

## หลักสูตรอื่น ๆ  

ทีมของเราผลิตหลักสูตรอื่น ๆ! ลองดู:  

- [**ใหม่** โปรโตคอลบริบทโมเดล (MCP) สำหรับผู้เริ่มต้น](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents สำหรับผู้เริ่มต้น](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI สำหรับผู้เริ่มต้นโดยใช้ .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generative AI สำหรับผู้เริ่มต้น](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI สำหรับผู้เริ่มต้นโดยใช้ Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML สำหรับผู้เริ่มต้น](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [วิทยาศาสตร์ข้อมูลสำหรับผู้เริ่มต้น](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI สำหรับผู้เริ่มต้น](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [ความปลอดภัยทางไซเบอร์สำหรับผู้เริ่มต้น](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [การพัฒนาเว็บสำหรับผู้เริ่มต้น](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT สำหรับผู้เริ่มต้น](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [การพัฒนา XR สำหรับผู้เริ่มต้น](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [การใช้ GitHub Copilot สำหรับการเขียนโปรแกรมคู่ AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [การใช้ GitHub Copilot สำหรับนักพัฒนา C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [เลือกการผจญภัย Copilot ของคุณเอง](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**การนำทาง**  
- **บทเรียนถัดไป**: [พื้นฐาน AZD](docs/getting-started/azd-basics.md)  

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้องมากที่สุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาที่เป็นต้นฉบับควรถือว่าเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษาจากผู้เชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดซึ่งเกิดจากการใช้การแปลนี้