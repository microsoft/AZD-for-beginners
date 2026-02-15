# AZD สำหรับผู้เริ่มต้น: เส้นทางการเรียนรู้ที่เป็นระบบ

![AZD-for-beginners](../../translated_images/th/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### การแปลอัตโนมัติ (อัปเดตเสมอ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](./README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **อยากโคลนแบบภายในเครื่อง?**
>
> ที่เก็บนี้มีการแปลมากกว่า 50 ภาษา ซึ่งเพิ่มขนาดดาวน์โหลดอย่างมาก เพื่อโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> วิธีนี้จะให้ทุกอย่างที่คุณต้องการเพื่อทำหลักสูตรให้เสร็จด้วยการดาวน์โหลดที่เร็วกว่าอย่างมาก
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) คืออะไร?

**Azure Developer CLI (azd)** คือเครื่องมือบรรทัดคำสั่งที่ใช้งานง่ายสำหรับนักพัฒนา ทำให้การปรับใช้แอปพลิเคชันไปยัง Azure เป็นเรื่องง่าย แทนที่จะต้องสร้างและเชื่อมต่อทรัพยากร Azure หลายสิบรายการทีละอย่าง คุณสามารถปรับใช้แอปพลิเคชันทั้งหมดได้ด้วยคำสั่งเดียว

### เวทมนตร์ของคำสั่ง `azd up`

```bash
# คำสั่งเดียวนี้ทำทุกอย่าง:
# ✅ สร้างทรัพยากรทั้งหมดใน Azure
# ✅ กำหนดค่าการเชื่อมต่อเครือข่ายและการรักษาความปลอดภัย
# ✅ สร้างโค้ดแอปพลิเคชันของคุณ
# ✅ ปรับใช้ไปยัง Azure
# ✅ มอบ URL ที่ใช้งานได้ให้คุณ
azd up
```

**แค่นี้แหละ!** ไม่ต้องคลิกใน Azure Portal, ไม่ต้องเรียนรู้เทมเพลต ARM ที่ซับซ้อนก่อน, ไม่มีการตั้งค่าแบบแมนนวล — แค่แอปที่ใช้งานได้บน Azure

---

## ❓ Azure Developer CLI กับ Azure CLI ต่างกันอย่างไร?

นี่คือคำถามที่พบบ่อยที่สุดสำหรับผู้เริ่มต้น คำตอบง่าย ๆ คือ:

| ฟีเจอร์ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **วัตถุประสงค์** | จัดการทรัพยากร Azure ทีละตัว | ปรับใช้แอปพลิเคชันครบชุด |
| **ทัศนคติ** | เน้นโครงสร้างพื้นฐาน | เน้นแอปพลิเคชัน |
| **ตัวอย่าง** | `az webapp create --name myapp...` | `azd up` |
| **การเรียนรู้** | ต้องรู้บริการ Azure | เพียงแค่รู้จักแอปของคุณ |
| **เหมาะสำหรับ** | DevOps, โครงสร้างพื้นฐาน | นักพัฒนา, พัฒนาแบบต้นแบบ |

### อุปมาง่าย ๆ

- **Azure CLI** เหมือนกับมีเครื่องมือครบทุกอย่างสำหรับสร้างบ้าน — ค้อน, เลื่อย, ตะปู คุณสร้างได้ทุกอย่างแต่ต้องรู้เรื่องก่อสร้าง
- **Azure Developer CLI** เหมือนกับการว่าจ้างผู้รับเหมา — คุณบอกสิ่งที่ต้องการ แล้วเขาจัดการสร้างให้

### ใช้เมื่อใด

| สถานการณ์ | ใช้สิ่งนี้ |
|----------|----------|
| "ฉันต้องการปรับใช้เว็บแอปอย่างรวดเร็ว" | `azd up` |
| "ฉันต้องสร้างบัญชีเก็บข้อมูลแค่ตัวเดียว" | `az storage account create` |
| "ฉันกำลังสร้างแอป AI ครบวงจร" | `azd init --template azure-search-openai-demo` |
| "ฉันต้องการดีบักทรัพยากร Azure ตัวใดตัวหนึ่ง" | `az resource show` |
| "ฉันต้องการปรับใช้แบบพร้อมใช้งานในงานจริงภายในไม่กี่นาที" | `azd up --environment production` |

### พวกมันทำงานร่วมกัน!

AZD ใช้ Azure CLI เป็นพื้นฐาน คุณสามารถใช้ทั้งสองได้:
```bash
# ปรับใช้แอปของคุณด้วย AZD
azd up

# จากนั้นปรับแต่งทรัพยากรเฉพาะด้วย Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 หาเทมเพลตใน Awesome AZD

อย่าเริ่มต้นจากศูนย์! **Awesome AZD** คือคลังเทมเพลตที่ชุมชนสร้างสรรค์ และพร้อมสำหรับปรับใช้

| ทรัพยากร | คำอธิบาย |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | เลือกดูเทมเพลตกว่า 200+ และปรับใช้ได้ด้วยคลิกเดียว |
| 🔗 [**ส่งเทมเพลต**](https://github.com/Azure/awesome-azd/issues) | ร่วมแบ่งปันเทมเพลตของคุณแก่ชุมชน |
| 🔗 [**ที่เก็บ GitHub**](https://github.com/Azure/awesome-azd) | กดดาวและสำรวจซอร์สโค้ด |

### เทมเพลต AI ยอดนิยมจาก Awesome AZD

```bash
# แชท RAG ด้วย Azure OpenAI + AI Search
azd init --template azure-search-openai-demo

# แอปพลิเคชันแชท AI แบบรวดเร็ว
azd init --template openai-chat-app-quickstart

# ตัวแทน AI พร้อม Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 เริ่มต้นใน 3 ขั้นตอน

### ขั้นตอนที่ 1: ติดตั้ง AZD (2 นาที)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### ขั้นตอนที่ 2: เข้าสู่ระบบ Azure

```bash
azd auth login
```

### ขั้นตอนที่ 3: ปรับใช้แอปพลิเคชันแรกของคุณ

```bash
# เริ่มต้นจากเทมเพลต
azd init --template todo-nodejs-mongo

# ปรับใช้กับ Azure (สร้างทุกอย่าง!)
azd up
```

**🎉 เสร็จแล้ว!** แอปของคุณพร้อมใช้งานบน Azure แล้ว

### ทำความสะอาด (อย่าลืม!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 วิธีใช้หลักสูตรนี้

หลักสูตรนี้ออกแบบมาสำหรับ **การเรียนรู้แบบก้าวหน้า** — เริ่มต้นจากระดับที่คุณรู้สึกสบายและค่อยๆ เพิ่มระดับขึ้น:

| ประสบการณ์ของคุณ | เริ่มที่นี่ |
|-----------------|------------|
| **ยังใหม่กับ Azure** | [บทที่ 1: พื้นฐาน](../..) |
| **รู้จัก Azure แต่ใหม่กับ AZD** | [บทที่ 1: พื้นฐาน](../..) |
| **ต้องการปรับใช้แอป AI** | [บทที่ 2: พัฒนา AI ก่อน](../..) |
| **ต้องการฝึกปฏิบัติจริง** | [🎓 เวิร์กช็อปแบบโต้ตอบ](workshop/README.md) - ห้องปฏิบัติการแนะนำ 3-4 ชั่วโมง |
| **ต้องการรูปแบบสำหรับงานจริง** | [บทที่ 8: รูปแบบในงานผลิต & องค์กร](../..) |

