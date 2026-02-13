# AZD สำหรับผู้เริ่มต้น: การเรียนรู้แบบมีโครงสร้าง

![AZD-for-beginners](../../translated_images/th/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### การแปลอัตโนมัติ (อัปเดตเสมอ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[อาหรับ](../ar/README.md) | [เบงกาลี](../bn/README.md) | [บัลแกเรีย](../bg/README.md) | [พม่า (เมียนมา)](../my/README.md) | [จีน (ตัวย่อ)](../zh-CN/README.md) | [จีน (ตัวเต็ม, ฮ่องกง)](../zh-HK/README.md) | [จีน (ตัวเต็ม, มาเก๊า)](../zh-MO/README.md) | [จีน (ตัวเต็ม, ไต้หวัน)](../zh-TW/README.md) | [โครเอเชีย](../hr/README.md) | [เช็ก](../cs/README.md) | [เดนมาร์ก](../da/README.md) | [ดัตช์](../nl/README.md) | [เอสโตเนีย](../et/README.md) | [ฟินแลนด์](../fi/README.md) | [ฝรั่งเศส](../fr/README.md) | [เยอรมัน](../de/README.md) | [กรีก](../el/README.md) | [ฮิบรู](../he/README.md) | [ฮินดี](../hi/README.md) | [ฮังการี](../hu/README.md) | [อินโดนีเซีย](../id/README.md) | [อิตาลี](../it/README.md) | [ญี่ปุ่น](../ja/README.md) | [กันนาดา](../kn/README.md) | [เกาหลี](../ko/README.md) | [ลิทัวเนีย](../lt/README.md) | [มลายู](../ms/README.md) | [มาลายาลัม](../ml/README.md) | [มราธี](../mr/README.md) | [เนปาลี](../ne/README.md) | [ไพจินไนจีเรีย](../pcm/README.md) | [นอร์เวย์](../no/README.md) | [เปอร์เซีย (ฟาร์ซี)](../fa/README.md) | [โปแลนด์](../pl/README.md) | [โปรตุเกส (บราซิล)](../pt-BR/README.md) | [โปรตุเกส (โปรตุเกส)](../pt-PT/README.md) | [ปัญจาบี (กูรมูขิ)](../pa/README.md) | [โรมาเนีย](../ro/README.md) | [รัสเซีย](../ru/README.md) | [เซอร์เบีย (ซีริลลิก)](../sr/README.md) | [สโลวัก](../sk/README.md) | [สโลเวเนีย](../sl/README.md) | [สเปน](../es/README.md) | [สวาฮิลี](../sw/README.md) | [สวีเดน](../sv/README.md) | [ทากาล็อก (ฟิลิปปินส์)](../tl/README.md) | [ทมิฬ](../ta/README.md) | [เทลูกู](../te/README.md) | [ไทย](./README.md) | [ตุรกี](../tr/README.md) | [ยูเครน](../uk/README.md) | [อูรดู](../ur/README.md) | [เวียดนาม](../vi/README.md)

> **ต้องการโคลนในเครื่องไหม?**

> ที่เก็บนี้มีการแปลมากกว่า 50 ภาษา ซึ่งทำให้ขนาดไฟล์ดาวน์โหลดใหญ่ขึ้นมาก หากต้องการโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ซึ่งจะมีทุกอย่างที่คุณต้องการเพื่อเรียนจบหลักสูตรได้รวดเร็วขึ้นอย่างมาก
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) คืออะไร?

**Azure Developer CLI (azd)** คือเครื่องมือบรรทัดคำสั่งที่เป็นมิตรกับนักพัฒนา ทำให้การนำแอปพลิเคชันไปใช้งานบน Azure เป็นเรื่องง่าย แทนที่จะต้องสร้างและเชื่อมต่อทรัพยากร Azure หลายสิบรายการด้วยตนเอง คุณสามารถปรับใช้แอปพลิเคชันทั้งหมดด้วยคำสั่งเดียว

### ความมหัศจรรย์ของ `azd up`

```bash
# คำสั่งเดียวนี้ทำทุกอย่าง:
# ✅ สร้างทรัพยากร Azure ทั้งหมด
# ✅ กำหนดค่าเครือข่ายและความปลอดภัย
# ✅ สร้างโค้ดแอปพลิเคชันของคุณ
# ✅ นำไปปรับใช้บน Azure
# ✅ มอบ URL ที่ใช้งานได้ให้คุณ
azd up
```

**แค่นี้แหละ!** ไม่ต้องคลิกใน Azure Portal, ไม่มีเทมเพลต ARM ซับซ้อนให้เรียนรู้ก่อน, ไม่มีการตั้งค่าด้วยตนเอง — แค่แอปพลิเคชันที่ใช้งานบน Azure ได้จริง

---

## ❓ Azure Developer CLI กับ Azure CLI: ต่างกันอย่างไร?

นี่คือคำถามที่พบบ่อยที่สุดสำหรับผู้เริ่มต้น คำตอบง่ายๆ คือ:

| คุณสมบัติ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **จุดประสงค์** | จัดการทรัพยากร Azure ทีละรายการ | นำแอปพลิเคชันทั้งหมดไปใช้งาน |
| **แนวคิด** | โฟกัสที่โครงสร้างพื้นฐาน | โฟกัสที่แอปพลิเคชัน |
| **ตัวอย่าง** | `az webapp create --name myapp...` | `azd up` |
| **เส้นโค้งการเรียนรู้** | ต้องรู้บริการ Azure | แค่รู้จักแอปของคุณ |
| **เหมาะสำหรับ** | DevOps, โครงสร้างพื้นฐาน | นักพัฒนา, สร้างต้นแบบ |

### อุปมาอุปไมยง่ายๆ

- **Azure CLI** เหมือนมีเครื่องมือทั้งหมดในการสร้างบ้าน - ค้อน, เลื่อย, ตะปู คุณสามารถสร้างได้ทุกอย่าง แต่คุณต้องรู้เรื่องก่อสร้าง
- **Azure Developer CLI** เหมือนจ้างผู้รับเหมา - คุณอธิบายสิ่งที่ต้องการ แล้วพวกเขาจัดการการก่อสร้างให้

### ใช้เมื่อไหร่

| สถานการณ์ | ใช้ตัวนี้ |
|----------|----------|
| "อยากนำเว็บแอปไปใช้เร็วๆ" | `azd up` |
| "ต้องการแค่สร้างบัญชีเก็บข้อมูล" | `az storage account create` |
| "กำลังสร้างแอป AI เต็มรูปแบบ" | `azd init --template azure-search-openai-demo` |
| "ต้องการดีบักทรัพยากร Azure เฉพาะ" | `az resource show` |
| "อยากได้การปรับใช้สำหรับผลิตภายในไม่กี่นาที" | `azd up --environment production` |

### พวกเขาทำงานร่วมกันได้!

AZD ใช้ Azure CLI อยู่เบื้องหลัง คุณสามารถใช้ทั้งสองได้:
```bash
# ปรับใช้แอปของคุณด้วย AZD
azd up

# จากนั้นปรับแต่งทรัพยากรเฉพาะด้วย Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ค้นหาเทมเพลตใน Awesome AZD

ไม่ต้องเริ่มต้นจากศูนย์! **Awesome AZD** คือชุมชนที่รวบรวมเทมเพลตพร้อมปรับใช้ได้ทันที:

| ทรัพยากร | คำอธิบาย |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | เลือกดูเทมเพลตกว่า 200+ และปรับใช้ด้วยคลิกเดียว |
| 🔗 [**ส่งเทมเพลต**](https://github.com/Azure/awesome-azd/issues) | ร่วมแบ่งปันเทมเพลตของคุณให้ชุมชน |
| 🔗 [**ที่เก็บ GitHub**](https://github.com/Azure/awesome-azd) | กดดาวและสำรวจซอร์สโค้ด |

### เทมเพลต AI ยอดนิยมจาก Awesome AZD

```bash
# แชท RAG ด้วย Azure OpenAI + AI Search
azd init --template azure-search-openai-demo

