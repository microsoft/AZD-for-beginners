<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T10:02:53+00:00",
  "source_file": "README.md",
  "language_code": "th"
}
-->
# AZD สำหรับผู้เริ่มต้น

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.th.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

ทำตามขั้นตอนเหล่านี้เพื่อเริ่มต้นใช้งานทรัพยากรเหล่านี้:  
1. **Fork Repository**: คลิก [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Clone Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**เข้าร่วมชุมชน Azure Discord และพบปะผู้เชี่ยวชาญและนักพัฒนาคนอื่นๆ**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 การสนับสนุนหลายภาษา

#### รองรับผ่าน GitHub Action (อัตโนมัติและอัปเดตเสมอ)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](./README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**หากคุณต้องการให้มีการสนับสนุนภาษาเพิ่มเติม รายการภาษาที่รองรับอยู่ [ที่นี่](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## บทนำ

ยินดีต้อนรับสู่คู่มือฉบับสมบูรณ์สำหรับ Azure Developer CLI (azd) Repository นี้ถูกออกแบบมาเพื่อช่วยนักพัฒนาทุกระดับ ตั้งแต่นักเรียนไปจนถึงนักพัฒนามืออาชีพ ในการเรียนรู้และเชี่ยวชาญ Azure Developer CLI เพื่อการปรับใช้ระบบคลาวด์อย่างมีประสิทธิภาพ ทรัพยากรการเรียนรู้นี้มีการเรียนรู้แบบลงมือปฏิบัติจริงเกี่ยวกับการปรับใช้ระบบคลาวด์ Azure การแก้ไขปัญหาที่พบบ่อย และการนำแนวทางปฏิบัติที่ดีที่สุดไปใช้สำหรับการปรับใช้เทมเพลต AZD อย่างสำเร็จ  

## เป้าหมายการเรียนรู้

เมื่อทำงานผ่าน Repository นี้ คุณจะ:  
- เชี่ยวชาญพื้นฐานและแนวคิดหลักของ Azure Developer CLI  
- เรียนรู้การปรับใช้และจัดเตรียมทรัพยากร Azure โดยใช้ Infrastructure as Code  
- พัฒนาทักษะการแก้ไขปัญหาสำหรับปัญหาการปรับใช้ AZD ที่พบบ่อย  
- เข้าใจการตรวจสอบก่อนการปรับใช้และการวางแผนความจุ  
- นำแนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัยและกลยุทธ์การเพิ่มประสิทธิภาพต้นทุนไปใช้  
- สร้างความมั่นใจในการปรับใช้แอปพลิเคชันที่พร้อมใช้งานในระดับการผลิตไปยัง Azure  

## ผลลัพธ์การเรียนรู้

หลังจากจบหลักสูตรนี้ คุณจะสามารถ:  
- ติดตั้ง ตั้งค่า และใช้งาน Azure Developer CLI ได้สำเร็จ  
- สร้างและปรับใช้แอปพลิเคชันโดยใช้เทมเพลต AZD  
- แก้ไขปัญหาการรับรองความถูกต้อง โครงสร้างพื้นฐาน และปัญหาการปรับใช้  
- ดำเนินการตรวจสอบก่อนการปรับใช้ รวมถึงการวางแผนความจุและการเลือก SKU  
- นำแนวทางปฏิบัติที่ดีที่สุดด้านการตรวจสอบ ความปลอดภัย และการจัดการต้นทุนไปใช้  
- ผสานรวมเวิร์กโฟลว์ AZD เข้ากับ CI/CD pipelines  

## สารบัญ

- [Azure Developer CLI คืออะไร?](../..)  
- [เริ่มต้นใช้งาน](../..)  
- [เอกสาร](../..)  
- [ตัวอย่างและเทมเพลต](../..)  
- [ทรัพยากร](../..)  
- [การมีส่วนร่วม](../..)  

## Azure Developer CLI คืออะไร?

Azure Developer CLI (azd) เป็นเครื่องมือบรรทัดคำสั่งที่เน้นนักพัฒนา ซึ่งช่วยเร่งกระบวนการสร้างและปรับใช้แอปพลิเคชันไปยัง Azure โดยมีคุณสมบัติ:  

- **การปรับใช้ตามเทมเพลต** - ใช้เทมเพลตที่สร้างไว้ล่วงหน้าสำหรับรูปแบบแอปพลิเคชันทั่วไป  
- **Infrastructure as Code** - จัดการทรัพยากร Azure โดยใช้ Bicep หรือ Terraform  
- **เวิร์กโฟลว์ที่ผสานรวม** - จัดเตรียม ปรับใช้ และตรวจสอบแอปพลิเคชันได้อย่างราบรื่น  
- **เหมาะสำหรับนักพัฒนา** - ปรับให้เหมาะสมสำหรับประสิทธิภาพและประสบการณ์ของนักพัฒนา  

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

## เอกสาร

### เริ่มต้นใช้งาน  
- [**พื้นฐาน AZD**](docs/getting-started/azd-basics.md) - แนวคิดและคำศัพท์หลัก  
- [**การติดตั้งและตั้งค่า**](docs/getting-started/installation.md) - คู่มือการติดตั้งเฉพาะแพลตฟอร์ม  
- [**การตั้งค่า**](docs/getting-started/configuration.md) - การตั้งค่าสภาพแวดล้อมและการรับรองความถูกต้อง  
- [**โปรเจกต์แรกของคุณ**](docs/getting-started/first-project.md) - บทแนะนำทีละขั้นตอน  

### การปรับใช้และการจัดเตรียม  
- [**คู่มือการปรับใช้**](docs/deployment/deployment-guide.md) - เวิร์กโฟลว์การปรับใช้อย่างสมบูรณ์  
- [**การจัดเตรียมทรัพยากร**](docs/deployment/provisioning.md) - การจัดการทรัพยากร Azure  

### การตรวจสอบก่อนการปรับใช้  
- [**การวางแผนความจุ**](docs/pre-deployment/capacity-planning.md) - การตรวจสอบความจุของทรัพยากร Azure  
- [**การเลือก SKU**](docs/pre-deployment/sku-selection.md) - การเลือก SKU ของ Azure ที่เหมาะสม  
- [**การตรวจสอบก่อนการปรับใช้**](docs/pre-deployment/preflight-checks.md) - สคริปต์การตรวจสอบอัตโนมัติ  

### การแก้ไขปัญหา  
- [**ปัญหาที่พบบ่อย**](docs/troubleshooting/common-issues.md) - ปัญหาและวิธีแก้ไขที่พบบ่อย  
- [**คู่มือการดีบัก**](docs/troubleshooting/debugging.md) - กลยุทธ์การดีบักทีละขั้นตอน  

## ตัวอย่างและเทมเพลต  
- [**ตัวอย่าง**](examples/README.md) - ตัวอย่างจริง เทมเพลต และสถานการณ์ในโลกจริงเพื่อช่วยให้คุณเรียนรู้ Azure Developer CLI ผ่านการฝึกปฏิบัติจริง แต่ละตัวอย่างมีโค้ดที่ทำงานได้สมบูรณ์ เทมเพลตโครงสร้างพื้นฐาน และคำแนะนำโดยละเอียดสำหรับสถาปัตยกรรมแอปพลิเคชันและรูปแบบการปรับใช้ต่างๆ  

### การลงมือปฏิบัติ/เวิร์กช็อป  
- [**AZD สำหรับผู้เริ่มต้น**](workshop/README.md) - เวิร์กช็อปนี้จะเน้นเทมเพลต AZD Get Started with AI Agents และให้การปฏิบัติจริงเกี่ยวกับแนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้บริการ Azure AI โดยใช้ AZD  

## ทรัพยากร

### อ้างอิงด่วน  
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - คำสั่ง azd ที่จำเป็น  
- [**คำศัพท์**](resources/glossary.md) - คำศัพท์ Azure และ azd  
- [**FAQ**](resources/faq.md) - คำถามที่พบบ่อย  
- [**คู่มือการศึกษา**](resources/study-guide.md) - วัตถุประสงค์การเรียนรู้และแบบฝึกหัดที่ครอบคลุม  

### ทรัพยากรภายนอก  
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## เส้นทางการเรียนรู้

### สำหรับนักเรียนและผู้เริ่มต้น  
1. เริ่มต้นด้วย [พื้นฐาน AZD](docs/getting-started/azd-basics.md)  
2. ทำตาม [คู่มือการติดตั้ง](docs/getting-started/installation.md)  
3. ทำโปรเจกต์แรกของคุณให้เสร็จ [โปรเจกต์แรกของคุณ](docs/getting-started/first-project.md)  
4. ฝึกฝนกับ [ตัวอย่างแอปเว็บง่ายๆ](../../examples/simple-web-app)  

### สำหรับนักพัฒนา  
1. ทบทวน [คู่มือการตั้งค่า](docs/getting-started/configuration.md)  
2. ศึกษา [คู่มือการปรับใช้](docs/deployment/deployment-guide.md)  
3. ทำงานผ่าน [ตัวอย่างแอปฐานข้อมูล](../../examples/database-app)  
4. สำรวจ [ตัวอย่างแอปคอนเทนเนอร์](../../examples/container-app)  

### สำหรับวิศวกร DevOps  
1. เชี่ยวชาญ [การจัดเตรียมทรัพยากร](docs/deployment/provisioning.md)  
2. ดำเนินการ [การตรวจสอบก่อนการปรับใช้](docs/pre-deployment/preflight-checks.md)  
3. ฝึกฝน [การวางแผนความจุ](docs/pre-deployment/capacity-planning.md)  
4. ตัวอย่างขั้นสูง [ตัวอย่างไมโครเซอร์วิส](../../examples/microservices)  

## การมีส่วนร่วม

เรายินดีต้อนรับการมีส่วนร่วม! โปรดอ่าน [คู่มือการมีส่วนร่วม](CONTRIBUTING.md) สำหรับรายละเอียดเกี่ยวกับ:  
- วิธีส่งปัญหาและคำขอฟีเจอร์  
- แนวทางการมีส่วนร่วมในโค้ด  
- การปรับปรุงเอกสาร  
- มาตรฐานชุมชน  

## การสนับสนุน

- **ปัญหา**: [รายงานข้อบกพร่องและขอฟีเจอร์](https://github.com/microsoft/azd-for-beginners/issues)  
- **การสนทนา**: [ถามตอบและการสนทนาในชุมชน Microsoft Azure Discord](https://discord.gg/microsoft-azure)  
- **อีเมล**: สำหรับการสอบถามส่วนตัว  
- **Microsoft Learn**: [เอกสาร Azure Developer CLI อย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## ใบอนุญาต

โปรเจกต์นี้ได้รับอนุญาตภายใต้ MIT License - ดูไฟล์ [LICENSE](../../LICENSE) สำหรับรายละเอียด  

## 🎒 หลักสูตรอื่นๆ

ทีมของเราผลิตหลักสูตรอื่นๆ! ดูที่:  

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
- [การพัฒนา XR สำหรับผู้เริ่มต้น](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [การใช้งาน GitHub Copilot อย่างเชี่ยวชาญสำหรับการเขียนโปรแกรมคู่ด้วย AI](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [การใช้งาน GitHub Copilot อย่างเชี่ยวชาญสำหรับนักพัฒนา C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [เลือกการผจญภัย Copilot ของคุณเอง](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**การนำทาง**
- **บทเรียนถัดไป**: [พื้นฐาน AZD](docs/getting-started/azd-basics.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามนุษย์ที่มีความเชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดซึ่งเกิดจากการใช้การแปลนี้