### การตั้งค่าอย่างรวดเร็ว

1. **Fork ที่เก็บนี้**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **โคลนมา**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ขอความช่วยเหลือ**: [ชุมชน Discord ของ Azure](https://discord.com/invite/ByRwuEEgH4)

> **อยากโคลนแบบภายในเครื่อง?**

> ที่เก็บนี้มีการแปลมากกว่า 50 ภาษา ซึ่งเพิ่มขนาดดาวน์โหลดอย่างมาก เพื่อโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> วิธีนี้จะให้ทุกสิ่งที่คุณต้องการเพื่อทำหลักสูตรสำเร็จด้วยการดาวน์โหลดที่เร็วกว่าอย่างมาก


## ภาพรวมหลักสูตร

เรียนรู้ Azure Developer CLI (azd) ผ่านบทเรียนที่เป็นระบบ ออกแบบมาสำหรับการเรียนรู้ก้าวหน้า **เน้นพิเศษเรื่องปรับใช้แอป AI พร้อมการผสานรวม Microsoft Foundry**

### ทำไมหลักสูตรนี้จึงจำเป็นสำหรับนักพัฒนาสมัยใหม่

อ้างอิงจากข้อมูลชุมชน Microsoft Foundry Discord, **45% ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI** แต่พบปัญหากับ:
- สถาปัตยกรรม AI ที่ซับซ้อนหลายบริการ
- แนวทางปฏิบัติที่ดีที่สุดในการปรับใช้ AI ในงานจริง  
- การเชื่อมต่อและการตั้งค่าบริการ AI ของ Azure
- การปรับแต่งค่าใช้จ่ายสำหรับงาน AI
- การแก้ไขปัญหาเฉพาะที่เกิดขึ้นจากการปรับใช้ AI

### วัตถุประสงค์การเรียนรู้

เมื่อจบหลักสูตรนี้ คุณจะสามารถ:
- **ชำนาญพื้นฐาน AZD**: แนวคิดหลัก, การติดตั้ง และการตั้งค่า
- **ปรับใช้แอป AI**: ใช้ AZD กับบริการ Microsoft Foundry
- **ใช้ Infrastructure as Code**: จัดการทรัพยากร Azure ด้วยเทมเพลต Bicep
- **แก้ปัญหาการปรับใช้**: แก้ไขปัญหาที่พบบ่อยและทำดีบัก
- **ปรับแต่งสำหรับการใช้งานจริง**: ความปลอดภัย, การสเกล, การตรวจสอบ และการจัดการค่าใช้จ่าย
- **สร้างโซลูชัน Multi-Agent**: ปรับใช้สถาปัตยกรรม AI ที่ซับซ้อน

## 🗺️ แผนที่หลักสูตร: การนำทางด่วนตามบท

แต่ละบทมี README เฉพาะ พร้อมวัตถุประสงค์การเรียนรู้, การเริ่มต้นอย่างรวดเร็ว และแบบฝึกหัด:

| บท | หัวข้อ | บทเรียน | ระยะเวลา | ความซับซ้อน |
|---------|-------|---------|----------|------------|
| **[บทที่ 1: พื้นฐาน](docs/chapter-01-foundation/README.md)** | เริ่มต้น | [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [การติดตั้ง](docs/chapter-01-foundation/installation.md) &#124; [โปรเจกต์แรก](docs/chapter-01-foundation/first-project.md) | 30-45 นาที | ⭐ |
| **[บทที่ 2: พัฒนา AI](docs/chapter-02-ai-development/README.md)** | แอป AI-First | [การผสานรวม Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [การปรับใช้โมเดล](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [เวิร์กช็อป](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ชั่วโมง | ⭐⭐ |
| **[บทที่ 3: การตั้งค่า](docs/chapter-03-configuration/README.md)** | การยืนยันตัวตน & ความปลอดภัย | [การตั้งค่า](docs/chapter-03-configuration/configuration.md) &#124; [การยืนยันตัวตน & ความปลอดภัย](docs/chapter-03-configuration/authsecurity.md) | 45-60 นาที | ⭐⭐ |
| **[บทที่ 4: โครงสร้างพื้นฐาน](docs/chapter-04-infrastructure/README.md)** | IaC & การปรับใช้ | [คู่มือการปรับใช้](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [การจัดเตรียม](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ชม. | ⭐⭐⭐ |
| **[บทที่ 5: มัลติเอเจนต์](docs/chapter-05-multi-agent/README.md)** | โซลูชัน AI Agent | [สถานการณ์ค้าปลีก](examples/retail-scenario.md) &#124; [รูปแบบการประสานงาน](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ชม. | ⭐⭐⭐⭐ |
| **[บทที่ 6: ก่อนปรับใช้](docs/chapter-06-pre-deployment/README.md)** | การวางแผน & การตรวจสอบ | [การตรวจสอบก่อนบิน](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ชม. | ⭐⭐ |
| **[บทที่ 7: การแก้ไขปัญหา](docs/chapter-07-troubleshooting/README.md)** | ดีบัก & แก้ไข | [ปัญหาที่พบบ่อย](docs/chapter-07-troubleshooting/common-issues.md) &#124; [การดีบัก](docs/chapter-07-troubleshooting/debugging.md) &#124; [ปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ชม. | ⭐⭐ |
| **[บทที่ 8: การผลิต](docs/chapter-08-production/README.md)** | รูปแบบองค์กร | [แนวปฏิบัติการผลิต](docs/chapter-08-production/production-ai-practices.md) | 2-3 ชม. | ⭐⭐⭐⭐ |
| **[🎓 เวิร์กช็อป](workshop/README.md)** | ห้องปฏิบัติการฝึกปฏิบัติ | [แนะนำ](workshop/docs/instructions/0-Introduction.md) &#124; [การเลือก](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [การตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [การแยกส่วน](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [การกำหนดค่า](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [การปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [การรื้อถอน](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [สรุป](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ชม. | ⭐⭐ |

**ระยะเวลาทั้งหมดของหลักสูตร:** ~10-14 ชั่วโมง | **การพัฒนาทักษะ:** ผู้เริ่มต้น → พร้อมผลิต

---

## 📚 บทเรียนรู้

*เลือกเส้นทางการเรียนรู้ตามประสบการณ์และเป้าหมายของคุณ*

### 🚀 บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
**ข้อกำหนดเบื้องต้น**: มีบัญชี Azure, ความรู้พื้นฐานคำสั่งบรรทัด  
**ระยะเวลา**: 30-45 นาที  
**ระดับความซับซ้อน**: ⭐

#### สิ่งที่คุณจะได้เรียนรู้
- เข้าใจพื้นฐาน Azure Developer CLI
- การติดตั้ง AZD บนแพลตฟอร์มของคุณ
- การปรับใช้ครั้งแรกที่ประสบความสำเร็จ

#### แหล่งเรียนรู้
- **🎯 เริ่มที่นี่**: [Azure Developer CLI คืออะไร?](../..)
- **📖 ทฤษฎี**: [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) - แนวคิดหลักและคำศัพท์
- **⚙️ การติดตั้ง**: [การติดตั้ง & การตั้งค่า](docs/chapter-01-foundation/installation.md) - คู่มือสำหรับแต่ละแพลตฟอร์ม
- **🛠️ ฝึกปฏิบัติ**: [โปรเจกต์แรกของคุณ](docs/chapter-01-foundation/first-project.md) - บทเรียนทีละขั้นตอน
- **📋 อ้างอิงด่วน**: [แผ่นโกงคำสั่ง](resources/cheat-sheet.md)

#### แบบฝึกหัดปฏิบัติ
```bash
# ตรวจสอบการติดตั้งอย่างรวดเร็ว
azd version

# นำแอปพลิเคชันแรกของคุณไปใช้
azd init --template todo-nodejs-mongo
azd up
```

**💡 ผลลัพธ์บทเรียน**: ปรับใช้เว็บแอปพลิเคชันง่าย ๆ บน Azure ด้วย AZD ได้สำเร็จ

**✅ การตรวจสอบความสำเร็จ:**
```bash
# หลังจากทำบทที่ 1 เสร็จ คุณควรจะสามารถ:
azd version              # แสดงเวอร์ชันที่ติดตั้งแล้ว
azd init --template todo-nodejs-mongo  # เริ่มต้นโครงการ
azd up                  # ปล่อยขึ้น Azure
azd show                # แสดง URL ของแอปที่กำลังรัน
# แอปเปิดในเบราว์เซอร์และทำงานได้
azd down --force --purge  # ล้างทรัพยากร
```

**📊 เวลาในการเรียนรู้:** 30-45 นาที  
**📈 ระดับทักษะหลังจากเรียน:** สามารถปรับใช้แอปพื้นฐานได้อย่างอิสระ

**✅ การตรวจสอบความสำเร็จ:**
```bash
# หลังจากทำบทที่ 1 เสร็จแล้ว คุณควรจะสามารถ:
azd version              # แสดงเวอร์ชันที่ติดตั้ง
azd init --template todo-nodejs-mongo  # เริ่มต้นโปรเจกต์
azd up                  # นำส่งไปยัง Azure
azd show                # แสดง URL ของแอปที่กำลังทำงาน
# แอปพลิเคชันเปิดในเบราว์เซอร์และทำงานได้
azd down --force --purge  # ทำความสะอาดทรัพยากร
```

**📊 เวลาในการเรียนรู้:** 30-45 นาที  
**📈 ระดับทักษะหลังจากเรียน:** สามารถปรับใช้แอปพื้นฐานได้อย่างอิสระ

---

### 🤖 บทที่ 2: การพัฒนา AI-First (แนะนำสำหรับนักพัฒนา AI)
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1 แล้ว  
**ระยะเวลา**: 1-2 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การรวม Microsoft Foundry กับ AZD
- ปรับใช้แอปพลิเคชัน AI-powered
- เข้าใจการตั้งค่าบริการ AI

#### แหล่งเรียนรู้
- **🎯 เริ่มที่นี่**: [การรวม Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [คู่มือ AI Agents](docs/chapter-02-ai-development/agents.md) - ปรับใช้เอเจนต์อัจฉริยะด้วย AZD
- **📖 รูปแบบ**: [การปรับใช้โมเดล AI](docs/chapter-02-ai-development/ai-model-deployment.md) - ปรับใช้และจัดการโมเดล AI
- **🛠️ เวิร์กช็อป**: [ห้องปฏิบัติการฝึก AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำโซลูชัน AI ของคุณให้พร้อมกับ AZD
- **🎥 คู่มือเชิงโต้ตอบ**: [วัสดุเวิร์กช็อป](workshop/README.md) - เรียนรู้บนเบราว์เซอร์ด้วย MkDocs * สภาพแวดล้อม DevContainer
- **📋 เทมเพลต**: [เทมเพลต Microsoft Foundry](../..)
- **📝 ตัวอย่าง**: [ตัวอย่างการปรับใช้ AZD](examples/README.md)

#### แบบฝึกหัดปฏิบัติ
```bash
# เปิดใช้งานแอปพลิเคชัน AI แรกของคุณ
azd init --template azure-search-openai-demo
azd up

# ลองใช้แม่แบบ AI เพิ่มเติม
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 ผลลัพธ์บทเรียน**: ปรับใช้และตั้งค่าแอปแชท AI พร้อมฟังก์ชัน RAG

**✅ การตรวจสอบความสำเร็จ:**
```bash
# หลังจากบทที่ 2 คุณควรจะสามารถ:
azd init --template azure-search-openai-demo
azd up
# ทดสอบอินเทอร์เฟซแชท AI
# ถามคำถามและรับคำตอบที่ขับเคลื่อนด้วย AI พร้อมแหล่งที่มา
# ยืนยันการทำงานของการผสานรวมการค้นหา
azd monitor  # ตรวจสอบว่า Application Insights แสดงข้อมูลเทเลเมทรี
azd down --force --purge
```

**📊 เวลาในการเรียนรู้:** 1-2 ชั่วโมง  
**📈 ระดับทักษะหลังจากเรียน:** ปรับใช้และตั้งค่าแอป AI พร้อมใช้งานในผลิตได้  
**💰 ความเข้าใจค่าใช้จ่าย:** เข้าใจค่าใช้จ่ายพัฒนา $80-150/เดือน, ค่าใช้จ่ายผลิต $300-3500/เดือน

#### 💰 ข้อพิจารณาค่าใช้จ่ายสำหรับการปรับใช้ AI

**สภาพแวดล้อมการพัฒนา (ประมาณ $80-150/เดือน):**
- Azure OpenAI (จ่ายตามการใช้งาน): $0-50/เดือน (ขึ้นอยู่กับการใช้โทเค็น)
- AI Search (ระดับพื้นฐาน): $75/เดือน
- Container Apps (แบบการบริโภค): $0-20/เดือน
- ที่เก็บข้อมูล (มาตรฐาน): $1-5/เดือน

**สภาพแวดล้อมการผลิต (ประมาณ $300-3,500+/เดือน):**
- Azure OpenAI (PTU เพื่อประสิทธิภาพคงที่): $3,000+/เดือน หรือ จ่ายตามปริมาณสูง
- AI Search (ระดับมาตรฐาน): $250/เดือน
- Container Apps (แบบเฉพาะ): $50-100/เดือน
- Application Insights: $5-50/เดือน
- ที่เก็บข้อมูล (พรีเมียม): $10-50/เดือน

**💡 เคล็ดลับการเพิ่มประสิทธิภาพค่าใช้จ่าย:**
- ใช้ระดับ **Free Tier** ของ Azure OpenAI เพื่อเรียนรู้ (รวมโทเค็น 50,000 โทเค็น/เดือน)
- ใช้คำสั่ง `azd down` เพื่อลดทรัพยากรเมื่อไม่ใช้งาน
- เริ่มด้วยการเรียกเก็บเงินแบบการบริโภค ปรับเป็น PTU เฉพาะการผลิต
- ใช้ `azd provision --preview` เพื่อประมาณค่าใช้จ่ายก่อนปรับใช้
- เปิดใช้งาน auto-scaling: จ่ายเฉพาะการใช้งานจริง

**การตรวจสอบค่าใช้จ่าย:**
```bash
# ตรวจสอบค่าใช้จ่ายโดยประมาณรายเดือน
azd provision --preview

# ตรวจสอบค่าใช้จ่ายจริงในพอร์ทัล Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ บทที่ 3: การตั้งค่า & การยืนยันตัวตน
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1 แล้ว  
**ระยะเวลา**: 45-60 นาที  
**ระดับความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การตั้งค่าสภาพแวดล้อมและจัดการ
- การยืนยันตัวตนและแนวปฏิบัติด้านความปลอดภัย
- การตั้งชื่อทรัพยากรและการจัดระเบียบ

#### แหล่งเรียนรู้
- **📖 การตั้งค่า**: [คู่มือการตั้งค่า](docs/chapter-03-configuration/configuration.md) - การตั้งค่าสภาพแวดล้อม
- **🔐 ความปลอดภัย**: [รูปแบบการยืนยันตัวตนและ Managed Identity](docs/chapter-03-configuration/authsecurity.md) - รูปแบบการยืนยันตัวตน
- **📝 ตัวอย่าง**: [ตัวอย่างแอปฐานข้อมูล](examples/database-app/README.md) - ตัวอย่างการใช้ฐานข้อมูลกับ AZD

#### แบบฝึกหัดปฏิบัติ
- ตั้งค่าสภาพแวดล้อมหลายแห่ง (dev, staging, prod)
- ตั้งค่าการยืนยันตัวตนแบบ managed identity
- ดำเนินการตั้งค่าสภาพแวดล้อมเฉพาะ

**💡 ผลลัพธ์บทเรียน**: จัดการสภาพแวดล้อมหลายแห่งด้วยการยืนยันตัวตนและความปลอดภัยที่เหมาะสม

---

### 🏗️ บทที่ 4: โครงสร้างพื้นฐานในรูปแบบโค้ด & การปรับใช้
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1-3 แล้ว  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบการปรับใช้ขั้นสูง
- โครงสร้างพื้นฐานในรูปแบบโค้ดด้วย Bicep
- กลยุทธ์การจัดเตรียมทรัพยากร

#### แหล่งเรียนรู้
- **📖 การปรับใช้**: [คู่มือการปรับใช้](docs/chapter-04-infrastructure/deployment-guide.md) - กระบวนการทำงานครบวงจร
- **🏗️ การจัดเตรียม**: [การจัดเตรียมทรัพยากร](docs/chapter-04-infrastructure/provisioning.md) - การจัดการทรัพยากร Azure
- **📝 ตัวอย่าง**: [ตัวอย่าง Container App](../../examples/container-app) - การปรับใช้แบบคอนเทนเนอร์

#### แบบฝึกหัดปฏิบัติ
- สร้างเทมเพลต Bicep ที่กำหนดเอง
- ปรับใช้แอปพลิเคชันหลายบริการ
- ใช้กลยุทธ์การปรับใช้แบบ blue-green

**💡 ผลลัพธ์บทเรียน**: ปรับใช้แอปพลิเคชันหลายบริการซับซ้อนได้โดยใช้เทมเพลตโครงสร้างพื้นฐานที่กำหนดเอง

---

### 🎯 บทที่ 5: โซลูชัน AI มัลติเอเจนต์ (ขั้นสูง)
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1-2 แล้ว  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบสถาปัตยกรรมมัลติเอเจนต์
- การประสานและจัดการเอเจนต์
- การปรับใช้ AI ที่พร้อมสำหรับผลิต

#### แหล่งเรียนรู้
- **🤖 โปรเจกต์แนะนำ**: [โซลูชันมัลติเอเจนต์ค้าปลีก](examples/retail-scenario.md) - การดำเนินการครบถ้วน
- **🛠️ เทมเพลต ARM**: [ชุดเทมเพลต ARM มัลติเอเจนต์ค้าปลีก](../../examples/retail-multiagent-arm-template) - ปรับใช้ด้วยคลิกเดียว
- **📖 สถาปัตยกรรม**: [รูปแบบการประสานงานมัลติเอเจนต์](docs/chapter-06-pre-deployment/coordination-patterns.md) - รูปแบบ

#### แบบฝึกหัดปฏิบัติ
```bash
# ปรับใช้โซลูชันตัวแทนหลายรายค้าปลีกแบบสมบูรณ์
cd examples/retail-multiagent-arm-template
./deploy.sh

# สำรวจการตั้งค่าตัวแทน
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ผลลัพธ์บทเรียน**: ปรับใช้และจัดการโซลูชัน AI มัลติเอเจนต์พร้อมใช้งานในผลิตที่มีเอเจนต์ลูกค้าและสินค้าคงคลัง

---

### 🔍 บทที่ 6: การตรวจสอบ & วางแผนก่อนปรับใช้
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 4 แล้ว  
**ระยะเวลา**: 1 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การวางแผนความจุและตรวจสอบทรัพยากร
- กลยุทธ์การเลือก SKU
- การตรวจสอบก่อนบินและระบบอัตโนมัติ

#### แหล่งเรียนรู้
- **📊 การวางแผน**: [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) - การตรวจสอบทรัพยากร
- **💰 การเลือก**: [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) - ตัวเลือกที่คุ้มค่า
- **✅ การตรวจสอบ**: [การตรวจสอบก่อนบิน](docs/chapter-06-pre-deployment/preflight-checks.md) - สคริปต์อัตโนมัติ

#### แบบฝึกหัดปฏิบัติ
- รันสคริปต์ตรวจสอบความจุ
- ปรับเลือก SKU เพื่อประหยัดค่าใช้จ่าย
- ใช้การตรวจสอบอัตโนมัติก่อนปรับใช้

**💡 ผลลัพธ์บทเรียน**: ตรวจสอบและเพิ่มประสิทธิภาพการปรับใช้ก่อนดำเนินการจริง

---

### 🚨 บทที่ 7: การแก้ไขปัญหา & ดีบัก
**ข้อกำหนดเบื้องต้น**: ผ่านบทใดบทหนึ่งของการปรับใช้แล้ว  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- วิธีการดีบักอย่างเป็นระบบ
- ปัญหาทั่วไปและวิธีแก้ไข
- การแก้ปัญหาเฉพาะด้าน AI

#### แหล่งเรียนรู้
- **🔧 ปัญหาทั่วไป**: [ปัญหาทั่วไป](docs/chapter-07-troubleshooting/common-issues.md) - คำถามที่พบบ่อยและวิธีแก้ไข
- **🕵️ การดีบัก**: [คู่มือดีบัก](docs/chapter-07-troubleshooting/debugging.md) - กลยุทธ์ทีละขั้นตอน
- **🤖 ปัญหา AI**: [การแก้ปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - ปัญหาบริการ AI

#### แบบฝึกหัดปฏิบัติ
- วิเคราะห์ความล้มเหลวในการปรับใช้
- แก้ไขปัญหาการยืนยันตัวตน
- ดีบักการเชื่อมต่อบริการ AI

**💡 ผลลัพธ์บทเรียน**: วินิจฉัยและแก้ไขปัญหาการปรับใช้ทั่วไปได้อย่างอิสระ

---

### 🏢 บทที่ 8: การผลิต & รูปแบบองค์กร
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1-4 แล้ว  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- กลยุทธ์การปรับใช้ในสภาพแวดล้อมผลิต
- รูปแบบความปลอดภัยสำหรับองค์กร
- การเฝ้าระวังและเพิ่มประสิทธิภาพค่าใช้จ่าย

#### แหล่งเรียนรู้
- **🏭 การผลิต**: [แนวปฏิบัติ AI ในการผลิต](docs/chapter-08-production/production-ai-practices.md) - รูปแบบองค์กร
- **📝 ตัวอย่าง**: [ตัวอย่างไมโครเซอร์วิส](../../examples/microservices) - สถาปัตยกรรมซับซ้อน
- **📊 การเฝ้าระวัง**: [การผสาน Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - การเฝ้าระวัง

#### แบบฝึกหัดปฏิบัติ
- ใช้รูปแบบความปลอดภัยสำหรับองค์กร
- ตั้งค่าการเฝ้าระวังครบถ้วน
- ปรับใช้ในสภาพแวดล้อมผลิตด้วยการกำกับดูแลที่เหมาะสม

**💡 ผลลัพธ์บทเรียน**: ปรับใช้แอปพร้อมใช้งานสำหรับองค์กรด้วยความสามารถเต็มรูปแบบในสภาพแวดล้อมผลิต

---

## 🎓 ภาพรวมเวิร์กช็อป: ประสบการณ์เรียนรู้เชิงปฏิบัติ

> **⚠️ สถานะเวิร์กช็อป: กำลังพัฒนา**  

> วัสดุเวิร์กช็อปกำลังอยู่ในระหว่างการพัฒนาและปรับปรุง โมดูลหลักใช้งานได้จริง แต่บางส่วนของหัวข้อขั้นสูงยังไม่สมบูรณ์ เรากำลังทำงานอย่างต่อเนื่องเพื่อให้เนื้อหาทั้งหมดเสร็จสมบูรณ์ [ติดตามความคืบหน้า →](workshop/README.md)

### วัสดุเวิร์กช็อปแบบอินเทอร์แอคทีฟ
**การเรียนรู้แบบลงมือทำอย่างครบถ้วนด้วยเครื่องมือบนเบราว์เซอร์และแบบฝึกหัดที่ได้รับคำแนะนำ**

วัสดุเวิร์กช็อปของเราให้ประสบการณ์การเรียนรู้แบบมีโครงสร้างและแบบอินเทอร์แอคทีฟที่เสริมหลักสูตรตามบทที่กล่าวถึงข้างต้น เวิร์กช็อปถูกออกแบบมาสำหรับทั้งการเรียนรู้ด้วยตนเองและการเรียนรู้โดยมีผู้สอนนำทาง

#### 🛠️ คุณสมบัติของเวิร์กช็อป
- **อินเทอร์เฟซบนเบราว์เซอร์**: เวิร์กช็อปที่ขับเคลื่อนด้วย MkDocs พร้อมฟีเจอร์การค้นหา คัดลอก และธีม
- **การผสานรวมกับ GitHub Codespaces**: การตั้งค่าสภาพแวดล้อมการพัฒนาเพียงคลิกเดียว
- **เส้นทางการเรียนรู้ที่มีโครงสร้าง**: แบบฝึกหัดแนะนำ 8 โมดูล (รวม 3-4 ชั่วโมง)
- **วิธีการแบบก้าวหน้า**: แนะนำ → เลือก → ตรวจสอบ → วิเคราะห์โครงสร้าง → กำหนดค่า → ปรับแต่ง → รื้อถอน → สรุป
- **สภาพแวดล้อม DevContainer แบบอินเทอร์แอคทีฟ**: เครื่องมือและการพึ่งพาที่ตั้งค่าไว้ล่วงหน้า

#### 📚 โครงสร้างโมดูลเวิร์กช็อป
เวิร์กช็อปใช้วิธีการก้าวหน้า **8 โมดูล** ที่พาคุณจากการค้นพบจนชำนาญการใช้งาน:

| โมดูล | หัวข้อ | สิ่งที่คุณจะทำ | ระยะเวลา |
|--------|-------|----------------|----------|
| **0. แนะนำ** | ภาพรวมเวิร์กช็อป | เข้าใจวัตถุประสงค์การเรียนรู้ ข้อกำหนดเบื้องต้น และโครงสร้างเวิร์กช็อป | 15 นาที |
| **1. การเลือก** | ค้นหาเทมเพลต | สำรวจเทมเพลต AZD และเลือกเทมเพลต AI ที่เหมาะสมกับสถานการณ์ของคุณ | 20 นาที |
| **2. การตรวจสอบ** | การปรับใช้และยืนยัน | ปรับใช้เทมเพลตด้วย `azd up` และตรวจสอบการทำงานของโครงสร้างพื้นฐาน | 30 นาที |
| **3. การวิเคราะห์โครงสร้าง** | เข้าใจโครงสร้าง | ใช้ GitHub Copilot เพื่อสำรวจสถาปัตยกรรมเทมเพลต ไฟล์ Bicep และการจัดโค้ด | 30 นาที |
| **4. การกำหนดค่า** | เจาะลึก azure.yaml | ชำนาญการกำหนดค่า `azure.yaml` ฮุกวงจรชีวิต และตัวแปรสภาพแวดล้อม | 30 นาที |
| **5. การปรับแต่ง** | ทำให้เป็นของคุณ | เปิดใช้งาน AI Search, การติดตาม, การประเมินผล และปรับแต่งสำหรับสถานการณ์ของคุณ | 45 นาที |
| **6. การรื้อถอน** | ทำความสะอาด | ถอนทรัพยากรอย่างปลอดภัยด้วย `azd down --purge` | 15 นาที |
| **7. สรุป** | ก้าวต่อไป | ทบทวนความสำเร็จ แนวคิดสำคัญ และต่อยอดการเรียนรู้ของคุณ | 15 นาที |

**ลำดับการดำเนินงานเวิร์กช็อป:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 เริ่มต้นใช้งานเวิร์กช็อป
```bash
# ตัวเลือกที่ 1: GitHub Codespaces (แนะนำ)
# คลิก "Code" → "Create codespace on main" ในที่เก็บข้อมูล

# ตัวเลือกที่ 2: การพัฒนาแบบโลคัล
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ทำตามคำแนะนำการตั้งค่าใน workshop/README.md
```

#### 🎯 ผลลัพธ์การเรียนรู้ของเวิร์กช็อป
หลังจากทำเวิร์กช็อปเสร็จ ผู้เข้าร่วมจะสามารถ:
- **ปรับใช้แอปพลิเคชัน AI สำหรับการผลิต**: ใช้ AZD กับ Microsoft Foundry services
- **ชำนาญสถาปัตยกรรมมัลติเอเยนต์**: นำเสนอวิธีแก้ปัญหา AI agent ที่ประสานกัน
- **ใช้แนวปฏิบัติด้านความปลอดภัยที่ดีที่สุด**: กำหนดการตรวจสอบสิทธิ์และควบคุมการเข้าถึง
- **ปรับให้เหมาะสมสำหรับการขยายขนาด**: ออกแบบการปรับใช้ที่มีประสิทธิภาพและประหยัดค่าใช้จ่าย
- **แก้ไขปัญหาการปรับใช้**: แก้ไขปัญหาทั่วไปได้อย่างอิสระ

#### 📖 แหล่งข้อมูลเวิร์กช็อป
- **🎥 คู่มือแบบอินเทอร์แอคทีฟ**: [วัสดุเวิร์กช็อป](workshop/README.md) - สภาพแวดล้อมการเรียนรู้บนเบราว์เซอร์
- **📋 คำแนะนำตามโมดูล**:
  - [0. แนะนำ](workshop/docs/instructions/0-Introduction.md) - ภาพรวมเวิร์กช็อปและวัตถุประสงค์
  - [1. การเลือก](workshop/docs/instructions/1-Select-AI-Template.md) - ค้นหาและเลือกเทมเพลต AI
  - [2. การตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) - ปรับใช้และตรวจสอบเทมเพลต
  - [3. การวิเคราะห์โครงสร้าง](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - สำรวจสถาปัตยกรรมเทมเพลต
  - [4. การกำหนดค่า](workshop/docs/instructions/4-Configure-AI-Template.md) - ชำนาญ azure.yaml
  - [5. การปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) - ปรับแต่งสำหรับสถานการณ์คุณ
  - [6. การรื้อถอน](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ทำความสะอาดทรัพยากร
  - [7. สรุป](workshop/docs/instructions/7-Wrap-up.md) - ทบทวนและก้าวต่อไป
- **🛠️ ห้องปฏิบัติการ AI Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - แบบฝึกหัด AI เชิงปฏิบัติ
- **💡 เริ่มต้นอย่างรวดเร็ว**: [คู่มือการตั้งค่าเวิร์กช็อป](workshop/README.md#quick-start) - การกำหนดค่าสภาพแวดล้อม

**เหมาะสำหรับ**: การฝึกอบรมองค์กร, หลักสูตรมหาวิทยาลัย, การเรียนรู้ด้วยตนเอง, และบู๊ทแคมป์สำหรับนักพัฒนา

---

## 📖 เจาะลึก: ความสามารถของ AZD

นอกเหนือจากพื้นฐาน AZD ยังจัดเตรียมฟีเจอร์ทรงพลังสำหรับการปรับใช้ในสภาพแวดล้อมการผลิต:

- **การปรับใช้แบบใช้เทมเพลต** - ใช้เทมเพลตที่สร้างไว้ล่วงหน้าสำหรับรูปแบบแอปพลิเคชันทั่วไป
- **โครงสร้างพื้นฐานเป็นโค้ด** - จัดการทรัพยากร Azure ด้วย Bicep หรือ Terraform  
- **เวิร์กโฟลว์แบบบูรณาการ** - จัดเตรียม ปรับใช้ และตรวจสอบแอปพลิเคชันได้อย่างราบรื่น
- **เหมาะสำหรับนักพัฒนา** - ปรับแต่งเพื่อประสิทธิภาพและประสบการณ์ของนักพัฒนา

### **AZD + Microsoft Foundry: สมบูรณ์แบบสำหรับการปรับใช้ AI**

**ทำไมต้องใช้ AZD สำหรับโซลูชัน AI?** AZD แก้ไขปัญหาหลักที่นักพัฒนา AI เผชิญ:

- **เทมเพลตพร้อมใช้งานสำหรับ AI** - เทมเพลตที่ตั้งค่าไว้ล่วงหน้าสำหรับ Azure OpenAI, Cognitive Services และงาน ML
- **การปรับใช้ AI ที่ปลอดภัย** - รูปแบบความปลอดภัยในตัวสำหรับบริการ AI, คีย์ API และ endpoints ของโมเดล  
- **รูปแบบ AI สำหรับผลิต** - แนวปฏิบัติที่ดีที่สุดสำหรับการปรับใช้แอป AI ที่สามารถขยายและประหยัด
- **เวิร์กโฟลว์ AI แบบครบวงจร** - ตั้งแต่การพัฒนาโมเดลจนถึงการปรับใช้ในสภาพแวดล้อมจริงพร้อมการตรวจสอบที่ถูกต้อง
- **การเพิ่มประสิทธิภาพค่าใช้จ่าย** - การจัดสรรทรัพยากรและกลยุทธ์การปรับขนาดที่ชาญฉลาดสำหรับงาน AI
- **การผสานรวม Microsoft Foundry** - การเชื่อมต่ออย่างราบรื่นกับแคตตาล็อกโมเดลและ endpoints ของ Microsoft Foundry

---

## 🎯 เทมเพลต & ห้องสมุดตัวอย่าง

### เทมเพลตเด่น: Microsoft Foundry Templates
**เริ่มต้นที่นี่หากคุณกำลังปรับใช้แอป AI!**

> **หมายเหตุ:** เทมเพลตเหล่านี้แสดงรูปแบบ AI ต่างๆ บางส่วนเป็นตัวอย่าง Azure ภายนอก บางส่วนเป็นการดำเนินการในเครื่อง

| เทมเพลต | บท | ระดับความซับซ้อน | บริการ | ประเภท |
|----------|---------|------------|----------|------|
| [**เริ่มต้นใช้งานแชท AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ภายนอก |
| [**เริ่มต้นใช้งานกับเอเยนต์ AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | บทที่ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ภายนอก |
| [**สาธิต Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ภายนอก |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ภายนอก |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ภายนอก |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ภายนอก |
| [**โซลูชันมัลติเอเยนต์ค้าปลีก**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ในเครื่อง** |

### เทมเพลตเด่น: สถานการณ์การเรียนรู้ครบถ้วน
**เทมเพลตแอปสำหรับการผลิตที่จับคู่กับบทเรียน**

| เทมเพลต | บทเรียน | ระดับความซับซ้อน | การเรียนสำคัญ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | รูปแบบการปรับใช้ AI พื้นฐาน |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | การใช้งาน RAG กับ Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | บทที่ 4 | ⭐⭐ | การผสานรวม Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | เฟรมเวิร์ก Agent และการเรียกฟังก์ชัน |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐ | การประสาน AI สำหรับองค์กร |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | สถาปัตยกรรมมัลติเอเยนต์กับเอเยนต์ลูกค้าและสินค้าคงคลัง |

### เรียนรู้ผ่านประเภทตัวอย่าง

> **📌 ตัวอย่างในเครื่องเทียบกับภายนอก:**  
> **ตัวอย่างในเครื่อง** (ภายใน repo นี้) = พร้อมใช้งานทันที  
> **ตัวอย่างภายนอก** (Azure Samples) = โคลนจากที่เก็บที่เชื่อมโยง

#### ตัวอย่างในเครื่อง (พร้อมใช้)
- [**โซลูชันมัลติเอเยนต์ค้าปลีก**](examples/retail-scenario.md) - การดำเนินการครบถ้วนพร้อมใช้สำหรับการผลิตด้วย ARM templates
  - สถาปัตยกรรมมัลติเอเยนต์ (เอเยนต์ลูกค้า + เอเยนต์สินค้าคงคลัง)
  - การตรวจสอบและประเมินผลอย่างครบถ้วน
  - ปรับใช้เพียงคลิกเดียวผ่าน ARM template

#### ตัวอย่างในเครื่อง - แอปคอนเทนเนอร์ (บทที่ 2-5)
**ตัวอย่างการปรับใช้คอนเทนเนอร์ครบถ้วนใน repo นี้:**
- [**ตัวอย่างแอปคอนเทนเนอร์**](examples/container-app/README.md) - คู่มือเต็มรูปแบบสำหรับการปรับใช้ด้วยคอนเทนเนอร์
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - REST API พื้นฐานพร้อมการสเกลเป็นศูนย์
  - [สถาปัตยกรรมไมโครเซอร์วิส](../../examples/container-app/microservices) - การปรับใช้หลายบริการพร้อมสำหรับการผลิต
  - รูปแบบเริ่มต้นใช้งานจริง และขั้นสูง
  - แนวทางการตรวจสอบ ระบบความปลอดภัย และการเพิ่มประสิทธิภาพค่าใช้จ่าย

#### ตัวอย่างภายนอก - แอปพื้นฐาน (บทที่ 1-2)
**โคลนที่เก็บ Azure Samples เหล่านี้เพื่อเริ่มต้นใช้งาน:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - รูปแบบการปรับใช้พื้นฐาน
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - การปรับใช้เนื้อหาแบบคงที่
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - การปรับใช้ REST API

#### ตัวอย่างภายนอก - การผสานรวมฐานข้อมูล (บทที่ 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - รูปแบบการเชื่อมต่อฐานข้อมูล
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - เวิร์กโฟลว์ข้อมูลแบบไร้เซิร์ฟเวอร์

#### ตัวอย่างภายนอก - รูปแบบขั้นสูง (บทที่ 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - สถาปัตยกรรมหลายบริการ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - การประมวลผลแบ็กกราวด์  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - รูปแบบ ML สำหรับสภาพแวดล้อมการผลิต

### คอลเลกชันเทมเพลตภายนอก
- [**AZD Official Template Gallery**](https://azure.github.io/awesome-azd/) - คอลเลกชันเทมเพลตอย่างเป็นทางการและจากชุมชน
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - เอกสารเทมเพลต Microsoft Learn
- [**โฟลเดอร์ตัวอย่าง**](examples/README.md) - ตัวอย่างการเรียนรู้ในเครื่องพร้อมคำอธิบายละเอียด

---

## 📚 แหล่งข้อมูลเรียนรู้ & เอกสารอ้างอิง

### อ้างอิงด่วน
- [**คำสั่งสรุป**](resources/cheat-sheet.md) - คำสั่ง azd สำคัญ จัดเรียงตามบท
- [**พจนานุกรม**](resources/glossary.md) - คำศัพท์เกี่ยวกับ Azure และ azd  
- [**คำถามที่พบบ่อย**](resources/faq.md) - คำถามทั่วไปจัดตามบทเรียน
- [**คู่มือการศึกษา**](resources/study-guide.md) - แบบฝึกหัดครบถ้วนสำหรับฝึกฝน

### เวิร์กช็อปเชิงปฏิบัติ
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำให้โซลูชัน AI ของคุณสามารถปรับใช้ด้วย AZD (2-3 ชั่วโมง)
- [**เวิร์กช็อปแบบอินเทอร์แอคทีฟ**](workshop/README.md) - แบบฝึกหัด 8 โมดูลพร้อม MkDocs และ GitHub Codespaces
  - ลำดับ: แนะนำ → เลือก → ตรวจสอบ → วิเคราะห์โครงสร้าง → กำหนดค่า → ปรับแต่ง → รื้อถอน → สรุป

### แหล่งเรียนรู้อื่นๆ ภายนอก
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [เครื่องคิดเลขบริการ Azure](https://azure.microsoft.com/pricing/calculator/)
- [สถานะบริการ Azure](https://status.azure.com/)

---

## 🔧 คู่มือแก้ไขปัญหาอย่างรวดเร็ว

**ปัญหาทั่วไปที่ผู้เริ่มต้นพบและวิธีแก้ไขทันที:**

<details>
<summary><strong>❌ "azd: คำสั่งไม่พบ"</strong></summary>

```bash
# ติดตั้ง AZD ก่อน
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ตรวจสอบการติดตั้ง
azd version
```
</details>

<details>
<summary><strong>❌ "ไม่พบการสมัครใช้งาน" หรือ "ยังไม่ตั้งค่าการสมัครใช้งาน"</strong></summary>

```bash
# แสดงรายการการสมัครใช้งานที่พร้อมใช้งาน
az account list --output table

# ตั้งค่าการสมัครใช้งานเริ่มต้น
az account set --subscription "<subscription-id-or-name>"

# ตั้งค่าสำหรับสภาพแวดล้อม AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# ยืนยัน
az account show
```
</details>
<details>
<summary><strong>❌ "โควต้าไม่เพียงพอ" หรือ "เกินโควต้า"</strong></summary>

```bash
# ลองใช้ภูมิภาค Azure ที่ต่างกัน
azd env set AZURE_LOCATION "westus2"
azd up

# หรือใช้ SKU ขนาดเล็กกว่าในระหว่างการพัฒนา
# แก้ไขไฟล์ infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ล้มเหลวกึ่งกลางทาง</strong></summary>

```bash
# ตัวเลือก 1: ทำความสะอาดแล้วลองใหม่
azd down --force --purge
azd up

# ตัวเลือก 2: แก้ไขโครงสร้างพื้นฐานเท่านั้น
azd provision

# ตัวเลือก 3: ตรวจสอบสถานะอย่างละเอียด
azd show

# ตัวเลือก 4: ตรวจสอบบันทึกใน Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "การยืนยันตัวตนล้มเหลว" หรือ "โทเค็นหมดอายุ"</strong></summary>

```bash
# ยืนยันตัวตนอีกครั้ง
az logout
az login

azd auth logout
azd auth login

# ตรวจสอบการยืนยันตัวตน
az account show
```
</details>

<details>
<summary><strong>❌ "ทรัพยากรมีอยู่แล้ว" หรือปัญหาการตั้งชื่อชนกัน</strong></summary>

```bash
# AZD สร้างชื่อที่ไม่ซ้ำกัน แต่ถ้ามีความขัดแย้ง:
azd down --force --purge

# แล้วลองใหม่ด้วยสภาพแวดล้อมใหม่
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ การปรับใช้เทมเพลตใช้เวลานานเกินไป</strong></summary>

**เวลารอทั่วไป:**
- เว็บแอปง่าย ๆ: 5-10 นาที
- แอปที่มีฐานข้อมูล: 10-15 นาที
- แอป AI: 15-25 นาที (การจัดสรร OpenAI ช้า)

```bash
# ตรวจสอบความคืบหน้า
azd show

# หากติดขัดเกิน 30 นาที ให้ตรวจสอบ Azure Portal:
azd monitor
# มองหาการติดตั้งที่ล้มเหลว
```
</details>

<details>
<summary><strong>❌ "ไม่มีสิทธิ์" หรือ "ถูกปฏิเสธ"</strong></summary>

```bash
# ตรวจสอบบทบาท Azure ของคุณ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# คุณต้องมีบทบาท "ผู้ร่วมให้ข้อมูล" อย่างน้อย
# ขอให้ผู้ดูแลระบบ Azure ของคุณอนุญาต:
# - ผู้ร่วมให้ข้อมูล (สำหรับทรัพยากร)
# - ผู้ดูแลการเข้าถึงผู้ใช้ (สำหรับการมอบหมายบทบาท)
```
</details>

<details>
<summary><strong>❌ ไม่พบ URL แอปที่ปรับใช้</strong></summary>

```bash
# แสดงทุกจุดเชื่อมต่อของบริการ
azd show

# หรือเปิดพอร์ทัล Azure
azd monitor

# ตรวจสอบบริการเฉพาะ
azd env get-values
# มองหาตัวแปร *_URL
```
</details>

### 📚 แหล่งข้อมูลแก้ไขปัญหาแบบเต็ม

- **คู่มือปัญหาทั่วไป:** [วิธีแก้ไขรายละเอียด](docs/chapter-07-troubleshooting/common-issues.md)
- **ปัญหาเฉพาะ AI:** [การแก้ไขปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **คู่มือดีบัก:** [การดีบักทีละขั้นตอน](docs/chapter-07-troubleshooting/debugging.md)
- **ขอความช่วยเหลือ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 การจบหลักสูตร & การรับรอง

### การติดตามความก้าวหน้า
ติดตามความก้าวหน้าการเรียนรู้ของคุณในแต่ละบท:

- [ ] **บทที่ 1**: รากฐาน & เริ่มต้นอย่างรวดเร็ว ✅
- [ ] **บทที่ 2**: การพัฒนา AI-First ✅  
- [ ] **บทที่ 3**: การตั้งค่า & การยืนยันตัวตน ✅
- [ ] **บทที่ 4**: โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้ ✅
- [ ] **บทที่ 5**: โซลูชัน AI หลายตัวแทน ✅
- [ ] **บทที่ 6**: การตรวจสอบ & การวางแผนก่อนปรับใช้ ✅
- [ ] **บทที่ 7**: การแก้ไขปัญหา & การดีบัก ✅
- [ ] **บทที่ 8**: รูปแบบการผลิต & องค์กร ✅

### การตรวจสอบการเรียนรู้
หลังจบบทเรียนแต่ละบท ให้ตรวจสอบความรู้ของคุณโดย:
1. **แบบฝึกหัดเชิงปฏิบัติ**: ทำการปรับใช้จริงในบทเรียน
2. **ตรวจสอบความรู้**: ทบทวนส่วนคำถามที่พบบ่อยประจำบท
3. **การสนทนาในชุมชน**: แชร์ประสบการณ์ของคุณใน Azure Discord
4. **บทถัดไป**: ไปยังระดับความซับซ้อนถัดไป

### ประโยชน์จากการจบหลักสูตร
เมื่อจบครบทุกบท คุณจะได้:
- **ประสบการณ์การผลิต**: ปรับใช้แอป AI จริงใน Azure
- **ทักษะมืออาชีพ**: ความสามารถในการปรับใช้สำหรับองค์กร  
- **การรับรองจากชุมชน**: สมาชิกชุมชนนักพัฒนา Azure ที่มีบทบาท
- **ความก้าวหน้าในอาชีพ**: ความชำนาญในการปรับใช้ AZD และ AI ที่เป็นที่ต้องการ

---

## 🤝 ชุมชน & การสนับสนุน

### ขอความช่วยเหลือ & สนับสนุน
- **ปัญหาทางเทคนิค**: [รายงานบั๊กและขอฟีเจอร์](https://github.com/microsoft/azd-for-beginners/issues)
- **คำถามการเรียนรู้**: [ชุมชน Microsoft Azure Discord](https://discord.gg/microsoft-azure) และ [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ความช่วยเหลือเฉพาะ AI**: เข้าร่วม [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **เอกสาร**: [เอกสาร Azure Developer CLI อย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### ข้อมูลเชิงลึกจากชุมชน Microsoft Foundry Discord

**ผลสำรวจล่าสุดจากช่อง #Azure:**
- **45%** ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI
- **ความท้าทายสำคัญ:** การปรับใช้หลายบริการ, การจัดการข้อมูลรับรอง, ความพร้อมใช้งานในการผลิต  
- **คำขอมากที่สุด:** เทมเพลตเฉพาะ AI, คู่มือแก้ไขปัญหา, แนวทางปฏิบัติที่ดีที่สุด

**เข้าร่วมชุมชนของเราเพื่อ:**
- แบ่งปันประสบการณ์ AZD + AI และขอความช่วยเหลือ
- เข้าถึงรุ่นตัวอย่างเทมเพลต AI ใหม่ก่อนใคร
- ร่วมพัฒนาวิธีปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ AI
- มีส่วนร่วมในการพัฒนาฟีเจอร์ AI + AZD ในอนาคต

### การมีส่วนร่วมในหลักสูตร
เรายินดีรับการมีส่วนร่วม! โปรดอ่าน [คู่มือการมีส่วนร่วม](CONTRIBUTING.md) สำหรับรายละเอียดเกี่ยวกับ:
- **ปรับปรุงเนื้อหา:** ยกระดับบทเรียนและตัวอย่างที่มีอยู่
- **ตัวอย่างใหม่:** เพิ่มสถานการณ์และเทมเพลตจริงในโลก  
- **การแปล:** ช่วยรักษาการสนับสนุนหลายภาษา
- **รายงานบั๊ก:** ปรับปรุงความถูกต้องและความชัดเจน
- **มาตรฐานชุมชน:** ปฏิบัติตามแนวทางชุมชนที่ครอบคลุม

---

## 📄 ข้อมูลหลักสูตร

### ใบอนุญาต
โครงการนี้ได้รับอนุญาตภายใต้ MIT License - ดูไฟล์ [LICENSE](../../LICENSE) สำหรับรายละเอียด

### แหล่งการเรียนรู้ที่เกี่ยวข้องของ Microsoft

ทีมงานของเราผลิตหลักสูตรการเรียนรู้อื่นๆ ที่ครอบคลุม:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ การนำทางคอร์ส

**🚀 พร้อมเริ่มเรียนรู้แล้วหรือยัง?**

**ผู้เริ่มต้น**: เริ่มที่ [บทที่ 1: พื้นฐาน & การเริ่มต้นอย่างรวดเร็ว](../..)  
**นักพัฒนาด้าน AI**: ข้ามไปที่ [บทที่ 2: การพัฒนาแบบ AI-First](../..)  
**นักพัฒนาที่มีประสบการณ์**: เริ่มที่ [บทที่ 3: การกำหนดค่า & การพิสูจน์ตัวตน](../..)

**ขั้นตอนถัดไป**: [เริ่มบทที่ 1 - พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ความถูกต้องสูงสุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญแนะนำให้ใช้บริการแปลโดยมืออาชีพ เราไม่มีความรับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->