<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3df05e83c2307e92452bd7c3307ae849",
  "translation_date": "2025-09-24T21:11:45+00:00",
  "source_file": "README.md",
  "language_code": "th"
}
-->
# AZD สำหรับผู้เริ่มต้น: เส้นทางการเรียนรู้ที่มีโครงสร้าง

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.th.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## เริ่มต้นกับคอร์สนี้

ทำตามขั้นตอนเหล่านี้เพื่อเริ่มต้นเส้นทางการเรียนรู้ AZD ของคุณ:

1. **Fork Repository**: คลิก [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **เข้าร่วมชุมชน**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) เพื่อรับการสนับสนุนจากผู้เชี่ยวชาญ
4. **เลือกเส้นทางการเรียนรู้**: เลือกบทที่เหมาะกับระดับประสบการณ์ของคุณด้านล่าง

### รองรับหลายภาษา

#### การแปลอัตโนมัติ (อัปเดตเสมอ)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](./README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## ภาพรวมของคอร์ส

เรียนรู้การใช้ Azure Developer CLI (azd) ผ่านบทเรียนที่มีโครงสร้างเพื่อการเรียนรู้ที่ก้าวหน้า **เน้นพิเศษในการปรับใช้แอปพลิเคชัน AI ด้วยการผสาน Azure AI Foundry**

### ทำไมคอร์สนี้จึงสำคัญสำหรับนักพัฒนาสมัยใหม่

จากข้อมูลเชิงลึกของชุมชน Azure AI Foundry Discord **45% ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI** แต่พบปัญหาเกี่ยวกับ:
- สถาปัตยกรรม AI หลายบริการที่ซับซ้อน
- แนวทางปฏิบัติที่ดีที่สุดในการปรับใช้ AI ในการผลิต  
- การผสานและการตั้งค่าบริการ Azure AI
- การปรับค่าใช้จ่ายสำหรับงาน AI
- การแก้ไขปัญหาเฉพาะการปรับใช้ AI

### วัตถุประสงค์การเรียนรู้

เมื่อจบคอร์สนี้ คุณจะสามารถ:
- **เข้าใจพื้นฐาน AZD**: แนวคิดหลัก การติดตั้ง และการตั้งค่า
- **ปรับใช้แอปพลิเคชัน AI**: ใช้ AZD กับบริการ Azure AI Foundry
- **ใช้ Infrastructure as Code**: จัดการทรัพยากร Azure ด้วย Bicep templates
- **แก้ไขปัญหาการปรับใช้**: แก้ไขปัญหาทั่วไปและดีบัก
- **ปรับปรุงสำหรับการผลิต**: ความปลอดภัย การปรับขนาด การตรวจสอบ และการจัดการค่าใช้จ่าย
- **สร้างโซลูชัน Multi-Agent**: ปรับใช้สถาปัตยกรรม AI ที่ซับซ้อน

## 📚 บทเรียนการเรียนรู้

*เลือกเส้นทางการเรียนรู้ตามระดับประสบการณ์และเป้าหมายของคุณ*

### 🚀 บทที่ 1: พื้นฐานและเริ่มต้นอย่างรวดเร็ว
**ข้อกำหนดเบื้องต้น**: การสมัครสมาชิก Azure, ความรู้พื้นฐานเกี่ยวกับ Command Line  
**ระยะเวลา**: 30-45 นาที  
**ความซับซ้อน**: ⭐

#### สิ่งที่คุณจะได้เรียนรู้
- เข้าใจพื้นฐานของ Azure Developer CLI
- การติดตั้ง AZD บนแพลตฟอร์มของคุณ
- การปรับใช้ครั้งแรกที่สำเร็จ