# แอปพลิเคชันแชท AI แบบรวดเร็ว
azd init --template openai-chat-app-quickstart

# เอเจนต์ AI ร่วมกับ Foundry Agents
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

### ขั้นตอนที่ 3: ปรับใช้แอปแรกของคุณ

```bash
# เริ่มต้นจากเทมเพลต
azd init --template todo-nodejs-mongo

# ปรับใช้ไปยัง Azure (สร้างทุกอย่าง!)
azd up
```

**🎉 แค่นี้แหละ!** แอปของคุณพร้อมใช้งานบน Azure แล้ว

### ทำความสะอาด (อย่าลืม!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 วิธีใช้หลักสูตรนี้

หลักสูตรนี้ออกแบบมาเพื่อ **เรียนรู้แบบก้าวหน้า** — เริ่มต้นจากระดับที่คุณสะดวกและพัฒนาต่อไป:

| ประสบการณ์ของคุณ | เริ่มที่นี่ |
|-----------------|------------|
| **ใหม่กับ Azure** | [บทที่ 1: พื้นฐาน](../..) |
| **รู้จัก Azure แต่ใหม่กับ AZD** | [บทที่ 1: พื้นฐาน](../..) |
| **อยากพัฒนาแอป AI** | [บทที่ 2: การพัฒนา AI เป็นอันดับแรก](../..) |
| **อยากฝึกปฏิบัติจริง** | [🎓 เวิร์กช็อปเชิงโต้ตอบ](workshop/README.md) - ห้องปฏิบัติการแนะนำ 3-4 ชั่วโมง |
| **ต้องการแบบแผนการผลิต** | [บทที่ 8: การผลิต & องค์กร](../..) |

### การตั้งค่าอย่างรวดเร็ว

