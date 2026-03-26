# AZD สำหรับผู้เริ่มต้น: การเดินทางเรียนรู้ที่มีโครงสร้าง

![AZD-for-beginners](../../translated_images/th/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### การแปลอัตโนมัติ (อัปเดตอยู่เสมอ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[อาหรับ](../ar/README.md) | [เบงกาลี](../bn/README.md) | [บัลแกเรีย](../bg/README.md) | [พม่า (เมียนมาร์)](../my/README.md) | [จีน (ตัวย่อ)](../zh-CN/README.md) | [จีน (ตัวเต็ม, ฮ่องกง)](../zh-HK/README.md) | [จีน (ตัวเต็ม, มาเก๊า)](../zh-MO/README.md) | [จีน (ตัวเต็ม, ไต้หวัน)](../zh-TW/README.md) | [โครเอเชีย](../hr/README.md) | [เช็ก](../cs/README.md) | [เดนมาร์ก](../da/README.md) | [ดัตช์](../nl/README.md) | [เอสโตเนีย](../et/README.md) | [ฟินแลนด์](../fi/README.md) | [ฝรั่งเศส](../fr/README.md) | [เยอรมัน](../de/README.md) | [กรีก](../el/README.md) | [ฮิบรู](../he/README.md) | [ฮินดี](../hi/README.md) | [ฮังการี](../hu/README.md) | [อินโดนีเซีย](../id/README.md) | [อิตาลี](../it/README.md) | [ญี่ปุ่น](../ja/README.md) | [กันนาดา](../kn/README.md) | [เกาหลี](../ko/README.md) | [ลิทัวเนีย](../lt/README.md) | [มาเลย์](../ms/README.md) | [มาลายาลัม](../ml/README.md) | [มาราฐี](../mr/README.md) | [เนปาล](../ne/README.md) | [ไนจีเรีย ปีดจิน](../pcm/README.md) | [นอร์เวย์](../no/README.md) | [เปอร์เซีย (ฟาร์ซี)](../fa/README.md) | [โปแลนด์](../pl/README.md) | [โปรตุเกส (บราซิล)](../pt-BR/README.md) | [โปรตุเกส (โปรตุเกส)](../pt-PT/README.md) | [ปัญจาบี (กุรมุขี)](../pa/README.md) | [โรมาเนีย](../ro/README.md) | [รัสเซีย](../ru/README.md) | [เซอร์เบีย (ซีริลลิก)](../sr/README.md) | [สโลวัก](../sk/README.md) | [สโลวีเนีย](../sl/README.md) | [สเปน](../es/README.md) | [สวาฮิลี](../sw/README.md) | [สวีเดน](../sv/README.md) | [ตากาล็อก (ฟิลิปปินส์)](../tl/README.md) | [ทมิฬ](../ta/README.md) | [เทลูกู](../te/README.md) | [ไทย](./README.md) | [ตุรกี](../tr/README.md) | [ยูเครน](../uk/README.md) | [อูรดู](../ur/README.md) | [เวียดนาม](../vi/README.md)

> **ต้องการโคลนในเครื่อง?**
>
> ที่เก็บนี้มีการแปลมากกว่า 50 ภาษา ซึ่งเพิ่มขนาดการดาวน์โหลดอย่างมาก เพื่อโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
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
> วิธีนี้จะให้ทุกอย่างที่คุณต้องการเพื่อทำหลักสูตรให้เสร็จอย่างรวดเร็วขึ้นมาก
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 อะไรใหม่ใน azd วันนี้

Azure Developer CLI เติบโตเกินกว่าแอปเว็บและ API แบบดั้งเดิมแล้ว วันนี้ azd คือเครื่องมือเดียวสำหรับการดีพลอย **ทุก** แอปพลิเคชันบน Azure รวมถึงแอปที่ขับเคลื่อนด้วย AI และตัวแทนอัจฉริยะ

นี่คือสิ่งที่หมายถึงสำหรับคุณ:

- **เอเย่นต์ AI เป็นงานหลักใน azd แล้ว** คุณสามารถเริ่มต้น ดีพลอย และจัดการโปรเจกต์เอเย่นต์ AI ด้วยเวิร์กโฟลว์ `azd init` → `azd up` ที่คุณรู้จัก
- **การผสาน Microsoft Foundry** นำการดีพลอยโมเดล การโฮสต์เอเย่นต์ และการตั้งค่า AI เข้าสู่ระบบนิเวศของเทมเพลต azd โดยตรง
- **เวิร์กโฟลว์หลักยังไม่เปลี่ยนแปลง** ไม่ว่าคุณจะดีพลอยแอป to-do, ไมโครเซอร์วิส หรือโซลูชัน AI หลายเอเย่นต์ คำสั่งก็เหมือนเดิม

ถ้าคุณเคยใช้ azd มาก่อน การรองรับ AI คือส่วนขยายตามธรรมชาติ ไม่ใช่เครื่องมือแยกหรือเส้นทางขั้นสูง ถ้าคุณเริ่มต้นใหม่ คุณจะเรียนรู้เวิร์กโฟลว์เดียวที่ใช้ได้กับทุกอย่าง

---

## 🚀 Azure Developer CLI (azd) คืออะไร?

**Azure Developer CLI (azd)** เป็นเครื่องมือบรรทัดคำสั่งที่เป็นมิตรกับนักพัฒนา ซึ่งช่วยให้การดีพลอยแอปพลิเคชันบน Azure เป็นเรื่องง่าย แทนที่จะต้องสร้างและเชื่อมต่อ Azure resources หลายชิ้นด้วยตนเอง คุณก็สามารถดีพลอยแอปทั้งหมดด้วยคำสั่งเดียว

### ความมหัศจรรย์ของ `azd up`

```bash
# คำสั่งเดียวนี้ทำทุกอย่าง:
# ✅ สร้างทรัพยากร Azure ทั้งหมด
# ✅ กำหนดค่าด้านเครือข่ายและความปลอดภัย
# ✅ สร้างโค้ดแอปพลิเคชันของคุณ
# ✅ ปรับใช้ไปยัง Azure
# ✅ ให้ URL ที่ใช้งานได้
azd up
```

**แค่นี้เอง!** ไม่มีการคลิกใน Azure Portal ซับซ้อน ไม่มีต้องเรียนรู้ ARM templates ที่ยุ่งยาก ไม่มีการตั้งค่าด้วยมือ — เพียงแค่แอปทำงานบน Azure

---

## ❓ Azure Developer CLI กับ Azure CLI: ความแตกต่างคืออะไร?

นี่คือคำถามที่พบบ่อยที่สุดสำหรับผู้เริ่มต้น คำตอบง่าย ๆ คือ:

| ฟีเจอร์ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **วัตถุประสงค์** | จัดการ Azure resources ทีละรายการ | ดีพลอยแอปพลิเคชันครบวงจร |
| **แนวคิด** | มุ่งเน้นโครงสร้างพื้นฐาน | มุ่งเน้นแอปพลิเคชัน |
| **ตัวอย่าง** | `az webapp create --name myapp...` | `azd up` |
| **ระดับการเรียนรู้** | ต้องรู้บริการ Azure | แค่รู้จักแอปของคุณ |
| **เหมาะสำหรับ** | DevOps, โครงสร้างพื้นฐาน | นักพัฒนา, สร้างต้นแบบ |

### อุปมาง่าย ๆ

- **Azure CLI** เหมือนมีเครื่องมือสร้างบ้านครบ - ค้อน, เลื่อย, ตะปู คุณสร้างอะไรได้ทั้งหมด แต่ต้องรู้การก่อสร้าง
- **Azure Developer CLI** เหมือนจ้างผู้รับเหมา - คุณบอกสิ่งที่ต้องการ แล้วเขาดูแลการก่อสร้าง

### ใช้เมื่อไหร่

| สถานการณ์ | ให้ใช้ |
|------------|---------|
| "อยากดีพลอยเว็บแอปของฉันอย่างรวดเร็ว" | `azd up` |
| "ต้องการสร้าง storage account เพียงอย่างเดียว" | `az storage account create` |
| "กำลังสร้างแอป AI แบบเต็มรูปแบบ" | `azd init --template azure-search-openai-demo` |
| "ต้องการดีบัก Azure resource เฉพาะ" | `az resource show` |
| "ต้องการดีพลอยสำหรับจริงจังในไม่กี่นาที" | `azd up --environment production` |

### พวกมันทำงานร่วมกัน!

AZD ใช้ Azure CLI เป็นฐาน คุณสามารถใช้ทั้งสองอย่างได้:
```bash
# ปรับใช้แอปของคุณด้วย AZD
azd up

# จากนั้นปรับแต่งทรัพยากรเฉพาะด้วย Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ค้นหาเทมเพลตใน Awesome AZD

อย่าเริ่มจากศูนย์! **Awesome AZD** คือคอลเลกชันชุมชนของเทมเพลตพร้อมดีพลอยทันที:

| ทรัพยากร | คำอธิบาย |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | เรียกดูเทมเพลตกว่า 200 รายการ พร้อมดีพลอยด้วยคลิกเดียว |
| 🔗 [**ส่งเทมเพลต**](https://github.com/Azure/awesome-azd/issues) | ร่วมส่งเทมเพลตของคุณสู่ชุมชน |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | ให้ดาวและสำรวจซอร์สโค้ด |

### เทมเพลต AI ยอดนิยมจาก Awesome AZD

```bash
# แชท RAG กับโมเดล Foundry ของ Microsoft + การค้นหา AI
azd init --template azure-search-openai-demo

# แอปพลิเคชันแชท AI แบบรวดเร็ว
azd init --template openai-chat-app-quickstart

# เอเจนต์ AI กับเอเจนต์ของ Foundry
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

### ขั้นตอนที่ 2: ลงชื่อเข้าใช้ Azure

```bash
azd auth login
```

### ขั้นตอนที่ 3: ดีพลอยแอปแรกของคุณ

```bash
# เริ่มต้นจากเทมเพลต
azd init --template todo-nodejs-mongo

# ปรับใช้ไปยัง Azure (สร้างทุกอย่าง!)
azd up
```

**🎉 เสร็จเรียบร้อย!** แอปของคุณพร้อมใช้งานบน Azure แล้ว

### ทำความสะอาด (อย่าลืม!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 วิธีใช้หลักสูตรนี้

หลักสูตรนี้ออกแบบมาเพื่อ **การเรียนรู้อย่างเป็นขั้นตอน** - เริ่มต้นจากจุดที่คุณสบายใจแล้วค่อยไต่ระดับขึ้นไป:

| ประสบการณ์ของคุณ | เริ่มที่นี่ |
|-------------------|------------|
| **ใหม่กับ Azure** | [บทที่ 1: พื้นฐาน](../..) |
| **รู้จัก Azure แต่ใหม่กับ AZD** | [บทที่ 1: พื้นฐาน](../..) |
| **ต้องการดีพลอยแอป AI** | [บทที่ 2: การพัฒนา AI เป็นอันดับแรก](../..) |
| **ต้องการฝึกปฏิบัติจริง** | [🎓 เวิร์กช็อปเชิงโต้ตอบ](workshop/README.md) - ห้องปฏิบัติการแนะนำ 3-4 ชั่วโมง |
| **ต้องการแพตเทิร์นการใช้งานจริง** | [บทที่ 8: การผลิต & องค์กร](../..) |

### การตั้งค่าอย่างรวดเร็ว

1. **ทำ Fork ที่เก็บนี้**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **โคลนมา**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ขอความช่วยเหลือ**: [ชุมชน Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **ต้องการโคลนในเครื่อง?**

> ที่เก็บนี้มีการแปลมากกว่า 50 ภาษา ซึ่งเพิ่มขนาดการดาวน์โหลดอย่างมาก เพื่อโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> วิธีนี้จะให้ทุกอย่างที่คุณต้องการเพื่อทำหลักสูตรให้เสร็จอย่างรวดเร็วขึ้นมาก


## ภาพรวมหลักสูตร

เชี่ยวชาญ Azure Developer CLI (azd) ผ่านบทเรียนที่มีโครงสร้างและออกแบบเพื่อการเรียนรู้อย่างต่อเนื่อง **เน้นพิเศษที่การดีพลอยแอป AI ด้วยการผสาน Microsoft Foundry**

### ทำไมหลักสูตรนี้สำคัญสำหรับนักพัฒนายุคใหม่

จากข้อมูลชุมชน Microsoft Foundry Discord, **45% ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI** แต่พบปัญหาเกี่ยวกับ:
- สถาปัตยกรรม AI หลายบริการที่ซับซ้อน
- แนวปฏิบัติที่ดีที่สุดสำหรับการดีพลอย AI ในการผลิต
- การผสานและการตั้งค่าบริการ AI ของ Azure
- การเพิ่มประสิทธิภาพต้นทุนสำหรับงาน AI
- การแก้ปัญหาการดีพลอยเฉพาะ AI

### วัตถุประสงค์การเรียนรู้

หลังจากทำหลักสูตรนี้เสร็จแล้ว คุณจะสามารถ:
- **ชำนาญพื้นฐาน AZD**: แนวคิดหลัก การติดตั้ง และการตั้งค่า
- **ดีพลอยแอป AI**: ใช้ AZD กับบริการ Microsoft Foundry
- **ปรับใช้ Infrastructure as Code**: จัดการ Azure resources ด้วย Bicep templates
- **แก้ปัญหาการดีพลอย**: แก้ไขปัญหาทั่วไปและดีบัก
- **เพิ่มประสิทธิภาพสำหรับการผลิต**: ความปลอดภัย การปรับขนาด การตรวจสอบ และการจัดการต้นทุน
- **สร้างโซลูชันหลายเอเย่นต์**: ดีพลอยสถาปัตยกรรม AI ที่ซับซ้อน

## 🗺️ แผนที่หลักสูตร: การนำทางด่วนตามบท

แต่ละบทมี README แยกต่างหาก พร้อมวัตถุประสงค์การเรียนรู้ เริ่มต้นเร็ว และแบบฝึกหัด:

| บท | หัวข้อ | บทเรียน | ระยะเวลา | ความซับซ้อน |
|---------|-------|---------|----------|------------|
| **[บทที่ 1: พื้นฐาน](docs/chapter-01-foundation/README.md)** | เริ่มต้น | [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [การติดตั้ง](docs/chapter-01-foundation/installation.md) &#124; [โปรเจกต์แรก](docs/chapter-01-foundation/first-project.md) | 30-45 นาที | ⭐ |
| **[บทที่ 2: การพัฒนา AI](docs/chapter-02-ai-development/README.md)** | แอป AI-First | [การรวม Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [เอเจนต์ AI](docs/chapter-02-ai-development/agents.md) &#124; [การปรับใช้โมเดล](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [เวิร์กช็อป](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ชั่วโมง | ⭐⭐ |
| **[บทที่ 3: การกำหนดค่า](docs/chapter-03-configuration/README.md)** | การยืนยันตัวตน & ความปลอดภัย | [การกำหนดค่า](docs/chapter-03-configuration/configuration.md) &#124; [การยืนยันตัวตน & ความปลอดภัย](docs/chapter-03-configuration/authsecurity.md) | 45-60 นาที | ⭐⭐ |
| **[บทที่ 4: โครงสร้างพื้นฐาน](docs/chapter-04-infrastructure/README.md)** | IaC & การปรับใช้ | [คู่มือการปรับใช้](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [การจัดเตรียม](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ชั่วโมง | ⭐⭐⭐ |
| **[บทที่ 5: เอเจนต์หลายตัว](docs/chapter-05-multi-agent/README.md)** | โซลูชันเอเจนต์ AI | [สถานการณ์ค้าปลีก](examples/retail-scenario.md) &#124; [รูปแบบการประสานงาน](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ชั่วโมง | ⭐⭐⭐⭐ |
| **[บทที่ 6: ก่อนปรับใช้](docs/chapter-06-pre-deployment/README.md)** | การวางแผน & การตรวจสอบ | [การตรวจสอบก่อนบิน](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ข้อมูลเชิงลึกแอป](docs/chapter-06-pre-deployment/application-insights.md) | 1 ชั่วโมง | ⭐⭐ |
| **[บทที่ 7: การแก้ไขปัญหา](docs/chapter-07-troubleshooting/README.md)** | การดีบั๊ก & แก้ไข | [ปัญหาทั่วไป](docs/chapter-07-troubleshooting/common-issues.md) &#124; [การดีบั๊ก](docs/chapter-07-troubleshooting/debugging.md) &#124; [ปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ชั่วโมง | ⭐⭐ |
| **[บทที่ 8: การผลิต](docs/chapter-08-production/README.md)** | รูปแบบองค์กร | [แนวทางปฏิบัติในการผลิต](docs/chapter-08-production/production-ai-practices.md) | 2-3 ชั่วโมง | ⭐⭐⭐⭐ |
| **[🎓 เวิร์กช็อป](workshop/README.md)** | ห้องปฏิบัติการเชิงปฏิบัติ | [บทนำ](workshop/docs/instructions/0-Introduction.md) &#124; [การเลือก](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [การตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [การวิเคราะห์](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [การกำหนดค่า](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [การปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [การรื้อถอน](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [สรุป](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ชั่วโมง | ⭐⭐ |

**ระยะเวลารวมของหลักสูตร:** ~10-14 ชั่วโมง | **ความก้าวหน้าทักษะ:** ผู้เริ่มต้น → พร้อมใช้งานผลิตภัณฑ์

---

## 📚 บทเรียน

*เลือกเส้นทางการเรียนรู้ของคุณตามประสบการณ์และเป้าหมาย*

### 🚀 บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
**ข้อกำหนดเบื้องต้น**: การสมัครใช้งาน Azure, ความรู้พื้นฐานคำสั่งบรรทัดคำสั่ง  
**ระยะเวลา**: 30-45 นาที  
**ความซับซ้อน**: ⭐

#### สิ่งที่คุณจะได้เรียนรู้
- ความเข้าใจพื้นฐานของ Azure Developer CLI
- การติดตั้ง AZD บนแพลตฟอร์มของคุณ
- การปรับใช้ครั้งแรกที่ประสบความสำเร็จ

#### แหล่งเรียนรู้
- **🎯 เริ่มต้นที่นี่**: [Azure Developer CLI คืออะไร?](../..)
- **📖 ทฤษฎี**: [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) - แนวคิดหลักและคำศัพท์
- **⚙️ การตั้งค่า**: [การติดตั้ง & การตั้งค่า](docs/chapter-01-foundation/installation.md) - คู่มือเฉพาะแพลตฟอร์ม
- **🛠️ ปฏิบัติ**: [โปรเจ็กต์แรกของคุณ](docs/chapter-01-foundation/first-project.md) - คู่มือทีละขั้นตอน
- **📋 อ้างอิงด่วน**: [ชีทคำสั่ง](resources/cheat-sheet.md)

#### แบบฝึกหัดปฏิบัติ
```bash
# ตรวจสอบการติดตั้งอย่างรวดเร็ว
azd version

# นำส่งแอปพลิเคชันแรกของคุณ
azd init --template todo-nodejs-mongo
azd up
```

**💡 ผลลัพธ์ของบทเรียน**: ปรับใช้เว็บแอปพลิเคชันง่ายๆ ไปยัง Azure โดยใช้ AZD สำเร็จ

**✅ การตรวจสอบความสำเร็จ:**
```bash
# หลังจากเสร็จสิ้นบทที่ 1 คุณควรจะสามารถ:
azd version              # แสดงเวอร์ชันที่ติดตั้ง
azd init --template todo-nodejs-mongo  # เริ่มต้นโครงการ
azd up                  # นำไปใช้งานบน Azure
azd show                # แสดง URL ของแอปที่กำลังรัน
# แอปพลิเคชันเปิดในเบราว์เซอร์และทำงานได้
azd down --force --purge  # ล้างทรัพยากร
```

**📊 เวลาที่ใช้:** 30-45 นาที  
**📈 ระดับทักษะหลังเรียน:** สามารถปรับใช้แอปพื้นฐานได้อย่างอิสระ

---

### 🤖 บทที่ 2: การพัฒนา AI-First (แนะนำสำหรับนักพัฒนา AI)
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1  
**ระยะเวลา**: 1-2 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การรวม Microsoft Foundry กับ AZD
- การปรับใช้แอปพลิเคชันใช้พลัง AI
- ความเข้าใจการกำหนดค่าบริการ AI

#### แหล่งเรียนรู้
- **🎯 เริ่มต้นที่นี่**: [การรวม Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 เอเจนต์ AI**: [คู่มือเอเจนต์ AI](docs/chapter-02-ai-development/agents.md) - การปรับใช้งานเอเจนต์อัจฉริยะด้วย AZD
- **📖 รูปแบบ**: [การปรับใช้โมเดล AI](docs/chapter-02-ai-development/ai-model-deployment.md) - การปรับใช้และจัดการโมเดล AI
- **🛠️ เวิร์กช็อป**: [ห้องปฏิบัติการ AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำให้โซลูชัน AI พร้อมใช้งานกับ AZD
- **🎥 คู่มือเชิงโต้ตอบ**: [วัสดุเวิร์กช็อป](workshop/README.md) - เรียนรู้ผ่านเบราว์เซอร์กับ MkDocs * สภาพแวดล้อม DevContainer
- **📋 แบบฟอร์ม**: [แม่แบบ Microsoft Foundry](../..)
- **📝 ตัวอย่าง**: [ตัวอย่างการปรับใช้ AZD](examples/README.md)

#### แบบฝึกหัดปฏิบัติ
```bash
# เปิดใช้แอปพลิเคชัน AI แรกของคุณ
azd init --template azure-search-openai-demo
azd up

# ลองใช้แม่แบบ AI เพิ่มเติม
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 ผลลัพธ์ของบทเรียน**: ปรับใช้และกำหนดค่าแอปแชท AI พร้อมความสามารถ RAG

**✅ การตรวจสอบความสำเร็จ:**
```bash
# หลังจากบทที่ 2 คุณควรจะสามารถ:
azd init --template azure-search-openai-demo
azd up
# ทดสอบอินเตอร์เฟสแชท AI
# ถามคำถามและรับคำตอบที่ขับเคลื่อนด้วย AI พร้อมแหล่งที่มา
# ตรวจสอบการทำงานของการผสานรวมการค้นหา
azd monitor  # ตรวจสอบว่า Application Insights แสดงข้อมูลเทเลเมทรี
azd down --force --purge
```

**📊 เวลาที่ใช้:** 1-2 ชั่วโมง  
**📈 ระดับทักษะหลังเรียน:** สามารถปรับใช้และกำหนดค่าแอป AI พร้อมใช้งานในผลิตภัณฑ์ได้  
**💰 ความเข้าใจต้นทุน:** เข้าใจค่าใช้จ่ายพัฒนา $80-150/เดือน, ค่าใช้จ่ายผลิต $300-3500/เดือน

#### 💰 ข้อควรพิจารณาต้นทุนสำหรับการปรับใช้ AI

**สภาพแวดล้อมพัฒนา (ประมาณ $80-150/เดือน):**
- โมเดล Microsoft Foundry (จ่ายตามการใช้งาน): $0-50/เดือน (ตามการใช้โทเค็น)
- AI Search (ระดับพื้นฐาน): $75/เดือน
- Container Apps (แบบการบริโภค): $0-20/เดือน
- Storage (มาตรฐาน): $1-5/เดือน

**สภาพแวดล้อมผลิต (ประมาณ $300-3,500+/เดือน):**
- โมเดล Microsoft Foundry (PTU สำหรับประสิทธิภาพคงที่): $3,000+/เดือน หรือ จ่ายตามการใช้งานปริมาณสูง
- AI Search (ระดับมาตรฐาน): $250/เดือน
- Container Apps (แบบเฉพาะ): $50-100/เดือน
- Application Insights: $5-50/เดือน
- Storage (ระดับพรีเมียม): $10-50/เดือน

**💡 เคล็ดลับการประหยัดต้นทุน:**
- ใช้ **ระดับฟรี** ของโมเดล Microsoft Foundry สำหรับการเรียนรู้ (Azure OpenAI รวม 50,000 โทเค็น/เดือน)
- ใช้คำสั่ง `azd down` เพื่อลดการใช้ทรัพยากรเมื่อไม่พัฒนาอย่างจริงจัง
- เริ่มต้นด้วยบิลลิ่งแบบจ่ายตามการใช้งาน และอัปเกรดเป็น PTU เฉพาะตอนผลิต
- ใช้ `azd provision --preview` เพื่อประเมินค่าใช้จ่ายก่อนปรับใช้
- เปิดใช้งานการปรับขนาดอัตโนมัติ: จ่ายเฉพาะการใช้งานจริง

**การติดตามต้นทุน:**
```bash
# ตรวจสอบค่าใช้จ่ายรายเดือนโดยประมาณ
azd provision --preview

# ตรวจสอบค่าใช้จ่ายจริงในพอร์ทัล Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ บทที่ 3: การกำหนดค่า & การยืนยันตัวตน
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1  
**ระยะเวลา**: 45-60 นาที  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การตั้งค่าและจัดการสภาพแวดล้อม
- วิธีปฏิบัติที่ดีที่สุดด้านการยืนยันตัวตนและความปลอดภัย
- การตั้งชื่อและการจัดระเบยทรัพยากร

#### แหล่งเรียนรู้
- **📖 การกำหนดค่า**: [คู่มือการกำหนดค่า](docs/chapter-03-configuration/configuration.md) - การตั้งค่าสภาพแวดล้อม
- **🔐 ความปลอดภัย**: [รูปแบบการยืนยันตัวตนและ Managed Identity](docs/chapter-03-configuration/authsecurity.md)
- **📝 ตัวอย่าง**: [ตัวอย่างแอปฐานข้อมูล](examples/database-app/README.md) - ตัวอย่างฐานข้อมูล AZD

#### แบบฝึกหัดปฏิบัติ
- ตั้งค่าสภาพแวดล้อมหลายสภาพแวดล้อม (dev, staging, prod)
- ตั้งค่าการยืนยันตัวตนด้วย managed identity
- นำการกำหนดค่าสภาพแวดล้อมเฉพาะมาใช้

**💡 ผลลัพธ์ของบทเรียน**: จัดการสภาพแวดล้อมหลายสภาพแวดล้อมได้อย่างเหมาะสม พร้อมระบบยืนยันตัวตนและความปลอดภัย

---

### 🏗️ บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1-3  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบการปรับใช้ขั้นสูง
- โครงสร้างพื้นฐานเป็นโค้ดด้วย Bicep
- กลยุทธ์การจัดเตรียมทรัพยากร

#### แหล่งเรียนรู้
- **📖 การปรับใช้**: [คู่มือการปรับใช้](docs/chapter-04-infrastructure/deployment-guide.md) - กระบวนการทำงานครบถ้วน
- **🏗️ การจัดเตรียม**: [การจัดเตรียมทรัพยากร](docs/chapter-04-infrastructure/provisioning.md) - การจัดการทรัพยากร Azure
- **📝 ตัวอย่าง**: [ตัวอย่าง Container App](../../examples/container-app) - การปรับใช้แบบคอนเทนเนอร์

#### แบบฝึกหัดปฏิบัติ
- สร้างแม่แบบ Bicep ที่กำหนดเอง
- ปรับใช้แอปพลิเคชันหลายบริการ
- นำกลยุทธ์การปรับใช้แบบ blue-green มาใช้

**💡 ผลลัพธ์ของบทเรียน**: ปรับใช้แอปพลิเคชันหลายบริการที่ซับซ้อนได้โดยใช้แม่แบบโครงสร้างพื้นฐานแบบกำหนดเอง

---

### 🎯 บทที่ 5: โซลูชันเอเจนต์ AI หลายตัว (ขั้นสูง)
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1-2  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบสถาปัตยกรรมเอเจนต์หลายตัว
- การประสานงานและจัดระบบเอเจนต์
- การปรับใช้ AI พร้อมผลิตภัณฑ์

#### แหล่งเรียนรู้
- **🤖 โปรเจ็กต์เด่น**: [โซลูชันเอเจนต์หลายตัวสำหรับค้าปลีก](examples/retail-scenario.md) - การดำเนินการครบถ้วน
- **🛠️ แม่แบบ ARM**: [ชุดแม่แบบ ARM แบบคลิกเดียว](../../examples/retail-multiagent-arm-template) - การปรับใช้ด้วยคลิกเดียว
- **📖 สถาปัตยกรรม**: [รูปแบบการประสานงานเอเจนต์หลายตัว](docs/chapter-06-pre-deployment/coordination-patterns.md)

#### แบบฝึกหัดปฏิบัติ
```bash
# เปิดใช้งานโซลูชันหลายตัวแทนค้าปลีกครบชุด
cd examples/retail-multiagent-arm-template
./deploy.sh

# สำรวจการตั้งค่าตัวแทน
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ผลลัพธ์ของบทเรียน**: ปรับใช้และจัดการโซลูชัน AI หลายเอเจนต์พร้อมใช้งานในผลิตภัณฑ์ ที่มีเอเจนต์ลูกค้าและสินค้าคงคลัง

---

### 🔍 บทที่ 6: การตรวจสอบ & วางแผนก่อนปรับใช้
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 4  
**ระยะเวลา**: 1 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การวางแผนความจุและการตรวจสอบทรัพยากร
- กลยุทธ์การเลือก SKU
- การตรวจสอบก่อนบินและการทำงานอัตโนมัติ

#### แหล่งเรียนรู้
- **📊 การวางแผน**: [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) - การตรวจสอบทรัพยากร
- **💰 การเลือก**: [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) - ตัวเลือกที่ประหยัด
- **✅ การตรวจสอบ**: [การตรวจสอบก่อนบิน](docs/chapter-06-pre-deployment/preflight-checks.md) - สคริปต์อัตโนมัติ

#### แบบฝึกหัดปฏิบัติ
- รันสคริปต์ตรวจสอบความจุ
- ปรับปรุงการเลือก SKU ให้คุ้มค่า
- นำการตรวจสอบก่อนปรับใช้แบบอัตโนมัติมาใช้

**💡 ผลลัพธ์ของบทเรียน**: ตรวจสอบและเพิ่มประสิทธิภาพการปรับใช้ก่อนดำเนินการจริง

---

### 🚨 บทที่ 7: การแก้ไขปัญหา & การดีบั๊ก
**ข้อกำหนดเบื้องต้น**: ผ่านบทปรับใช้ใดก็ได้  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- วิธีการดีบั๊กอย่างเป็นระบบ
- ปัญหาทั่วไปและวิธีแก้ไข
- การแก้ไขปัญหาเฉพาะบริการ AI

#### แหล่งเรียนรู้
- **🔧 ปัญหาทั่วไป**: [ปัญหาทั่วไป](docs/chapter-07-troubleshooting/common-issues.md) - คำถามที่พบบ่อยและวิธีแก้ไข
- **🕵️ การดีบั๊ก**: [คู่มือดีบั๊ก](docs/chapter-07-troubleshooting/debugging.md) - กลยุทธ์ทีละขั้นตอน
- **🤖 ปัญหา AI**: [การแก้ปัญหาเฉพาะ AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - ปัญหาบริการ AI

#### แบบฝึกหัดปฏิบัติ
- วินิจฉัยความล้มเหลวในการปรับใช้
- แก้ไขปัญหาการยืนยันตัวตน
- ดีบั๊กการเชื่อมต่อบริการ AI

**💡 ผลลัพธ์ของบทเรียน**: วินิจฉัยและแก้ไขปัญหาการปรับใช้ทั่วไปได้อย่างอิสระ

---

### 🏢 บทที่ 8: การผลิต & รูปแบบองค์กร
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1-4  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- กลยุทธ์การปรับใช้ในผลิตภัณฑ์
- รูปแบบความปลอดภัยองค์กร
- การติดตามและเพิ่มประสิทธิภาพต้นทุน

#### แหล่งเรียนรู้
- **🏭 การผลิต**: [แนวทางปฏิบัติที่ดีที่สุดของ AI ในการผลิต](docs/chapter-08-production/production-ai-practices.md) - รูปแบบองค์กร
- **📝 ตัวอย่าง**: [ตัวอย่างไมโครเซอร์วิส](../../examples/microservices) - สถาปัตยกรรมที่ซับซ้อน
- **📊 การตรวจสอบ**: [การผสานรวม Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - การตรวจสอบ

#### แบบฝึกปฏิบัติ
- นำรูปแบบความปลอดภัยองค์กรไปใช้
- ตั้งค่าการตรวจสอบอย่างครอบคลุม
- ปล่อยงานสู่การผลิตด้วยการกำกับดูแลที่เหมาะสม

**💡 ผลลัพธ์บทเรียน**: ปล่อยใช้งานแอปพลิเคชันพร้อมใช้งานในองค์กรด้วยความสามารถเต็มรูปแบบสำหรับการผลิต

---

## 🎓 ภาพรวมเวิร์กช็อป: ประสบการณ์การเรียนรู้เชิงปฏิบัติ

> **⚠️ สถานะเวิร์กช็อป: กำลังพัฒนา**  
> วัสดุเวิร์กช็อปอยู่ระหว่างการพัฒนาและปรับปรุง โมดูลหลักทำงานได้ แต่บางส่วนของเนื้อหาขั้นสูงยังไม่สมบูรณ์ เรากำลังดำเนินการเพื่อเสร็จสิ้นเนื้อหาทั้งหมด [ติดตามความคืบหน้า →](workshop/README.md)

### วัสดุเวิร์กช็อปเชิงโต้ตอบ
**การเรียนรู้อย่างครบถ้วนด้วยเครื่องมือบนเบราว์เซอร์และแบบฝึกปฏิบัตินำทาง**

วัสดุเวิร์กช็อปของเรามอบประสบการณ์การเรียนรู้อย่างมีโครงสร้างและเชิงโต้ตอบที่เติมเต็มหลักสูตรแบบบทเรียนข้างต้น เวิร์กช็อปนี้ออกแบบมาสำหรับการเรียนรู้ด้วยตนเองและการสอนโดยผู้สอน

#### 🛠️ คุณสมบัติของเวิร์กช็อป
- **อินเทอร์เฟซบนเบราว์เซอร์**: เวิร์กช็อปที่ขับเคลื่อนด้วย MkDocs ครบถ้วน พร้อมการค้นหา คัดลอก และฟีเจอร์ธีม
- **บูรณาการ GitHub Codespaces**: ตั้งค่าสภาพแวดล้อมการพัฒนาเพียงคลิกเดียว
- **เส้นทางการเรียนรู้อย่างมีโครงสร้าง**: แบบฝึกหัด 8 โมดูลที่นำทาง (รวม 3-4 ชั่วโมง)
- **ระเบียบวิธีทีละขั้น**: แนะนำ → เลือก → ยืนยัน → วิเคราะห์โครงสร้าง → กำหนดค่า → ปรับแต่ง → ยกเลิก → สรุป
- **สภาพแวดล้อม DevContainer เชิงโต้ตอบ**: เครื่องมือและการพึ่งพาที่ตั้งค่าล่วงหน้า

#### 📚 โครงสร้างโมดูลเวิร์กช็อป
เวิร์กช็อปปฏิบัติตาม **ระเบียบวิธีทีละขั้น 8 โมดูล** นำคุณจากการค้นพบสู่ความชำนาญด้านการปล่อยใช้งาน:

| โมดูล | หัวข้อ | สิ่งที่คุณจะทำ | ระยะเวลา |
|--------|-------|----------------|----------|
| **0. แนะนำ** | ภาพรวมเวิร์กช็อป | เข้าใจวัตถุประสงค์การเรียนรู้ เงื่อนไขเบื้องต้น และโครงสร้างเวิร์กช็อป | 15 นาที |
| **1. เลือก** | ค้นหาต้นแบบ | สำรวจต้นแบบ AZD และเลือกต้นแบบ AI ที่ถูกต้องสำหรับสถานการณ์ของคุณ | 20 นาที |
| **2. ยืนยัน** | ปล่อยใช้งานและตรวจสอบ | ปล่อยต้นแบบด้วย `azd up` และยืนยันว่าโครงสร้างทำงานได้ | 30 นาที |
| **3. วิเคราะห์โครงสร้าง** | เข้าใจโครงสร้าง | ใช้ GitHub Copilot สำรวจสถาปัตยกรรมต้นแบบ ไฟล์ Bicep และการจัดระเบียบโค้ด | 30 นาที |
| **4. กำหนดค่า** | เจาะลึก azure.yaml | เชี่ยวชาญการกำหนดค่า `azure.yaml`, hook lifecycle และตัวแปรสภาพแวดล้อม | 30 นาที |
| **5. ปรับแต่ง** | ทำให้เป็นของคุณ | เปิดใช้ AI Search, tracing, evaluation และปรับแต่งตามสถานการณ์ของคุณ | 45 นาที |
| **6. ยกเลิก** | ทำความสะอาด | ถอนทรัพยากรอย่างปลอดภัยด้วย `azd down --purge` | 15 นาที |
| **7. สรุป** | ขั้นตอนถัดไป | ทบทวนความสำเร็จ แนวคิดหลัก และต่อยอดการเรียนรู้ | 15 นาที |

**ลำดับขั้นเวิร์กช็อป:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 เริ่มต้นกับเวิร์กช็อป  
```bash
# ตัวเลือกที่ 1: GitHub Codespaces (แนะนำ)
# คลิก "Code" → "Create codespace on main" ในที่เก็บข้อมูล

# ตัวเลือกที่ 2: การพัฒนาท้องถิ่น
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ทำตามคำแนะนำการตั้งค่าใน workshop/README.md
```
  
#### 🎯 ผลลัพธ์การเรียนรู้จากเวิร์กช็อป  
เมื่อจบเวิร์กช็อป ผู้เข้าร่วมจะสามารถ:  
- **ปล่อยแอปพลิเคชัน AI ในการผลิต**: ใช้ AZD กับบริการ Microsoft Foundry  
- **ชำนาญสถาปัตยกรรมหลายเอเจนต์**: นำทางโซลูชันเอเจนต์ AI ที่ประสานงานกัน  
- **ใช้แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย**: กำหนดค่าการรับรองตัวตนและการควบคุมการเข้าถึง  
- **เพิ่มประสิทธิภาพสำหรับการขยายขนาด**: ออกแบบการปล่อยใช้งานที่มีประสิทธิภาพและประหยัดต้นทุน  
- **แก้ไขปัญหาการปล่อยใช้งาน**: แก้ไขปัญหาที่พบบ่อยได้ด้วยตนเอง

#### 📖 ทรัพยากรเวิร์กช็อป
- **🎥 คู่มือเชิงโต้ตอบ**: [วัสดุเวิร์กช็อป](workshop/README.md) - สภาพแวดล้อมการเรียนรู้บนเบราว์เซอร์  
- **📋 คำแนะนำทีละโมดูล**:  
  - [0. แนะนำ](workshop/docs/instructions/0-Introduction.md) - ภาพรวมและวัตถุประสงค์เวิร์กช็อป  
  - [1. เลือก](workshop/docs/instructions/1-Select-AI-Template.md) - ค้นหาและเลือกต้นแบบ AI  
  - [2. ยืนยัน](workshop/docs/instructions/2-Validate-AI-Template.md) - ปล่อยและตรวจสอบต้นแบบ  
  - [3. วิเคราะห์โครงสร้าง](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - สำรวจสถาปัตยกรรมต้นแบบ  
  - [4. กำหนดค่า](workshop/docs/instructions/4-Configure-AI-Template.md) - เชี่ยวชาญ azure.yaml  
  - [5. ปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) - ปรับแต่งตามสถานการณ์ของคุณ  
  - [6. ยกเลิก](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ทำความสะอาดทรัพยากร  
  - [7. สรุป](workshop/docs/instructions/7-Wrap-up.md) - ทบทวนและขั้นตอนถัดไป  
- **🛠️ AI Workshop Lab**: [ห้องปฏิบัติการเวิร์กช็อป AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - แบบฝึกหัดเน้น AI  
- **💡 เริ่มต้นด่วน**: [คู่มือการตั้งค่าเวิร์กช็อป](workshop/README.md#quick-start) - การกำหนดค่าสภาพแวดล้อม  

**เหมาะสำหรับ**: การฝึกอบรมองค์กร หลักสูตรมหาวิทยาลัย การเรียนรู้ด้วยตนเอง และค่ายพัฒนาซอฟต์แวร์

---

## 📖 เจาะลึก: ความสามารถของ AZD

นอกเหนือจากพื้นฐาน AZD ยังมีฟีเจอร์ทรงพลังสำหรับการปล่อยใช้งานในสภาพแวดล้อมผลิต:

- **การปล่อยใช้งานโดยใช้ต้นแบบ** - ใช้ต้นแบบสำเร็จรูปสำหรับรูปแบบแอปพลิเคชันทั่วไป
- **โครงสร้างพื้นฐานเป็นโค้ด** - จัดการทรัพยากร Azure ด้วย Bicep หรือ Terraform  
- **เวิร์กโฟลว์บูรณาการ** - จัดเตรียม ปล่อยใช้งาน และตรวจสอบแอปพลิเคชันอย่างไร้รอยต่อ  
- **เหมาะสำหรับนักพัฒนา** - ปรับแต่งเพื่อเพิ่มประสิทธิภาพและประสบการณ์สำหรับนักพัฒนา

### **AZD + Microsoft Foundry: เหมาะสำหรับการปล่อยใช้งาน AI**

**ทำไมต้อง AZD สำหรับโซลูชัน AI?** AZD ตอบโจทย์ความท้าทายหลักของนักพัฒนา AI:

- **ต้นแบบพร้อมใช้งานสำหรับ AI** - ต้นแบบที่เตรียมไว้สำหรับ Microsoft Foundry Models, Cognitive Services และงาน ML  
- **ปล่อยใช้งาน AI ที่ปลอดภัย** - รูปแบบความปลอดภัยที่สร้างไว้ในบริการ AI, คีย์ API และจุดปลายแบบจำลอง  
- **รูปแบบ AI สำหรับการผลิต** - แนวทางปฏิบัติที่ดีที่สุดสำหรับการปล่อยแอป AI ที่ปรับขนาดได้และประหยัดต้นทุน  
- **เวิร์กโฟลว์ AI ตั้งแต่ต้นจนจบ** - ตั้งแต่การพัฒนาโมเดลจนถึงการปล่อยใช้งานพร้อมการตรวจสอบที่เหมาะสม  
- **เพิ่มประสิทธิภาพต้นทุน** - การจัดสรรและปรับขนาดทรัพยากรอย่างชาญฉลาดสำหรับงาน AI  
- **การผสานรวม Microsoft Foundry** - การเชื่อมต่อเรียบง่ายสู่แคตตาล็อกและจุดปลายโมเดล Microsoft Foundry

---

## 🎯 คลังต้นแบบ & ตัวอย่าง

### แนะนำ: ต้นแบบ Microsoft Foundry
**เริ่มจากตรงนี้หากคุณกำลังปล่อยแอป AI!**

> **หมายเหตุ:** ต้นแบบเหล่านี้แสดงรูปแบบ AI หลายแบบ บางตัวเป็นตัวอย่าง Azure ภายนอก บางตัวเป็นการใช้งานภายใน

| ต้นแบบ | บทเรียน | ความซับซ้อน | บริการ | ประเภท |
|----------|---------|------------|----------|------|
| [**เริ่มต้นใช้งาน AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ภายนอก |
| [**เริ่มต้นใช้งาน AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | บทที่ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ภายนอก |
| [**สาธิต Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ภายนอก |
| [**เริ่มใช้ OpenAI Chat App อย่างรวดเร็ว**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ภายนอก |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ภายนอก |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ภายนอก |
| [**โซลูชัน Multi-Agent สำหรับค้าปลีก**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ภายใน** |

### แนะนำ: สถานการณ์การเรียนรู้ครบถ้วน
**ต้นแบบแอปพลิเคชันพร้อมใช้งานสำหรับการผลิต ที่จับคู่กับบทเรียน**

| ต้นแบบ | บทเรียน | ความซับซ้อน | การเรียนรู้หลัก |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | รูปแบบการปล่อยใช้งาน AI พื้นฐาน |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | การใช้งาน RAG กับ Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | บทที่ 4 | ⭐⭐ | การผสานรวมเอกสารอัจฉริยะ |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | เฟรมเวิร์กเอเจนต์และการเรียกฟังก์ชัน |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐ | การจัดการ AI ในองค์กร |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | สถาปัตยกรรมหลายเอเจนต์กับเอเจนต์ลูกค้าและสินค้าคงคลัง |

### การเรียนรู้ตามประเภทตัวอย่าง

> **📌 ตัวอย่างภายใน vs ภายนอก:**  
> **ตัวอย่างภายใน** (ในที่เก็บนี้) = ใช้งานได้ทันที  
> **ตัวอย่างภายนอก** (ตัวอย่าง Azure) = โคลนจากที่เก็บที่ลิงก์

#### ตัวอย่างภายใน (พร้อมใช้)
- [**โซลูชัน Multi-Agent สำหรับค้าปลีก**](examples/retail-scenario.md) - การใช้งานสำเร็จรูปพร้อมใช้สำหรับการผลิตด้วยต้นแบบ ARM  
  - สถาปัตยกรรมหลายเอเจนต์ (เอเจนต์ลูกค้า + สินค้าคงคลัง)  
  - การตรวจสอบและประเมินผลอย่างครบถ้วน  
  - ปล่อยใช้งานเพียงคลิกเดียวผ่านต้นแบบ ARM

#### ตัวอย่างภายใน - แอปคอนเทนเนอร์ (บทที่ 2-5)
**ตัวอย่างการปล่อยใช้งานแอปคอนเทนเนอร์ครบถ้วนในที่เก็บนี้:**  
- [**ตัวอย่างแอปคอนเทนเนอร์**](examples/container-app/README.md) - คู่มือครบถ้วนสำหรับการปล่อยคอนเทนเนอร์  
  - [REST API Flask ง่ายๆ](../../examples/container-app/simple-flask-api) - API REST ขั้นพื้นฐานพร้อมสเกลเป็นศูนย์  
  - [สถาปัตยกรรมไมโครเซอร์วิส](../../examples/container-app/microservices) - ปล่อยใช้งานหลายบริการพร้อมใช้งานจริง  
  - รูปแบบการเริ่มต้นด่วน การผลิต และขั้นสูง  
  - แนวทางตรวจสอบ ความปลอดภัย และการเพิ่มประสิทธิภาพต้นทุน

#### ตัวอย่างภายนอก - แอปพื้นฐาน (บทที่ 1-2)
**โคลนที่เก็บตัวอย่าง Azure เหล่านี้เพื่อเริ่มต้น:**  
- [แอปเว็บง่ายๆ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - รูปแบบปล่อยใช้งานพื้นฐาน  
- [เว็บไซต์สแตติก - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - ปล่อยเนื้อหาสแตติก  
- [แอปคอนเทนเนอร์ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - ปล่อย API REST

#### ตัวอย่างภายนอก - การผนวกฐานข้อมูล (บทที่ 3-4)  
- [แอปฐานข้อมูล - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - รูปแบบการเชื่อมต่อฐานข้อมูล  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - เวิร์กโฟลว์ข้อมูลแบบ serverless

#### ตัวอย่างภายนอก - รูปแบบขั้นสูง (บทที่ 4-8)
- [ไมโครเซอร์วิส Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - สถาปัตยกรรมหลายบริการ  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - การประมวลผลเบื้องหลัง  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - รูปแบบ ML พร้อมใช้จริง

### คอลเลกชันต้นแบบภายนอก
- [**แกลเลอรีต้นแบบ AZD ทางการ**](https://azure.github.io/awesome-azd/) - คอลเลกชันต้นแบบทางการและจากชุมชนที่คัดสรร  
- [**เอกสารต้นแบบ Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - เอกสารต้นแบบ Microsoft Learn  
- [**ไดเรกทอรีตัวอย่าง**](examples/README.md) - ตัวอย่างการเรียนรู้ภายในพร้อมคำอธิบายละเอียด

---

## 📚 แหล่งข้อมูลการเรียนรู้ & อ้างอิง

### เอกสารอ้างอิงด่วน
- [**ชีตคำสั่ง**](resources/cheat-sheet.md) - คำสั่ง azd ที่จำเป็นจัดเรียงตามบท  
- [**พจนานุกรมศัพท์**](resources/glossary.md) - คำศัพท์ Azure และ azd  
- [**คำถามที่พบบ่อย**](resources/faq.md) - คำถามทั่วไปจัดตามบทเรียน  
- [**คู่มือศึกษา**](resources/study-guide.md) - แบบฝึกปฏิบัติครบถ้วน

### เวิร์กช็อปเชิงปฏิบัติ
- [**ห้องปฏิบัติการเวิร์กช็อป AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำให้โซลูชัน AI สามารถปล่อยด้วย AZD (2-3 ชั่วโมง)  
- [**เวิร์กช็อปเชิงโต้ตอบ**](workshop/README.md) - แบบฝึกหัด 8 โมดูลนำทาง พร้อม MkDocs และ GitHub Codespaces  
  - ลำดับ: แนะนำ → เลือก → ยืนยัน → วิเคราะห์โครงสร้าง → กำหนดค่า → ปรับแต่ง → ยกเลิก → สรุป

### แหล่งเรียนรู้ออนไลน์เพิ่มเติม
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [เครื่องคิดเลขราคา Azure](https://azure.microsoft.com/pricing/calculator/)
- [สถานะ Azure](https://status.azure.com/)

### ทักษะ AI Agent สำหรับบรรณาธิการของคุณ
- [**ทักษะ Microsoft Azure บน skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - ทักษะตัวแทนเปิด 37 ทักษะสำหรับ Azure AI, Foundry, การปรับใช้, การวินิจฉัย, การเพิ่มประสิทธิภาพต้นทุน และอื่นๆ ติดตั้งพวกมันใน GitHub Copilot, Cursor, Claude Code หรือเอเจนต์ที่รองรับใด ๆ :
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 คู่มือแก้ไขปัญหาอย่างรวดเร็ว

**ปัญหาทั่วไปที่ผู้เริ่มต้นพบและวิธีแก้ไขทันที:**

<details>
<summary><strong>❌ "azd: ไม่พบคำสั่ง"</strong></summary>

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
<summary><strong>❌ "ไม่พบการสมัครใช้งาน" หรือ "ไม่ได้ตั้งค่าการสมัครใช้งาน"</strong></summary>

```bash
# แสดงรายการการสมัครใช้งานที่มีอยู่
az account list --output table

# ตั้งค่าการสมัครใช้งานเริ่มต้น
az account set --subscription "<subscription-id-or-name>"

# ตั้งค่าสำหรับสภาพแวดล้อม AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# ตรวจสอบ
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" หรือ "เกินโควต้า"</strong></summary>

```bash
# ลองใช้ภูมิภาค Azure ที่แตกต่างกัน
azd env set AZURE_LOCATION "westus2"
azd up

# หรือใช้ SKU ที่เล็กกว่าในระหว่างการพัฒนา
# แก้ไขไฟล์ infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ล้มเหลวกึ่งกลางทาง</strong></summary>

```bash
# ตัวเลือก 1: ล้างและลองใหม่
azd down --force --purge
azd up

# ตัวเลือก 2: แก้ไขโครงสร้างพื้นฐานอย่างเดียว
azd provision

# ตัวเลือก 3: ตรวจสอบสถานะโดยละเอียด
azd show

# ตัวเลือก 4: ตรวจสอบบันทึกใน Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "การยืนยันตัวตนล้มเหลว" หรือ "โทเค็นหมดอายุ"</strong></summary>

```bash
# ยืนยันตัวตนใหม่
az logout
az login

azd auth logout
azd auth login

# ตรวจสอบการยืนยันตัวตน
az account show
```
</details>

<details>
<summary><strong>❌ "ทรัพยากรมีอยู่แล้ว" หรือปัญหาการตั้งชื่อซ้ำกัน</strong></summary>

```bash
# AZD สร้างชื่อที่ไม่ซ้ำกัน แต่ถ้ามีความขัดแย้ง:
azd down --force --purge

# แล้วลองใหม่ด้วยสิ่งแวดล้อมใหม่
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ การปรับใช้แม่แบบใช้เวลานานเกินไป</strong></summary>

**เวลารอปกติ:**
- เว็บแอปง่าย ๆ: 5-10 นาที
- แอปที่มีฐานข้อมูล: 10-15 นาที
- แอป AI: 15-25 นาที (การจัดเตรียม OpenAI ช้า)

```bash
# ตรวจสอบความคืบหน้า
azd show

# หากติดขัดเกิน 30 นาที ให้ตรวจสอบ Azure Portal:
azd monitor
# มองหาการติดตั้งที่ล้มเหลว
```
</details>

<details>
<summary><strong>❌ "ปฏิเสธสิทธิ์" หรือ "ห้ามเข้าถึง"</strong></summary>

```bash
# ตรวจสอบบทบาท Azure ของคุณ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# คุณต้องมีบทบาท "Contributor" อย่างน้อย
# ขอให้ผู้ดูแล Azure ของคุณอนุญาต:
# - Contributor (สำหรับทรัพยากร)
# - User Access Administrator (สำหรับการกำหนดบทบาท)
```
</details>

<details>
<summary><strong>❌ ไม่พบ URL แอปที่ปรับใช้</strong></summary>

```bash
# แสดงจุดเชื่อมต่อบริการทั้งหมด
azd show

# หรือเปิดพอร์ทัล Azure
azd monitor

# ตรวจสอบบริการเฉพาะ
azd env get-values
# ค้นหาตัวแปร *_URL
```
</details>

### 📚 แหล่งข้อมูลแก้ไขปัญหาแบบเต็ม

- **คู่มือปัญหาทั่วไป:** [วิธีแก้ไขโดยละเอียด](docs/chapter-07-troubleshooting/common-issues.md)
- **ปัญหาเฉพาะ AI:** [การแก้ไขปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **คู่มือดีบัก:** [การดีบักทีละขั้นตอน](docs/chapter-07-troubleshooting/debugging.md)
- **ขอความช่วยเหลือ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 การจบหลักสูตร & การรับรอง

### การติดตามความคืบหน้า
ติดตามความก้าวหน้าการเรียนของคุณในแต่ละบท:

- [ ] **บทที่ 1**: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว ✅
- [ ] **บทที่ 2**: การพัฒนาแบบ AI-First ✅  
- [ ] **บทที่ 3**: การกำหนดค่า & การยืนยันตัวตน ✅
- [ ] **บทที่ 4**: โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้ ✅
- [ ] **บทที่ 5**: โซลูชัน AI แบบหลายเอเจนต์ ✅
- [ ] **บทที่ 6**: การตรวจสอบล่วงหน้า & การวางแผน ✅
- [ ] **บทที่ 7**: การแก้ไขปัญหา & การดีบัก ✅
- [ ] **บทที่ 8**: รูปแบบการผลิต & องค์กร ✅

### การยืนยันการเรียนรู้
หลังจบแต่ละบท ให้ตรวจสอบความรู้ของคุณโดย:
1. **แบบฝึกหัดปฏิบัติ:** ทำการปรับใช้แบบลงมือทำตามบท
2. **ตรวจสอบความรู้:** ทบทวนส่วนคำถามที่พบบ่อยในบทของคุณ
3. **อภิปรายในชุมชน:** แชร์ประสบการณ์ของคุณใน Azure Discord
4. **บทถัดไป:** ก้าวไปสู่ระดับความซับซ้อนถัดไป

### ประโยชน์จากการจบหลักสูตร
เมื่อคุณทำครบทุกบทแล้ว คุณจะได้รับ:
- **ประสบการณ์การผลิต:** ปรับใช้แอป AI จริงบน Azure
- **ทักษะมืออาชีพ:** ความสามารถในการปรับใช้ระดับองค์กร  
- **การยอมรับจากชุมชน:** เป็นสมาชิกที่มีบทบาทของชุมชนผู้พัฒนา Azure
- **ความก้าวหน้าในอาชีพ:** ทักษะ AZD และการปรับใช้ AI ที่ต้องการตัว

---

## 🤝 ชุมชน & การสนับสนุน

### ขอความช่วยเหลือ & การสนับสนุน
- **ปัญหาทางเทคนิค:** [รายงานบั๊กและขอคุณสมบัติ](https://github.com/microsoft/azd-for-beginners/issues)
- **คำถามการเรียน:** [ชุมชน Microsoft Azure Discord](https://discord.gg/microsoft-azure) และ [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ช่วยเหลือเฉพาะ AI:** เข้าร่วม [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **เอกสาร:** [เอกสาร Azure Developer CLI อย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### ข้อมูลเชิงลึกจาก Microsoft Foundry Discord

**ผลโหวตล่าสุดจากช่อง #Azure:**
- **45%** ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI
- **ความท้าทายอันดับต้นๆ:** การปรับใช้หลายบริการ, การจัดการรหัสรับรอง, ความพร้อมสำหรับการผลิต  
- **สิ่งที่ร้องขอมากที่สุด:** แม่แบบเฉพาะ AI, คู่มือแก้ไขปัญหา, แนวทางปฏิบัติที่ดีที่สุด

**เข้าร่วมชุมชนของเราเพื่อ:**
- แชร์ประสบการณ์ AZD + AI และรับความช่วยเหลือ
- เข้าถึงตัวอย่างใหม่ของแม่แบบ AI ก่อนใคร
- มีส่วนร่วมในแนวปฏิบัติที่ดีที่สุดในการปรับใช้ AI
- มีอิทธิพลต่อการพัฒนาฟีเจอร์ AI + AZD ในอนาคต

### การมีส่วนร่วมในหลักสูตร
เรายินดีรับการมีส่วนร่วม! โปรดอ่าน [คู่มือการมีส่วนร่วม](CONTRIBUTING.md) สำหรับรายละเอียดเกี่ยวกับ:
- **การปรับปรุงเนื้อหา:** ยกระดับบทและตัวอย่างที่มีอยู่
- **ตัวอย่างใหม่:** เพิ่มสถานการณ์และแม่แบบจริง  
- **การแปล:** ช่วยดูแลการสนับสนุนหลายภาษา
- **รายงานบั๊ก:** ปรับปรุงความถูกต้องและความชัดเจน
- **มาตรฐานชุมชน:** ปฏิบัติตามแนวทางชุมชนที่ครอบคลุม

---

## 📄 ข้อมูลหลักสูตร

### ใบอนุญาต
โครงการนี้ได้รับอนุญาตภายใต้ MIT License - ดูไฟล์ [LICENSE](../../LICENSE) สำหรับรายละเอียด

### แหล่งข้อมูลการเรียนรู้ที่เกี่ยวข้องของ Microsoft

ทีมของเราผลิตหลักสูตรการเรียนรู้แบบครบวงจรอื่น ๆ:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j สำหรับผู้เริ่มต้น](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js สำหรับผู้เริ่มต้น](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain สำหรับผู้เริ่มต้น](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD สำหรับผู้เริ่มต้น](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI สำหรับผู้เริ่มต้น](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP สำหรับผู้เริ่มต้น](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents สำหรับผู้เริ่มต้น](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ชุด Generative AI
[![Generative AI สำหรับผู้เริ่มต้น](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### การเรียนรู้หลัก
[![ML สำหรับผู้เริ่มต้น](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science สำหรับผู้เริ่มต้น](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI สำหรับผู้เริ่มต้น](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity สำหรับผู้เริ่มต้น](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev สำหรับผู้เริ่มต้น](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT สำหรับผู้เริ่มต้น](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development สำหรับผู้เริ่มต้น](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ชุด Copilot

[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ การนำทางหลักสูตร

**🚀 พร้อมเริ่มเรียนรู้หรือยัง?**

**ผู้เริ่มต้น**: เริ่มต้นที่ [บทที่ 1: พื้นฐาน & เริ่มต้นด่วน](../..)  
**นักพัฒนา AI**: ข้ามไปที่ [บทที่ 2: การพัฒนา AI-First](../..)  
**นักพัฒนาที่มีประสบการณ์**: เริ่มต้นที่ [บทที่ 3: การตั้งค่า & การตรวจสอบสิทธิ์](../..)

**ขั้นตอนถัดไป**: [เริ่มบทที่ 1 - พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วยระบบปัญญาประดิษฐ์ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามความถูกต้องอย่างเต็มที่ แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้องได้ เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้บริการแปลโดยนักแปลมืออาชีพ เราไม่รับผิดชอบใด ๆ ต่อความเข้าใจผิดหรือการตีความผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->