#### แหล่งข้อมูลการเรียนรู้
- **🎯 เริ่มต้นที่นี่**: [Azure Developer CLI คืออะไร?](../..)
- **📖 ทฤษฎี**: [พื้นฐาน AZD](docs/getting-started/azd-basics.md) - แนวคิดและคำศัพท์หลัก
- **⚙️ การตั้งค่า**: [การติดตั้งและการตั้งค่า](docs/getting-started/installation.md) - คู่มือเฉพาะแพลตฟอร์ม
- **🛠️ การลงมือทำ**: [โปรเจกต์แรกของคุณ](docs/getting-started/first-project.md) - บทแนะนำทีละขั้นตอน
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
- การผสาน Azure AI Foundry กับ AZD
- การปรับใช้แอปพลิเคชันที่ขับเคลื่อนด้วย AI
- เข้าใจการตั้งค่าบริการ AI

#### แหล่งข้อมูลการเรียนรู้
- **🎯 เริ่มต้นที่นี่**: [การผสาน Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 รูปแบบ**: [การปรับใช้โมเดล AI](docs/ai-foundry/ai-model-deployment.md) - การปรับใช้และจัดการโมเดล AI
- **🛠️ เวิร์กช็อป**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - ทำให้โซลูชัน AI ของคุณพร้อมใช้งานกับ AZD
- **🎥 คู่มือแบบโต้ตอบ**: [วัสดุเวิร์กช็อป](workshop/README.md) - การเรียนรู้ผ่านเบราว์เซอร์ด้วย MkDocs * DevContainer Environment
- **📋 เทมเพลต**: [Azure AI Foundry Templates](../..)

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
- **📖 การตั้งค่า**: [คู่มือการตั้งค่า](docs/getting-started/configuration.md) - การตั้งค่าสภาพแวดล้อม
- **🔐 ความปลอดภัย**: รูปแบบการตรวจสอบสิทธิ์และ Managed Identity
- **📝 ตัวอย่าง**: [ตัวอย่างแอปฐานข้อมูล](../../examples/database-app) - รูปแบบการตั้งค่า

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
- **📖 การปรับใช้**: [คู่มือการปรับใช้](docs/deployment/deployment-guide.md) - เวิร์กโฟลว์ที่สมบูรณ์
- **🏗️ การจัดสรรทรัพยากร**: [การจัดสรรทรัพยากร](docs/deployment/provisioning.md) - การจัดการทรัพยากร Azure
- **📝 ตัวอย่าง**: [ตัวอย่างแอป Container](../../examples/container-app) - การปรับใช้แบบ Containerized

#### แบบฝึกหัด
- สร้าง Bicep templates แบบกำหนดเอง
- ปรับใช้แอปพลิเคชันหลายบริการ
- ใช้กลยุทธ์การปรับใช้แบบ Blue-Green

**💡 ผลลัพธ์ของบทนี้**: ปรับใช้แอปพลิเคชันหลายบริการที่ซับซ้อนโดยใช้ Infrastructure templates แบบกำหนดเอง

---

### 🎯 บทที่ 5: โซลูชัน AI Multi-Agent (ขั้นสูง)
**ข้อกำหนดเบื้องต้น**: จบบทที่ 1-2  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบสถาปัตยกรรม Multi-Agent
- การจัดการและการประสานงานของ Agent
- การปรับใช้ AI ที่พร้อมสำหรับการผลิต

#### แหล่งข้อมูลการเรียนรู้
- **🤖 โปรเจกต์เด่น**: [โซลูชัน Multi-Agent สำหรับการค้าปลีก](examples/retail-scenario.md) - การดำเนินการที่สมบูรณ์
- **🛠️ ARM Templates**: [แพ็กเกจ ARM Template](../../examples/retail-multiagent-arm-template) - การปรับใช้แบบคลิกเดียว
- **📖 สถาปัตยกรรม**: รูปแบบการประสานงาน Multi-Agent

#### แบบฝึกหัด
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ผลลัพธ์ของบทนี้**: ปรับใช้และจัดการโซลูชัน AI Multi-Agent ที่พร้อมสำหรับการผลิต พร้อม Agent ลูกค้าและสินค้าคงคลัง

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
- **📊 การวางแผน**: [การวางแผนความจุ](docs/pre-deployment/capacity-planning.md) - การตรวจสอบทรัพยากร
- **💰 การเลือก**: [การเลือก SKU](docs/pre-deployment/sku-selection.md) - ตัวเลือกที่คุ้มค่า
- **✅ การตรวจสอบ**: [การตรวจสอบก่อนการปรับใช้](docs/pre-deployment/preflight-checks.md) - สคริปต์อัตโนมัติ

#### แบบฝึกหัด
- รันสคริปต์ตรวจสอบความจุ
- ปรับการเลือก SKU ให้เหมาะสมกับค่าใช้จ่าย
- ใช้การตรวจสอบก่อนการปรับใช้อัตโนมัติ

**💡 ผลลัพธ์ของบทนี้**: ตรวจสอบและปรับปรุงการปรับใช้ก่อนดำเนินการ

---

### 🚨 บทที่ 7: การแก้ไขปัญหาและการดีบัก
**ข้อกำหนดเบื้องต้น**: บทการปรับใช้ใดๆ ที่จบแล้ว  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- วิธีการดีบักอย่างเป็นระบบ
- ปัญหาทั่วไปและวิธีแก้ไข
- การแก้ไขปัญหาเฉพาะ AI

#### แหล่งข้อมูลการเรียนรู้
- **🔧 ปัญหาทั่วไป**: [ปัญหาทั่วไป](docs/troubleshooting/common-issues.md) - FAQ และวิธีแก้ไข
- **🕵️ การดีบัก**: [คู่มือการดีบัก](docs/troubleshooting/debugging.md) - กลยุทธ์ทีละขั้นตอน
- **🤖 ปัญหา AI**: [การแก้ไขปัญหาเฉพาะ AI](docs/troubleshooting/ai-troubleshooting.md) - ปัญหาบริการ AI

#### แบบฝึกหัด
- วินิจฉัยความล้มเหลวในการปรับใช้
- แก้ไขปัญหาการตรวจสอบสิทธิ์
- ดีบักการเชื่อมต่อบริการ AI

**💡 ผลลัพธ์ของบทนี้**: วินิจฉัยและแก้ไขปัญหาการปรับใช้ทั่วไปได้ด้วยตัวเอง

---

### 🏢 บทที่ 8: รูปแบบการผลิตและองค์กร
**ข้อกำหนดเบื้องต้น**: จบบทที่ 1-4  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- กลยุทธ์การปรับใช้สำหรับการผลิต
- รูปแบบความปลอดภัยสำหรับองค์กร
- การตรวจสอบและการปรับค่าใช้จ่าย
- **📝 ตัวอย่าง**: [Microservices Example](../../examples/microservices) - สถาปัตยกรรมที่ซับซ้อน
- **📊 การตรวจสอบ**: การผสานรวม Application Insights

#### แบบฝึกหัดเชิงปฏิบัติ
- ใช้รูปแบบความปลอดภัยระดับองค์กร
- ตั้งค่าการตรวจสอบที่ครอบคลุม
- ปรับใช้ในระบบผลิตด้วยการกำกับดูแลที่เหมาะสม

**💡 ผลลัพธ์ของบทนี้**: ปรับใช้แอปพลิเคชันที่พร้อมใช้งานในระดับองค์กรด้วยความสามารถเต็มรูปแบบสำหรับการผลิต

---

## 🎓 ภาพรวมของเวิร์กช็อป: ประสบการณ์การเรียนรู้แบบลงมือทำ

### วัสดุเวิร์กช็อปแบบโต้ตอบ
**การเรียนรู้แบบลงมือทำที่ครอบคลุมด้วยเครื่องมือบนเบราว์เซอร์และแบบฝึกหัดที่มีคำแนะนำ**

วัสดุเวิร์กช็อปของเรามอบประสบการณ์การเรียนรู้แบบมีโครงสร้างและโต้ตอบที่เสริมหลักสูตรตามบทที่กล่าวถึงข้างต้น เวิร์กช็อปนี้ออกแบบมาสำหรับการเรียนรู้ด้วยตนเองและการเรียนรู้ที่มีผู้สอนนำ

#### 🛠️ คุณสมบัติของเวิร์กช็อป
- **อินเทอร์เฟซบนเบราว์เซอร์**: เวิร์กช็อปที่ขับเคลื่อนด้วย MkDocs พร้อมฟีเจอร์ค้นหา คัดลอก และธีม
- **การผสานรวม GitHub Codespaces**: ตั้งค่าสภาพแวดล้อมการพัฒนาได้ด้วยคลิกเดียว
- **เส้นทางการเรียนรู้ที่มีโครงสร้าง**: แบบฝึกหัดที่มีคำแนะนำ 7 ขั้นตอน (รวม 3.5 ชั่วโมง)
- **การค้นพบ → การปรับใช้ → การปรับแต่ง**: วิธีการที่ก้าวหน้า
- **สภาพแวดล้อม DevContainer แบบโต้ตอบ**: เครื่องมือและการพึ่งพาที่กำหนดค่าไว้ล่วงหน้า

#### 📚 โครงสร้างของเวิร์กช็อป
เวิร์กช็อปนี้ใช้วิธีการ **การค้นพบ → การปรับใช้ → การปรับแต่ง**:

1. **ขั้นตอนการค้นพบ** (45 นาที)
   - สำรวจเทมเพลตและบริการของ Azure AI Foundry
   - ทำความเข้าใจรูปแบบสถาปัตยกรรมแบบหลายตัวแทน
   - ทบทวนข้อกำหนดและข้อกำหนดเบื้องต้นสำหรับการปรับใช้

2. **ขั้นตอนการปรับใช้** (2 ชั่วโมง)
   - การปรับใช้แอปพลิเคชัน AI แบบลงมือทำด้วย AZD
   - กำหนดค่าบริการและจุดสิ้นสุดของ Azure AI
   - ใช้รูปแบบความปลอดภัยและการตรวจสอบสิทธิ์

3. **ขั้นตอนการปรับแต่ง** (45 นาที)
   - ปรับแต่งแอปพลิเคชันสำหรับกรณีการใช้งานเฉพาะ
   - ปรับให้เหมาะสมสำหรับการปรับใช้ในระบบผลิต
   - ใช้การตรวจสอบและการจัดการต้นทุน

#### 🚀 เริ่มต้นกับเวิร์กช็อป
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 ผลลัพธ์การเรียนรู้ของเวิร์กช็อป
เมื่อเสร็จสิ้นเวิร์กช็อป ผู้เข้าร่วมจะสามารถ:
- **ปรับใช้แอปพลิเคชัน AI ในระบบผลิต**: ใช้ AZD กับบริการ Azure AI Foundry
- **เชี่ยวชาญสถาปัตยกรรมแบบหลายตัวแทน**: ใช้โซลูชันตัวแทน AI ที่ประสานงานกัน
- **ใช้แนวปฏิบัติด้านความปลอดภัยที่ดีที่สุด**: กำหนดค่าการตรวจสอบสิทธิ์และการควบคุมการเข้าถึง
- **ปรับให้เหมาะสมสำหรับการขยายขนาด**: ออกแบบการปรับใช้ที่มีประสิทธิภาพและคุ้มค่า
- **แก้ไขปัญหาการปรับใช้**: แก้ไขปัญหาทั่วไปได้อย่างอิสระ

#### 📖 ทรัพยากรของเวิร์กช็อป
- **🎥 คู่มือแบบโต้ตอบ**: [วัสดุเวิร์กช็อป](workshop/README.md) - สภาพแวดล้อมการเรียนรู้บนเบราว์เซอร์
- **📋 คำแนะนำทีละขั้นตอน**: [แบบฝึกหัดที่มีคำแนะนำ](../../workshop/docs/instructions) - การแนะนำอย่างละเอียด
- **🛠️ ห้องปฏิบัติการ AI Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - แบบฝึกหัดที่เน้น AI
- **💡 การเริ่มต้นอย่างรวดเร็ว**: [คู่มือการตั้งค่าเวิร์กช็อป](workshop/README.md#quick-start) - การกำหนดค่าสภาพแวดล้อม

**เหมาะสำหรับ**: การฝึกอบรมในองค์กร หลักสูตรมหาวิทยาลัย การเรียนรู้ด้วยตนเอง และค่ายฝึกอบรมนักพัฒนา

---

## 📖 Azure Developer CLI คืออะไร?

Azure Developer CLI (azd) เป็นอินเทอร์เฟซบรรทัดคำสั่งที่เน้นนักพัฒนา ซึ่งช่วยเร่งกระบวนการสร้างและปรับใช้แอปพลิเคชันไปยัง Azure โดยมีคุณสมบัติดังนี้:

- **การปรับใช้ตามเทมเพลต** - ใช้เทมเพลตที่สร้างไว้ล่วงหน้าสำหรับรูปแบบแอปพลิเคชันทั่วไป
- **โครงสร้างพื้นฐานเป็นโค้ด** - จัดการทรัพยากร Azure โดยใช้ Bicep หรือ Terraform  
- **เวิร์กโฟลว์ที่ผสานรวม** - จัดเตรียม ปรับใช้ และตรวจสอบแอปพลิเคชันได้อย่างราบรื่น
- **เป็นมิตรกับนักพัฒนา** - ปรับให้เหมาะสมสำหรับประสิทธิภาพและประสบการณ์ของนักพัฒนา

### **AZD + Azure AI Foundry: เหมาะสำหรับการปรับใช้ AI**

**ทำไมต้องใช้ AZD สำหรับโซลูชัน AI?** AZD ตอบโจทย์ความท้าทายหลักที่นักพัฒนา AI เผชิญ:

- **เทมเพลตที่พร้อมสำหรับ AI** - เทมเพลตที่กำหนดค่าไว้ล่วงหน้าสำหรับ Azure OpenAI, Cognitive Services และ ML workloads
- **การปรับใช้ AI ที่ปลอดภัย** - รูปแบบความปลอดภัยในตัวสำหรับบริการ AI คีย์ API และจุดสิ้นสุดของโมเดล  
- **รูปแบบ AI สำหรับระบบผลิต** - แนวปฏิบัติที่ดีที่สุดสำหรับการปรับใช้แอปพลิเคชัน AI ที่ปรับขนาดได้และคุ้มค่า
- **เวิร์กโฟลว์ AI แบบครบวงจร** - ตั้งแต่การพัฒนาโมเดลไปจนถึงการปรับใช้ในระบบผลิตพร้อมการตรวจสอบที่เหมาะสม
- **การเพิ่มประสิทธิภาพต้นทุน** - กลยุทธ์การจัดสรรทรัพยากรและการปรับขนาดที่ชาญฉลาดสำหรับ workloads AI
- **การผสานรวม Azure AI Foundry** - การเชื่อมต่อที่ราบรื่นกับแคตตาล็อกโมเดลและจุดสิ้นสุดของ AI Foundry

---

## 🎯 ไลบรารีเทมเพลตและตัวอย่าง

### แนะนำ: เทมเพลต Azure AI Foundry
**เริ่มต้นที่นี่หากคุณกำลังปรับใช้แอปพลิเคชัน AI!**

| เทมเพลต | บท | ความซับซ้อน | บริการ |
|----------|---------|------------|----------|
| [**เริ่มต้นกับ AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**เริ่มต้นกับ AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | บทที่ 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**การทำงานอัตโนมัติแบบหลายตัวแทน**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**สร้างเอกสารจากข้อมูลของคุณ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**ปรับปรุงการประชุมลูกค้าด้วยตัวแทน**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**ปรับปรุงโค้ดของคุณด้วยตัวแทน**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**สร้างตัวแทนสนทนาของคุณ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**ปลดล็อกข้อมูลเชิงลึกจากข้อมูลการสนทนา**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**การประมวลผลเนื้อหาแบบหลายรูปแบบ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### แนะนำ: สถานการณ์การเรียนรู้ที่สมบูรณ์
**เทมเพลตแอปพลิเคชันที่พร้อมใช้งานในระบบผลิตที่จับคู่กับบทเรียน**

| เทมเพลต | บทเรียน | ความซับซ้อน | การเรียนรู้สำคัญ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | รูปแบบการปรับใช้ AI พื้นฐาน |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | การใช้งาน RAG กับ Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | บทที่ 4 | ⭐⭐ | การผสานรวม Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | เฟรมเวิร์กตัวแทนและการเรียกฟังก์ชัน |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐ | การประสานงาน AI ระดับองค์กร |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | สถาปัตยกรรมแบบหลายตัวแทนกับตัวแทนลูกค้าและสินค้าคงคลัง |

### การเรียนรู้จากประเภทตัวอย่าง

#### แอปพลิเคชันง่ายๆ (บทที่ 1-2)
- [Simple Web App](../../examples/simple-web-app) - รูปแบบการปรับใช้พื้นฐาน
- [Static Website](../../examples/static-site) - การปรับใช้เนื้อหาแบบคงที่
- [Basic API](../../examples/basic-api) - การปรับใช้ REST API

#### การผสานรวมฐานข้อมูล (บทที่ 3-4)  
- [Database App](../../examples/database-app) - รูปแบบการเชื่อมต่อฐานข้อมูล
- [Data Processing](../../examples/data-processing) - การปรับใช้เวิร์กโฟลว์ ETL

#### รูปแบบขั้นสูง (บทที่ 4-8)
- [Container Apps](../../examples/container-app) - การปรับใช้แบบคอนเทนเนอร์
- [Microservices](../../examples/microservices) - สถาปัตยกรรมแบบหลายบริการ  
- [Enterprise Solutions](../../examples/enterprise) - รูปแบบที่พร้อมใช้งานในระบบผลิต

### คอลเลกชันเทมเพลตภายนอก
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - ตัวอย่างอย่างเป็นทางการของ Microsoft
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - เทมเพลตที่ชุมชนมีส่วนร่วม
- [**Examples Directory**](examples/README.md) - ตัวอย่างการเรียนรู้ในพื้นที่พร้อมคำอธิบายโดยละเอียด

---

## 📚 ทรัพยากรการเรียนรู้และการอ้างอิง

### การอ้างอิงด่วน
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - คำสั่ง azd ที่จำเป็นจัดเรียงตามบท
- [**Glossary**](resources/glossary.md) - คำศัพท์ Azure และ azd  
- [**FAQ**](resources/faq.md) - คำถามทั่วไปจัดเรียงตามบทเรียน
- [**Study Guide**](resources/study-guide.md) - แบบฝึกหัดการปฏิบัติที่ครอบคลุม

### เวิร์กช็อปแบบลงมือทำ
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - ทำให้โซลูชัน AI ของคุณสามารถปรับใช้ด้วย AZD (2-3 ชั่วโมง)
- [**Interactive Workshop Guide**](workshop/README.md) - เวิร์กช็อปบนเบราว์เซอร์ที่มี MkDocs และ DevContainer Environment
- [**Structured Learning Path**](../../workshop/docs/instructions) - แบบฝึกหัดที่มีคำแนะนำ 7 ขั้นตอน (การค้นพบ → การปรับใช้ → การปรับแต่ง)
- [**AZD For Beginners Workshop**](workshop/README.md) - วัสดุเวิร์กช็อปแบบลงมือทำที่สมบูรณ์พร้อมการผสานรวม GitHub Codespaces

### ทรัพยากรการเรียนรู้ภายนอก
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [เครื่องคำนวณราคาของ Azure](https://azure.microsoft.com/pricing/calculator/)
- [สถานะของ Azure](https://status.azure.com/)

---

## 🎓 การจบหลักสูตรและการรับรอง

### การติดตามความก้าวหน้า
ติดตามความก้าวหน้าในการเรียนรู้ของคุณในแต่ละบท:

- [ ] **บทที่ 1**: พื้นฐานและการเริ่มต้นอย่างรวดเร็ว ✅
- [ ] **บทที่ 2**: การพัฒนา AI เป็นอันดับแรก ✅  
- [ ] **บทที่ 3**: การกำหนดค่าและการตรวจสอบสิทธิ์ ✅
- [ ] **บทที่ 4**: โครงสร้างพื้นฐานเป็นโค้ดและการปรับใช้ ✅
- [ ] **บทที่ 5**: โซลูชัน AI แบบหลายตัวแทน ✅
- [ ] **บทที่ 6**: การตรวจสอบและการวางแผนก่อนการปรับใช้ ✅
- [ ] **บทที่ 7**: การแก้ไขปัญหาและการดีบัก ✅
- [ ] **บทที่ 8**: รูปแบบการผลิตและองค์กร ✅

### การตรวจสอบการเรียนรู้
หลังจากจบบทเรียนแต่ละบท ให้ตรวจสอบความรู้ของคุณโดย:
1. **แบบฝึกหัดเชิงปฏิบัติ**: ทำการปรับใช้ที่เกี่ยวข้องกับบทนั้น
2. **การตรวจสอบความรู้**: ทบทวนส่วน FAQ สำหรับบทของคุณ
3. **การอภิปรายในชุมชน**: แบ่งปันประสบการณ์ของคุณใน Discord ของ Azure
4. **บทถัดไป**: ย้ายไปยังระดับความซับซ้อนถัดไป

### ประโยชน์ของการจบหลักสูตร
เมื่อจบบทเรียนทั้งหมด คุณจะมี:
- **ประสบการณ์การผลิต**: ปรับใช้แอปพลิเคชัน AI จริงไปยัง Azure
- **ทักษะระดับมืออาชีพ**: ความสามารถในการปรับใช้ที่พร้อมใช้งานในระดับองค์กร  
- **การยอมรับในชุมชน**: สมาชิกที่กระตือรือร้นในชุมชนนักพัฒนา Azure
- **ความก้าวหน้าในอาชีพ**: ความเชี่ยวชาญที่เป็นที่ต้องการใน AZD และการปรับใช้ AI

---

## 🤝 ชุมชนและการสนับสนุน

### รับความช่วยเหลือและการสนับสนุน
- **ปัญหาทางเทคนิค**: [รายงานข้อบกพร่องและขอฟีเจอร์](https://github.com/microsoft/azd-for-beginners/issues)
- **คำถามเกี่ยวกับการเรียนรู้**: [ชุมชน Microsoft Azure Discord](https://discord.gg/microsoft-azure)
- **ความ
### แหล่งเรียนรู้ที่เกี่ยวข้องจาก Microsoft

ทีมของเรามีคอร์สเรียนที่ครอบคลุมหัวข้อต่าง ๆ ดังนี้:

- [Model Context Protocol (MCP) สำหรับผู้เริ่มต้น](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
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
- [เลือกการผจญภัย Copilot ของคุณเอง](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ การนำทางคอร์ส

**🚀 พร้อมเริ่มเรียนรู้หรือยัง?**

**ผู้เริ่มต้น**: เริ่มต้นที่ [บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว](../..)  
**นักพัฒนา AI**: ข้ามไปที่ [บทที่ 2: การพัฒนาแบบ AI-First](../..)  
**นักพัฒนาที่มีประสบการณ์**: เริ่มต้นที่ [บทที่ 3: การตั้งค่า & การตรวจสอบสิทธิ์](../..)

**ขั้นตอนถัดไป**: [เริ่มบทที่ 1 - พื้นฐาน AZD](docs/getting-started/azd-basics.md) →

---