1. **Fork ที่เก็บนี้**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **โคลนมา**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ขอความช่วยเหลือ**: [ชุมชน Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **ต้องการโคลนในเครื่องไหม?**

> ที่เก็บนี้มีการแปลมากกว่า 50 ภาษา ซึ่งทำให้ขนาดไฟล์ดาวน์โหลดใหญ่ขึ้นมาก หากต้องการโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ซึ่งจะมีทุกอย่างที่คุณต้องการเพื่อเรียนจบหลักสูตรได้รวดเร็วขึ้นอย่างมาก


## ภาพรวมหลักสูตร

เรียนรู้ Azure Developer CLI (azd) ผ่านบทต่างๆ ที่ออกแบบมาเพื่อการเรียนรู้แบบก้าวหน้า โดยเน้นพิเศษที่การปรับใช้แอป AI ร่วมกับ Microsoft Foundry

### ทำไมหลักสูตรนี้จึงจำเป็นสำหรับนักพัฒนายุคใหม่

อิงจากข้อมูลจากชุมชน Microsoft Foundry Discord, **45% ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI** แต่เจอปัญหาเกี่ยวกับ:
- สถาปัตยกรรม AI หลายบริการที่ซับซ้อน
- แนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ AI ในการผลิต  
- การผสานรวมและตั้งค่าบริการ AI บน Azure
- การเพิ่มประสิทธิภาพต้นทุนสำหรับงาน AI
- การแก้ปัญหาการปรับใช้เฉพาะ AI

### เป้าหมายการเรียนรู้

หลังจบหลักสูตรนี้ คุณจะสามารถ:
- **เชี่ยวชาญพื้นฐาน AZD**: แนวคิดหลัก, การติดตั้ง และการตั้งค่า
- **ปรับใช้แอป AI**: ใช้ AZD กับบริการ Microsoft Foundry
- **ใช้อินฟราสตรัคเจอร์แบบ Infrastructure as Code**: จัดการทรัพยากร Azure ด้วยเทมเพลต Bicep
- **แก้ไขปัญหาการปรับใช้**: แก้ไขปัญหาทั่วไปและดีบักข้อผิดพลาด
- **เพิ่มประสิทธิภาพสำหรับการใช้งานจริง**: ด้านความปลอดภัย, การสเกล, การติดตาม และการจัดการค่าใช้จ่าย
- **สร้างโซลูชัน Multi-Agent**: ปรับใช้สถาปัตยกรรม AI ที่ซับซ้อน

## 🗺️ แผนที่หลักสูตร: นำทางอย่างรวดเร็วตามบท

แต่ละบทมี README เฉพาะพร้อมเป้าหมายการเรียนรู้, การเริ่มต้นอย่างรวดเร็ว และแบบฝึกหัด:

| บท | หัวข้อ | บทเรียน | ระยะเวลา | ความซับซ้อน |
|---------|-------|---------|----------|------------|
| **[บท 1: พื้นฐาน](docs/chapter-01-foundation/README.md)** | เริ่มต้น | [AZD พื้นฐาน](docs/chapter-01-foundation/azd-basics.md) &#124; [การติดตั้ง](docs/chapter-01-foundation/installation.md) &#124; [โครงการแรก](docs/chapter-01-foundation/first-project.md) | 30-45 นาที | ⭐ |
| **[บท 2: การพัฒนา AI](docs/chapter-02-ai-development/README.md)** | แอป AI เป็นอันดับแรก | [การผสาน Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [เอเย่นต์ AI](docs/chapter-02-ai-development/agents.md) &#124; [การปรับใช้โมเดล AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [เวิร์กช็อป](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ชม. | ⭐⭐ |
| **[บท 3: การตั้งค่า](docs/chapter-03-configuration/README.md)** | การพิสูจน์ตัวตน & ความปลอดภัย | [การตั้งค่า](docs/chapter-03-configuration/configuration.md) &#124; [การพิสูจน์ตัวตน & ความปลอดภัย](docs/chapter-03-configuration/authsecurity.md) | 45-60 นาที | ⭐⭐ |
| **[บท 4: โครงสร้างพื้นฐาน](docs/chapter-04-infrastructure/README.md)** | IaC & การปรับใช้ | [คู่มือการปรับใช้](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [การจัดสรรทรัพยากร](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ชม. | ⭐⭐⭐ |
| **[บทที่ 5: ผู้ช่วยหลายตัว](docs/chapter-05-multi-agent/README.md)** | โซลูชัน AI Agent | [สถานการณ์ค้าปลีก](examples/retail-scenario.md) &#124; [รูปแบบการประสานงาน](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ชั่วโมง | ⭐⭐⭐⭐ |
| **[บทที่ 6: การเตรียมก่อนติดตั้ง](docs/chapter-06-pre-deployment/README.md)** | การวางแผนและการตรวจสอบ | [ตรวจสอบก่อนบิน](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ข้อมูลเชิงลึกของแอป](docs/chapter-06-pre-deployment/application-insights.md) | 1 ชั่วโมง | ⭐⭐ |
| **[บทที่ 7: การแก้ไขปัญหา](docs/chapter-07-troubleshooting/README.md)** | การดีบักและแก้ไข | [ปัญหาทั่วไป](docs/chapter-07-troubleshooting/common-issues.md) &#124; [การดีบัก](docs/chapter-07-troubleshooting/debugging.md) &#124; [ปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ชั่วโมง | ⭐⭐ |
| **[บทที่ 8: การผลิต](docs/chapter-08-production/README.md)** | รูปแบบสำหรับองค์กร | [แนวปฏิบัติการผลิต](docs/chapter-08-production/production-ai-practices.md) | 2-3 ชั่วโมง | ⭐⭐⭐⭐ |
| **[🎓 เวิร์กช็อป](workshop/README.md)** | ห้องปฏิบัติการปฏิบัติ | [บทนำ](workshop/docs/instructions/0-Introduction.md) &#124; [การเลือก](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [การตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [การแยกส่วน](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [การกำหนดค่า](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [การปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [การรื้อถอน](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [การสรุป](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ชั่วโมง | ⭐⭐ |

**ระยะเวลาหลักสูตรรวม:** ~10-14 ชั่วโมง | **ความก้าวหน้าทักษะ:** ผู้เริ่มต้น → พร้อมสำหรับผลิต

---

## 📚 บทเรียน

*เลือกเส้นทางการเรียนรู้ของคุณตามระดับประสบการณ์และเป้าหมาย*

### 🚀 บทที่ 1: พื้นฐานและเริ่มต้นอย่างรวดเร็ว
**ข้อกำหนดเบื้องต้น**: บัญชี Azure, ความรู้พื้นฐานเกี่ยวกับบรรทัดคำสั่ง  
**ระยะเวลา**: 30-45 นาที  
**ระดับความยาก**: ⭐

#### สิ่งที่คุณจะได้เรียนรู้
- เข้าใจพื้นฐาน Azure Developer CLI
- การติดตั้ง AZD บนแพลตฟอร์มของคุณ
- การติดตั้งแอปพลิเคชันครั้งแรกที่ประสบความสำเร็จ

#### แหล่งเรียนรู้
- **🎯 เริ่มที่นี่**: [Azure Developer CLI คืออะไร?](../..)
- **📖 ทฤษฎี**: [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) - แนวคิดหลักและคำศัพท์
- **⚙️ การตั้งค่า**: [การติดตั้งและตั้งค่า](docs/chapter-01-foundation/installation.md) - คู่มือเฉพาะแพลตฟอร์ม
- **🛠️ ปฏิบัติ**: [โปรเจกต์แรกของคุณ](docs/chapter-01-foundation/first-project.md) - คำแนะนำทีละขั้นตอน
- **📋 อ้างอิงด่วน**: [แผ่นคำสั่ง](resources/cheat-sheet.md)

#### แบบฝึกหัดปฏิบัติ
```bash
# ตรวจสอบการติดตั้งอย่างรวดเร็ว
azd version

# เปิดใช้แอปพลิเคชันแรกของคุณ
azd init --template todo-nodejs-mongo
azd up
```

**💡 ผลลัพธ์บทเรียน**: ติดตั้งแอปพลิเคชันเว็บอย่างง่ายไปยัง Azure ด้วย AZD ได้สำเร็จ

**✅ การตรวจสอบความสำเร็จ:**
```bash
# หลังจากทำบทที่ 1 เสร็จแล้ว คุณควรจะสามารถ:
azd version              # แสดงเวอร์ชันที่ติดตั้งไว้
azd init --template todo-nodejs-mongo  # เริ่มต้นโครงการ
azd up                  # ประกาศใช้งานบน Azure
azd show                # แสดง URL ของแอปที่กำลังทำงาน
# แอปพลิเคชันเปิดในเบราว์เซอร์และใช้งานได้
azd down --force --purge  # ลบทรัพยากรออก
```

**📊 ระยะเวลา:** 30-45 นาที  
**📈 ระดับทักษะหลังเรียน:** สามารถติดตั้งแอปพื้นฐานได้ด้วยตัวเอง

**✅ การตรวจสอบความสำเร็จ:**
```bash
# หลังจากทำบทที่ 1 เสร็จ คุณควรจะสามารถ:
azd version              # แสดงเวอร์ชันที่ติดตั้ง
azd init --template todo-nodejs-mongo  # เริ่มต้นโปรเจกต์
azd up                  # เผยแพร่ไปยัง Azure
azd show                # แสดง URL ของแอปที่กำลังใช้งาน
# แอปพลิเคชันเปิดในเบราว์เซอร์และทำงานได้
azd down --force --purge  # ทำความสะอาดทรัพยากร
```

**📊 ระยะเวลา:** 30-45 นาที  
**📈 ระดับทักษะหลังเรียน:** สามารถติดตั้งแอปพื้นฐานได้ด้วยตัวเอง

---

### 🤖 บทที่ 2: การพัฒนา AI-First (แนะนำสำหรับนักพัฒนา AI)
**ข้อกำหนดเบื้องต้น**: บทที่ 1 สำเร็จแล้ว  
**ระยะเวลา**: 1-2 ชั่วโมง  
**ระดับความยาก**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การรวม Microsoft Foundry กับ AZD
- การติดตั้งแอปที่ขับเคลื่อนด้วย AI
- เข้าใจการตั้งค่าบริการ AI

#### แหล่งเรียนรู้
- **🎯 เริ่มที่นี่**: [การรวม Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 ตัวแทน AI**: [คู่มือ AI Agents](docs/chapter-02-ai-development/agents.md) - ติดตั้งเอเจนต์อัจฉริยะด้วย AZD
- **📖 รูปแบบ**: [การติดตั้งโมเดล AI](docs/chapter-02-ai-development/ai-model-deployment.md) - ติดตั้งและจัดการโมเดล AI
- **🛠️ เวิร์กช็อป**: [เวิร์กช็อป AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำโซลูชัน AI ของคุณให้พร้อมใช้งานกับ AZD
- **🎥 คู่มือโต้ตอบ**: [วัสดุเวิร์กช็อป](workshop/README.md) - เรียนรู้แบบเบราว์เซอร์พร้อม DevContainer Environment
- **📋 เทมเพลต**: [เทมเพลต Microsoft Foundry](../..)
- **📝 ตัวอย่าง**: [ตัวอย่างการติดตั้ง AZD](examples/README.md)

#### แบบฝึกหัดปฏิบัติ
```bash
# ใช้แอปพลิเคชัน AI แรกของคุณ
azd init --template azure-search-openai-demo
azd up

# ลองใช้เทมเพลต AI เพิ่มเติม
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 ผลลัพธ์บทเรียน**: ติดตั้งและกำหนดค่าแอปแชทขับเคลื่อน AI ที่มีความสามารถ RAG

**✅ การตรวจสอบความสำเร็จ:**
```bash
# หลังจากบทที่ 2 คุณควรจะสามารถ:
azd init --template azure-search-openai-demo
azd up
# ทดสอบอินเทอร์เฟซการสนทนา AI
# ถามคำถามและรับคำตอบที่ใช้พลัง AI พร้อมแหล่งที่มา
# ตรวจสอบการทำงานของการรวมการค้นหา
azd monitor  # ตรวจสอบว่า Application Insights แสดงข้อมูลโทรเมทรี
azd down --force --purge
```

**📊 ระยะเวลา:** 1-2 ชั่วโมง  
**📈 ระดับทักษะหลังเรียน:** สามารถติดตั้งและกำหนดค่าแอป AI ที่พร้อมใช้งานในสภาพแวดล้อมผลิต  
**💰 การรับรู้ต้นทุน:** เข้าใจต้นทุนพัฒนา $80-150/เดือน, ต้นทุนผลิต $300-3500/เดือน

#### 💰 การพิจารณาต้นทุนสำหรับการติดตั้ง AI

**สภาพแวดล้อมการพัฒนา (ประมาณ $80-150/เดือน):**
- Azure OpenAI (ชำระตามการใช้งาน): $0-50/เดือน (ขึ้นอยู่กับการใช้โทเค็น)
- AI Search (ระดับพื้นฐาน): $75/เดือน
- Container Apps (แบบบริโภค): $0-20/เดือน
- Storage (มาตรฐาน): $1-5/เดือน

**สภาพแวดล้อมการผลิต (ประมาณ $300-3,500+/เดือน):**
- Azure OpenAI (PTU เพื่อประสิทธิภาพสม่ำเสมอ): $3,000+/เดือน หรือ ชำระตามการใช้งานสูง
- AI Search (ระดับมาตรฐาน): $250/เดือน
- Container Apps (เฉพาะ): $50-100/เดือน
- Application Insights: $5-50/เดือน
- Storage (พรีเมียม): $10-50/เดือน

**💡 เคล็ดลับการประหยัดต้นทุน:**
- ใช้ Azure OpenAI ระดับฟรีสำหรับการเรียนรู้ (รวมโทเค็น 50,000 ต่อเดือน)
- ใช้คำสั่ง `azd down` เพื่อลดการจัดสรรทรัพยากรเมื่อไม่พัฒนา
- เริ่มด้วยการคิดค่าบริการตามการใช้งาน อัปเกรดเป็น PTU ได้เฉพาะในผลิต
- ใช้ `azd provision --preview` เพื่อประเมินต้นทุนก่อนติดตั้ง
- เปิดใช้การปรับขนาดอัตโนมัติ: จ่ายเฉพาะการใช้งานจริง

**การตรวจสอบต้นทุน:**
```bash
# ตรวจสอบค่าประมาณรายเดือน
azd provision --preview

# ตรวจสอบค่าใช้จ่ายจริงในพอร์ทัล Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ บทที่ 3: การกำหนดค่าและการรับรองความถูกต้อง
**ข้อกำหนดเบื้องต้น**: บทที่ 1 สำเร็จแล้ว  
**ระยะเวลา**: 45-60 นาที  
**ระดับความยาก**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การกำหนดค่าและการจัดการสภาพแวดล้อม
- การรับรองความถูกต้องและแนวปฏิบัติด้านความปลอดภัย
- การตั้งชื่อและจัดระเบียบทรัพยากร

#### แหล่งเรียนรู้
- **📖 การกำหนดค่า**: [คู่มือการตั้งค่า](docs/chapter-03-configuration/configuration.md) - การตั้งค่าสภาพแวดล้อม
- **🔐 ความปลอดภัย**: [รูปแบบการรับรองและตัวตนที่จัดการ](docs/chapter-03-configuration/authsecurity.md) - รูปแบบการรับรองความถูกต้อง
- **📝 ตัวอย่าง**: [ตัวอย่างแอปฐานข้อมูล](examples/database-app/README.md) - ตัวอย่างฐานข้อมูล AZD

#### แบบฝึกหัดปฏิบัติ
- กำหนดค่าสภาพแวดล้อมหลายแบบ (dev, staging, prod)
- ตั้งค่าการรับรองความถูกต้องด้วย managed identity
- ใช้การกำหนดค่าเฉพาะสภาพแวดล้อม

**💡 ผลลัพธ์บทเรียน**: จัดการหลายสภาพแวดล้อมด้วยการรับรองความถูกต้องและความปลอดภัยที่เหมาะสม

---

### 🏗️ บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ดและการติดตั้ง
**ข้อกำหนดเบื้องต้น**: บทที่ 1-3 สำเร็จแล้ว  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ระดับความยาก**: ⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบการติดตั้งขั้นสูง
- โครงสร้างพื้นฐานเป็นโค้ดด้วย Bicep
- กลยุทธ์การจัดสรรทรัพยากร

#### แหล่งเรียนรู้
- **📖 การติดตั้ง**: [คู่มือการติดตั้ง](docs/chapter-04-infrastructure/deployment-guide.md) - กระบวนการครบวงจร
- **🏗️ การจัดสรร**: [การจัดสรรทรัพยากร](docs/chapter-04-infrastructure/provisioning.md) - การจัดการทรัพยากร Azure
- **📝 ตัวอย่าง**: [ตัวอย่าง Container App](../../examples/container-app) - การติดตั้งแบบคอนเทนเนอร์

#### แบบฝึกหัดปฏิบัติ
- สร้างเทมเพลต Bicep ตามต้องการ
- ติดตั้งแอปหลายบริการ
- ใช้กลยุทธ์ blue-green deployment

**💡 ผลลัพธ์บทเรียน**: ติดตั้งแอปหลายบริการที่ซับซ้อนโดยใช้เทมเพลตโครงสร้างพื้นฐานที่ปรับแต่งได้

---

### 🎯 บทที่ 5: โซลูชัน AI ผู้ช่วยหลายตัว (ขั้นสูง)
**ข้อกำหนดเบื้องต้น**: บทที่ 1-2 สำเร็จแล้ว  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ระดับความยาก**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบสถาปัตยกรรมผู้ช่วยหลายตัว
- การประสานและการควบคุมผู้ช่วย
- การติดตั้ง AI ที่พร้อมใช้งานในผลิต

#### แหล่งเรียนรู้
- **🤖 โปรเจกต์เด่น**: [โซลูชันผู้ช่วยหลายตัวค้าปลีก](examples/retail-scenario.md) - การใช้งานครบถ้วน
- **🛠️ เทมเพลต ARM**: [แพ็กเกจเทมเพลต ARM](../../examples/retail-multiagent-arm-template) - การติดตั้งคลิกเดียว
- **📖 สถาปัตยกรรม**: [รูปแบบประสานงานผู้ช่วยหลายตัว](docs/chapter-06-pre-deployment/coordination-patterns.md) - รูปแบบ

#### แบบฝึกหัดปฏิบัติ
```bash
# ปรับใช้โซลูชันตัวแทนหลายคนสำหรับค้าปลีกอย่างสมบูรณ์
cd examples/retail-multiagent-arm-template
./deploy.sh

# สำรวจการกำหนดค่าตัวแทน
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ผลลัพธ์บทเรียน**: ติดตั้งและจัดการโซลูชัน AI ผู้ช่วยหลายตัวที่พร้อมผลิตพร้อมเอเจนต์ลูกค้าและสินค้าคงคลัง

---

### 🔍 บทที่ 6: การตรวจสอบและวางแผนก่อนติดตั้ง
**ข้อกำหนดเบื้องต้น**: บทที่ 4 สำเร็จแล้ว  
**ระยะเวลา**: 1 ชั่วโมง  
**ระดับความยาก**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การวางแผนความจุและการตรวจสอบทรัพยากร
- กลยุทธ์การเลือก SKU
- การตรวจสอบก่อนบินและระบบอัตโนมัติ

#### แหล่งเรียนรู้
- **📊 การวางแผน**: [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) - การตรวจสอบทรัพยากร
- **💰 การเลือก**: [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) - ตัวเลือกที่คุ้มค่า
- **✅ การตรวจสอบ**: [ตรวจสอบก่อนบิน](docs/chapter-06-pre-deployment/preflight-checks.md) - สคริปต์อัตโนมัติ

#### แบบฝึกหัดปฏิบัติ
- รันสคริปต์ตรวจสอบความจุ
- ปรับปรุงการเลือก SKU ให้เหมาะสมกับต้นทุน
- ติดตั้งการตรวจสอบก่อนติดตั้งแบบอัตโนมัติ

**💡 ผลลัพธ์บทเรียน**: ตรวจสอบและปรับแต่งการติดตั้งก่อนดำเนินการ

---

### 🚨 บทที่ 7: การแก้ไขข้อขัดข้องและดีบัก
**ข้อกำหนดเบื้องต้น**: สำเร็จบทเรียนการติดตั้งใดก็ได้  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ระดับความยาก**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- วิธีการดีบักอย่างเป็นระบบ
- ปัญหาทั่วไปและวิธีแก้ไข
- การแก้ไขปัญหาเฉพาะ AI

#### แหล่งเรียนรู้
- **🔧 ปัญหาทั่วไป**: [ปัญหาทั่วไป](docs/chapter-07-troubleshooting/common-issues.md) - คำถามที่พบบ่อยและวิธีแก้
- **🕵️ การดีบัก**: [คู่มือดีบัก](docs/chapter-07-troubleshooting/debugging.md) - กลยุทธ์ทีละขั้นตอน
- **🤖 ปัญหา AI**: [แก้ไขปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - ปัญหาบริการ AI

#### แบบฝึกหัดปฏิบัติ
- วินิจฉัยข้อผิดพลาดการติดตั้ง
- แก้ไขปัญหาการรับรองความถูกต้อง
- ดีบักการเชื่อมต่อบริการ AI

**💡 ผลลัพธ์บทเรียน**: วินิจฉัยและแก้ไขปัญหาในการติดตั้งทั่วไปได้อย่างอิสระ

---

### 🏢 บทที่ 8: การผลิตและรูปแบบองค์กร
**ข้อกำหนดเบื้องต้น**: บทที่ 1-4 สำเร็จแล้ว  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ระดับความยาก**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- กลยุทธ์การติดตั้งในสภาพแวดล้อมการผลิต
- รูปแบบความปลอดภัยสำหรับองค์กร
- การตรวจสอบและการเพิ่มประสิทธิภาพต้นทุน

#### แหล่งเรียนรู้
- **🏭 การผลิต**: [แนวปฏิบัติ AI ในการผลิต](docs/chapter-08-production/production-ai-practices.md) - รูปแบบองค์กร
- **📝 ตัวอย่าง**: [ตัวอย่างไมโครเซอร์วิส](../../examples/microservices) - สถาปัตยกรรมซับซ้อน
- **📊 การตรวจสอบ**: [การรวม Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - การตรวจสอบ

#### แบบฝึกหัดปฏิบัติ
- ติดตั้งรูปแบบความปลอดภัยแบบองค์กร
- ตั้งค่าการตรวจสอบอย่างครบถ้วน
- ติดตั้งในสภาพแวดล้อมการผลิตพร้อมการกำกับดูแล

**💡 ผลลัพธ์บทเรียน**: ติดตั้งแอปพร้อมใช้สำหรับองค์กรด้วยความสามารถในการผลิตเต็มรูปแบบ

---

## 🎓 ภาพรวมเวิร์กช็อป: ประสบการณ์การเรียนรู้แบบปฏิบัติ

> **⚠️ สถานะเวิร์กช็อป: กำลังพัฒนา**  
> วัสดุเวิร์กช็อปอยู่ระหว่างการพัฒนาและปรับปรุง โมดูลหลักใช้งานได้ แต่บางส่วนของหัวข้อขั้นสูงยังไม่สมบูรณ์ เรากำลังเร่งดำเนินการให้ครบถ้วน [ติดตามความคืบหน้า →](workshop/README.md)

### วัสดุเวิร์กช็อปแบบโต้ตอบ
**เรียนรู้ครบถ้วนด้วยเครื่องมือบนเบราว์เซอร์และแบบฝึกหัดที่แนะนำ**
วัสดุการอบรมเชิงปฏิบัติการของเราให้ประสบการณ์การเรียนรู้แบบโครงสร้างและมีปฏิสัมพันธ์ที่เสริมเนื้อหาหลักสูตรตามบทต่าง ๆ ข้างต้น เวิร์กช็อปนี้ถูกออกแบบมาเพื่อการเรียนรู้ด้วยตนเองและแบบมีผู้สอน

#### 🛠️ คุณสมบัติของเวิร์กช็อป
- **อินเทอร์เฟซบนเบราว์เซอร์**: เวิร์กช็อปที่ขับเคลื่อนโดย MkDocs พร้อมฟีเจอร์ค้นหา คัดลอก และธีม
- **การผสานรวม GitHub Codespaces**: การตั้งค่าสภาพแวดล้อมสำหรับพัฒนาด้วยการคลิกครั้งเดียว
- **เส้นทางการเรียนรู้ที่มีโครงสร้าง**: แบบฝึกหัดที่มีคำแนะนำ 8 โมดูล (รวม 3-4 ชั่วโมง)
- **วิธีการตามลำดับขั้น**: แนะนำ → เลือก → ตรวจสอบ → แยกวิเคราะห์ → ตั้งค่า → ปรับแต่ง → รื้อถอน → สรุปภาพรวม
- **สภาพแวดล้อม DevContainer แบบโต้ตอบ**: เครื่องมือและการพึ่งพาที่ตั้งค่าไว้ล่วงหน้า

#### 📚 โครงสร้างโมดูลของเวิร์กช็อป
เวิร์กช็อปนี้ใช้ **วิธีการตามลำดับขั้น 8 โมดูล** ที่พาคุณจากการค้นพบสู่ความชำนาญในการปรับใช้:

| โมดูล | หัวข้อ | สิ่งที่คุณจะทำ | ระยะเวลา |
|--------|-------|----------------|----------|
| **0. แนะนำ** | ภาพรวมเวิร์กช็อป | ทำความเข้าใจวัตถุประสงค์การเรียนรู้ เงื่อนไขเบื้องต้น และโครงสร้างเวิร์กช็อป | 15 นาที |
| **1. เลือก** | ค้นหาเทมเพลต | สำรวจเทมเพลต AZD และเลือกเทมเพลต AI ที่เหมาะกับสถานการณ์ของคุณ | 20 นาที |
| **2. ตรวจสอบ** | ปรับใช้และตรวจสอบ | ปรับใช้เทมเพลตด้วย `azd up` และตรวจสอบว่าโครงสร้างพื้นฐานทำงานได้ | 30 นาที |
| **3. แยกวิเคราะห์** | เข้าใจโครงสร้าง | ใช้ GitHub Copilot สำรวจสถาปัตยกรรมเทมเพลต ไฟล์ Bicep และการจัดการโค้ด | 30 นาที |
| **4. ตั้งค่า** | เจาะลึก azure.yaml | เชี่ยวชาญการตั้งค่า `azure.yaml` ฮุกวงจรชีวิต และตัวแปรสภาพแวดล้อม | 30 นาที |
| **5. ปรับแต่ง** | ทำให้เป็นของคุณ | เปิดใช้งาน AI Search, การตรวจสอบ, การประเมินผล และปรับแต่งตามสถานการณ์ | 45 นาที |
| **6. รื้อถอน** | ทำความสะอาด | ถอนทรัพยากรอย่างปลอดภัยด้วย `azd down --purge` | 15 นาที |
| **7. สรุป** | ขั้นตอนถัดไป | ทบทวนความสำเร็จ แนวคิดสำคัญ และดำเนินการเรียนต่อ | 15 นาที |

**ลำดับเวิร์กช็อป:**
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
# คลิก "Code" → "Create codespace on main" ใน repository

# ตัวเลือกที่ 2: การพัฒนาแบบ Local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ทำตามคำแนะนำการตั้งค่าใน workshop/README.md
```

#### 🎯 ผลลัพธ์การเรียนรู้ของเวิร์กช็อป
เมื่อสำเร็จเวิร์กช็อป ผู้เข้าร่วมจะสามารถ:
- **ปรับใช้แอปพลิเคชัน AI สำหรับการผลิต**: ใช้ AZD กับบริการ Microsoft Foundry
- **เชี่ยวชาญสถาปัตยกรรมหลายตัวแทน**: นำเสนอวิธีแก้ไขปัญหาเอไอแบบประสานงานกัน
- **ดำเนินการแนวปฏิบัติด้านความปลอดภัยที่ดีที่สุด**: ตั้งค่าการรับรองความถูกต้องและการควบคุมการเข้าถึง
- **เพิ่มประสิทธิภาพเพื่อการขยายตัว**: ออกแบบการปรับใช้ที่คุ้มค่าและมีประสิทธิภาพ
- **แก้ไขปัญหาการปรับใช้**: แก้ไขปัญหาทั่วไปได้ด้วยตนเอง

#### 📖 ทรัพยากรเวิร์กช็อป
- **🎥 คู่มือแบบโต้ตอบ**: [Workshop Materials](workshop/README.md) - สภาพแวดล้อมการเรียนรู้บนเบราว์เซอร์
- **📋 คำแนะนำทีละโมดูล**:
  - [0. แนะนำ](workshop/docs/instructions/0-Introduction.md) - ภาพรวมและวัตถุประสงค์เวิร์กช็อป
  - [1. เลือก](workshop/docs/instructions/1-Select-AI-Template.md) - หาคัดเลือกเทมเพลต AI
  - [2. ตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) - ปรับใช้และตรวจสอบเทมเพลต
  - [3. แยกวิเคราะห์](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - สำรวจสถาปัตยกรรมเทมเพลต
  - [4. ตั้งค่า](workshop/docs/instructions/4-Configure-AI-Template.md) - เชี่ยวชาญ azure.yaml
  - [5. ปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) - ปรับแต่งตามสถานการณ์
  - [6. รื้อถอน](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ทำความสะอาดทรัพยากร
  - [7. สรุป](workshop/docs/instructions/7-Wrap-up.md) - ทบทวนและขั้นตอนถัดไป
- **🛠️ ห้องปฏิบัติการเวิร์กช็อป AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - แบบฝึกหัดที่มุ่งเน้น AI
- **💡 เริ่มต้นอย่างรวดเร็ว**: [Workshop Setup Guide](workshop/README.md#quick-start) - การตั้งค่าสภาพแวดล้อม

**เหมาะสำหรับ**: การฝึกอบรมองค์กร หลักสูตรมหาวิทยาลัย การเรียนรู้ด้วยตนเอง และบูทแคมป์สำหรับนักพัฒนา

---

## 📖 เจาะลึก: ความสามารถของ AZD

นอกจากพื้นฐานแล้ว AZD ยังมอบฟีเจอร์ทรงพลังสำหรับการปรับใช้ในสภาพแวดล้อมจริง:

- **การปรับใช้ด้วยเทมเพลต** - ใช้เทมเพลตที่สร้างไว้ล่วงหน้าสำหรับรูปแบบแอปพลิเคชันทั่วไป
- **โครงสร้างพื้นฐานเป็นโค้ด** - จัดการทรัพยากร Azure ด้วย Bicep หรือ Terraform  
- **เวิร์กโฟลว์แบบผสานรวม** - จัดเตรียม ปรับใช้ และตรวจสอบแอปพลิเคชันอย่างราบรื่น
- **เหมาะกับนักพัฒนา** - ปรับแต่งเพื่อเพิ่มผลิตภาพและประสบการณ์นักพัฒนา

### **AZD + Microsoft Foundry: เหมาะสำหรับการปรับใช้ AI**

**ทำไมต้องใช้ AZD สำหรับโซลูชัน AI?** AZD แก้ปัญหาหลักที่นักพัฒนา AI ต้องเผชิญ:

- **เทมเพลตพร้อมใช้งานสำหรับ AI** - เทมเพลตที่ตั้งค่าสำหรับ Azure OpenAI, Cognitive Services และงาน ML
- **ระบบรักษาความปลอดภัยบนการปรับใช้ AI** - รูปแบบความปลอดภัยในตัวสำหรับบริการ AI คีย์ API และจุดเชื่อมต่อโมเดล  
- **รูปแบบ AI สำหรับผลิตจริง** - แนวปฏิบัติที่ดีที่สุดสำหรับการปรับใช้แอป AI ที่ขยายตัวได้และประหยัดต้นทุน
- **เวิร์กโฟลว์ AI ครบวงจร** - ตั้งแต่การพัฒนาโมเดลถึงการปรับใช้จริงพร้อมการตรวจสอบอย่างเหมาะสม
- **เพิ่มประสิทธิภาพค่าใช้จ่าย** - การจัดสรรและปรับขนาดทรัพยากรอย่างชาญฉลาดสำหรับงาน AI
- **การผสานรวม Microsoft Foundry** - การเชื่อมต่อกับแคตตาล็อกโมเดลและจุดเชื่อมต่อ Microsoft Foundry อย่างไร้รอยต่อ

---

## 🎯 ห้องสมุดเทมเพลตและตัวอย่าง

### เทมเพลตเด่น: Microsoft Foundry
**เริ่มที่นี่หากคุณกำลังปรับใช้แอป AI!**

> **หมายเหตุ:** เทมเพลตเหล่านี้แสดงรูปแบบ AI หลากหลาย บางอันเป็น Azure Samples ภายนอก บางอันเป็นงานในที่เก็บนี้

| เทมเพลต | บท | ความยาก | บริการ | ประเภท |
|----------|---------|------------|----------|------|
| [**เริ่มต้นกับ AI แชท**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บท 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ภายนอก |
| [**เริ่มต้นกับตัวแทน AI**](https://github.com/Azure-Samples/get-started-with-ai-agents) | บท 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ภายนอก |
| [**สาธิต Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | บท 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ภายนอก |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บท 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ภายนอก |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บท 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ภายนอก |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | บท 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ภายนอก |
| [**โซลูชันค้าปลีก Multi-Agent**](examples/retail-scenario.md) | บท 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ในที่เก็บนี้** |

### เทมเพลตเด่น: สถานการณ์เรียนรู้ครบถ้วน
**เทมเพลตแอปที่พร้อมสำหรับผลิตจริง แมปกับบทเรียน**

| เทมเพลต | บทเรียน | ความยาก | การเรียนรู้หลัก |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บท 2 | ⭐ | รูปแบบการปรับใช้ AI พื้นฐาน |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | บท 2 | ⭐⭐ | การใช้งาน RAG กับ Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | บท 4 | ⭐⭐ | การรวมระบบ Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บท 5 | ⭐⭐⭐ | เฟรมเวิร์กตัวแทนและการเรียกฟังก์ชัน |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | บท 8 | ⭐⭐⭐ | การจัดการ AI ในระดับองค์กร |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | บท 5 | ⭐⭐⭐⭐ | สถาปัตยกรรมหลายตัวแทนกับตัวแทนลูกค้าและสินค้าคงคลัง |

### เรียนรู้จากประเภทตัวอย่าง

> **📌 ตัวอย่างภายใน vs ภายนอก:**  
> **ตัวอย่างภายใน** (ในที่เก็บนี้) = พร้อมใช้ทันที  
> **ตัวอย่างภายนอก** (Azure Samples) = โคลนจากที่เก็บที่ลิงก์ไว้

#### ตัวอย่างภายใน (พร้อมใช้)
- [**โซลูชันค้าปลีก Multi-Agent**](examples/retail-scenario.md) - การใช้งานจริงครบถ้วนด้วย ARM templates
  - สถาปัตยกรรมหลายตัวแทน (ลูกค้า + สินค้าคงคลัง)
  - การตรวจสอบและประเมินผลครบวงจร
  - ปรับใช้ด้วยการคลิกครั้งเดียวผ่าน ARM template

#### ตัวอย่างภายใน - แอปพลิเคชันคอนเทนเนอร์ (บท 2-5)
**ตัวอย่างการปรับใช้คอนเทนเนอร์ครบวงจรในที่เก็บนี้:**
- [**ตัวอย่าง Container App**](examples/container-app/README.md) - คู่มือครบสำหรับปรับใช้คอนเทนเนอร์
  - [Flask API แบบเรียบง่าย](../../examples/container-app/simple-flask-api) - REST API พื้นฐานพร้อมสเกลเป็นศูนย์
  - [สถาปัตยกรรมไมโครเซอร์วิส](../../examples/container-app/microservices) - ปรับใช้หลายบริการสำหรับผลิตจริง
  - รูปแบบการเริ่มต้นอย่างรวดเร็ว การผลิต และขั้นสูง
  - คำแนะนำเรื่องการตรวจสอบ ความปลอดภัย และเพิ่มประสิทธิภาพค่าใช้จ่าย

#### ตัวอย่างภายนอก - แอปพลิเคชันง่าย (บท 1-2)
**โคลนที่เก็บ Azure Samples เหล่านี้เพื่อนำไปใช้:**
- [เว็บแอปง่าย ๆ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - รูปแบบการปรับใช้พื้นฐาน
- [เว็บไซต์สแตติก - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - การปรับใช้เนื้อหาสแตติก
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - การปรับใช้ REST API

#### ตัวอย่างภายนอก - การรวมฐานข้อมูล (บท 3-4)  
- [แอปฐานข้อมูล - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - รูปแบบการเชื่อมต่อฐานข้อมูล
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - เวิร์กโฟลว์ข้อมูลแบบเซิร์ฟเวอร์เลส

#### ตัวอย่างภายนอก - รูปแบบขั้นสูง (บท 4-8)
- [ไมโครเซอร์วิส Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - สถาปัตยกรรมหลายบริการ
- [งาน Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - กระบวนการประมวลผลพื้นหลัง  
- [สายงาน ML สำหรับองค์กร](https://github.com/Azure-Samples/mlops-v2) - รูปแบบ ML สำหรับผลิตจริง

### คอลเลกชันเทมเพลตภายนอก
- [**คลังเทมเพลต AZD อย่างเป็นทางการ**](https://azure.github.io/awesome-azd/) - รวมเทมเพลตอย่างเป็นทางการและจากชุมชน
- [**เทมเพลต Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - เอกสารเทมเพลตจาก Microsoft Learn
- [**ไดเรกทอรีตัวอย่าง**](examples/README.md) - ตัวอย่างเรียนรู้ภายในที่มีคำอธิบายรายละเอียด

---

## 📚 ทรัพยากรการเรียนรู้และการอ้างอิง

### เอกสารอ้างอิงด่วน
- [**ชีตคำสั่ง**](resources/cheat-sheet.md) - คำสั่ง azd สำคัญจัดตามบทเรียน
- [**พจนานุกรมคำศัพท์**](resources/glossary.md) - คำศัพท์ Azure และ azd  
- [**คำถามที่พบบ่อย (FAQ)**](resources/faq.md) - คำถามยอดนิยมจัดตามบทเรียน
- [**คู่มือการศึกษา**](resources/study-guide.md) - แบบฝึกหัดฝึกปฏิบัติครบถ้วน

### เวิร์กช็อปแบบปฏิบัติ
- [**ห้องปฏิบัติการเวิร์กช็อป AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำให้โซลูชัน AI ของคุณพร้อมปรับใช้ด้วย AZD (2-3 ชั่วโมง)
- [**เวิร์กช็อปแบบโต้ตอบ**](workshop/README.md) - แบบฝึกหัด 8 โมดูลพร้อม MkDocs และ GitHub Codespaces
  - ตามลำดับ: แนะนำ → เลือก → ตรวจสอบ → แยกวิเคราะห์ → ตั้งค่า → ปรับแต่ง → รื้อถอน → สรุป

### ทรัพยากรการเรียนรู้ภายนอก
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [เครื่องคิดเลขราคาของ Azure](https://azure.microsoft.com/pricing/calculator/)
- [สถานะ Azure](https://status.azure.com/)

---

## 🔧 คู่มือแก้ไขปัญหาอย่างรวดเร็ว

**ปัญหาทั่วไปที่ผู้เริ่มต้นมักเจอและวิธีแก้ไขทันที:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# ติดตั้ง AZD ก่อน
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ยืนยันการติดตั้ง
azd version
```
</details>

<details>
<summary><strong>❌ "ไม่พบการสมัครสมาชิก" หรือ "ไม่ได้ตั้งค่าการสมัครสมาชิก"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" หรือ "Quota exceeded"</strong></summary>

```bash
# ลองใช้ภูมิภาค Azure ที่แตกต่างกัน
azd env set AZURE_LOCATION "westus2"
azd up

# หรือใช้ SKU ที่เล็กลงในระหว่างการพัฒนา
# แก้ไข infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ล้มเหลวกึ่งทาง</strong></summary>
```bash
# ตัวเลือก 1: ทำความสะอาดและลองใหม่
azd down --force --purge
azd up

# ตัวเลือก 2: แก้ไขโครงสร้างพื้นฐานเท่านั้น
azd provision

# ตัวเลือก 3: ตรวจสอบสถานะโดยละเอียด
azd show

# ตัวเลือก 4: ตรวจสอบบันทึกใน Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "การตรวจสอบสิทธิ์ล้มเหลว" หรือ "โทเค็นหมดอายุ"</strong></summary>

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
<summary><strong>❌ "ทรัพยากรมีอยู่แล้ว" หรือความขัดแย้งของชื่อ</strong></summary>

```bash
# AZD สร้างชื่อที่ไม่ซ้ำกัน แต่ถ้ามีความขัดแย้ง:
azd down --force --purge

# จากนั้นลองใหม่ด้วยสภาพแวดล้อมใหม่
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ การปรับใช้เทมเพลตใช้เวลานานเกินไป</strong></summary>

**เวลารอปกติ:**
- เว็บแอปง่าย ๆ: 5-10 นาที
- แอปที่มีฐานข้อมูล: 10-15 นาที
- แอป AI: 15-25 นาที (การจัดเตรียม OpenAI ช้า)

```bash
# ตรวจสอบความคืบหน้า
azd show

# หากติดขัดเกิน 30 นาที ให้ตรวจสอบ Azure Portal:
azd monitor
# มองหาการปรับใช้ที่ล้มเหลว
```
</details>

<details>
<summary><strong>❌ "การอนุญาตถูกปฏิเสธ" หรือ "ถูกห้าม"</strong></summary>

```bash
# ตรวจสอบบทบาท Azure ของคุณ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# คุณจำเป็นต้องมีบทบาท "ผู้ร่วมพัฒนา" อย่างน้อย
# ขอให้ผู้ดูแลระบบ Azure ของคุณให้สิทธิ์:
# - ผู้ร่วมพัฒนา (สำหรับทรัพยากร)
# - ผู้ดูแลการเข้าถึงผู้ใช้ (สำหรับการมอบหมายบทบาท)
```
</details>

<details>
<summary><strong>❌ ไม่พบ URL ของแอปพลิเคชันที่ปรับใช้แล้ว</strong></summary>

```bash
# แสดงจุดเชื่อมต่อบริการทั้งหมด
azd show

# หรือเปิด Azure Portal
azd monitor

# ตรวจสอบบริการเฉพาะ
azd env get-values
# ค้นหาตัวแปร *_URL
```
</details>

### 📚 แหล่งข้อมูลแก้ไขปัญหาแบบเต็ม

- **คู่มือปัญหาทั่วไป:** [วิธีแก้ไขโดยละเอียด](docs/chapter-07-troubleshooting/common-issues.md)
- **ปัญหาเฉพาะ AI:** [แก้ไขปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **คู่มือดีบัก:** [การดีบักทีละขั้นตอน](docs/chapter-07-troubleshooting/debugging.md)
- **ขอความช่วยเหลือ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 การสำเร็จหลักสูตรและใบรับรอง

### การติดตามความก้าวหน้า
ติดตามความก้าวหน้าการเรียนรู้ของคุณในแต่ละบท:

- [ ] **บทที่ 1**: พื้นฐาน & เริ่มต้นด่วน ✅
- [ ] **บทที่ 2**: การพัฒนา AI-First ✅  
- [ ] **บทที่ 3**: การกำหนดค่า & การตรวจสอบสิทธิ์ ✅
- [ ] **บทที่ 4**: โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้ ✅
- [ ] **บทที่ 5**: โซลูชั่น AI หลายตัวแทน ✅
- [ ] **บทที่ 6**: การตรวจสอบล่วงหน้า & การวางแผน ✅
- [ ] **บทที่ 7**: การแก้ไขปัญหา & การดีบัก ✅
- [ ] **บทที่ 8**: รูปแบบการผลิต & องค์กร ✅

### การตรวจสอบความรู้
หลังจากทำแต่ละบทเสร็จ ให้ตรวจสอบความรู้ของคุณโดย:
1. **ฝึกปฏิบัติ:** ทำการปรับใช้ที่ลงมือทำในบทนั้นให้เสร็จ
2. **ตรวจสอบความรู้:** ทบทวนส่วนคำถามที่พบบ่อยของบท
3. **อภิปรายชุมชน:** แชร์ประสบการณ์ของคุณใน Azure Discord
4. **บทถัดไป:** ไปยังระดับความซับซ้อนถัดไป

### ประโยชน์จากการสำเร็จหลักสูตร
เมื่อสำเร็จครบทุกบทคุณจะได้รับ:
- **ประสบการณ์การผลิต:** ปรับใช้แอป AI จริงใน Azure
- **ทักษะมืออาชีพ:** ความสามารถในการปรับใช้ระดับองค์กร  
- **การยอมรับในชุมชน:** สมาชิกที่มีบทบาทในชุมชนนักพัฒนา Azure
- **ความก้าวหน้าทางอาชีพ:** ความเชี่ยวชาญ AZD และการปรับใช้ AI ที่ต้องการ

---

## 🤝 ชุมชนและการสนับสนุน

### ขอความช่วยเหลือ & สนับสนุน
- **ปัญหาทางเทคนิค:** [รายงานบั๊กและขอฟีเจอร์](https://github.com/microsoft/azd-for-beginners/issues)
- **คำถามการเรียนรู้:** [ชุมชน Microsoft Azure Discord](https://discord.gg/microsoft-azure) และ [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ความช่วยเหลือเฉพาะ AI:** เข้าร่วม [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **เอกสาร:** [เอกสาร Azure Developer CLI อย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### ข้อมูลเชิงลึกของชุมชนจาก Microsoft Foundry Discord

**ผลสำรวจล่าสุดจากช่อง #Azure:**
- **45%** ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI
- **ความท้าทายสูงสุด:** การปรับใช้หลายบริการ, การจัดการข้อมูลรับรอง, พร้อมสำหรับการผลิต  
- **สิ่งที่ร้องขอมากที่สุด:** เทมเพลตเฉพาะ AI, คู่มือแก้ไขปัญหา, แนวทางปฏิบัติที่ดีที่สุด

**เข้าร่วมชุมชนของเราเพื่อ:**
- แชร์ประสบการณ์ AZD + AI และรับความช่วยเหลือ
- เข้าถึงตัวอย่างใหม่ของเทมเพลต AI
- มีส่วนร่วมในแนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ AI
- มีอิทธิพลต่อการพัฒนาฟีเจอร์ AI + AZD ในอนาคต

### การมีส่วนร่วมในหลักสูตร
เรายินดีรับการมีส่วนร่วม! โปรดอ่าน [คู่มือการมีส่วนร่วม](CONTRIBUTING.md) สำหรับรายละเอียดเกี่ยวกับ:
- **การปรับปรุงเนื้อหา:** พัฒนาบทเรียนและตัวอย่างที่มีอยู่
- **ตัวอย่างใหม่:** เพิ่มสถานการณ์จริงและเทมเพลต  
- **การแปล:** ช่วยดูแลการสนับสนุนหลายภาษา
- **รายงานบั๊ก:** ปรับปรุงความถูกต้องและความชัดเจน
- **มาตรฐานชุมชน:** ปฏิบัติตามแนวทางชุมชนที่ครอบคลุม

---

## 📄 ข้อมูลหลักสูตร

### ใบอนุญาต
โปรเจกต์นี้ได้รับอนุญาตภายใต้ MIT License - ดูไฟล์ [LICENSE](../../LICENSE) สำหรับรายละเอียด

### แหล่งเรียนรู้ Microsoft ที่เกี่ยวข้อง

ทีมของเราผลิตหลักสูตรการเรียนรู้อื่น ๆ ที่ครอบคลุม:

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

## 🗺️ การนำทางหลักสูตร

**🚀 พร้อมเริ่มต้นเรียนรู้หรือยัง?**

**สำหรับผู้เริ่มต้น:** เริ่มต้นที่ [บทที่ 1: พื้นฐาน & เริ่มต้นด่วน](../..)  

**ผู้พัฒนา AI**: ข้ามไปที่ [บทที่ 2: การพัฒนาแบบ AI-First](../..)  
**ผู้พัฒนาที่มีประสบการณ์**: เริ่มต้นที่ [บทที่ 3: การกำหนดค่า & การรับรองความถูกต้อง](../..)

**ขั้นตอนถัดไป**: [เริ่มบทที่ 1 - พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความถูกต้องสูงสุด โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่แม่นยำ เอกสารต้นฉบับในภาษาต้นทางควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ การแปลโดยมนุษย์มืออาชีพเป็นสิ่งที่แนะนำ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือตีความผิดพลาดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->