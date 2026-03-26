# AZD สำหรับผู้เริ่มต้น: การเดินทางเรียนรู้ที่มีโครงสร้าง

![AZD-for-beginners](../../translated_images/th/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### การแปลอัตโนมัติ (อัปเดตอยู่เสมอ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](./README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ต้องการโคลนแบบโลคัล?**
>
> รีโพซิทอรีนี้มีการแปลเกิน 50 ภาษา ซึ่งจะเพิ่มขนาดการดาวน์โหลดอย่างมาก หากต้องการโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
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
> วิธีนี้จะมอบทุกอย่างที่คุณต้องการเพื่อทำคอร์สให้เสร็จด้วยความเร็วดาวน์โหลดที่รวดเร็วกว่า
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 อัปเดตล่าสุดใน azd วันนี้

Azure Developer CLI ได้เติบโตเกินกว่าการใช้งานเว็บแอปและ API แบบดั้งเดิม วันนี้ azd คือเครื่องมือเดียวสำหรับการปรับใช้ **แอปพลิเคชันใดๆ** บน Azure — รวมถึงแอป AI และเอเจนต์อัจฉริยะ

นี่คือสิ่งที่หมายความสำหรับคุณ:

- **เอเจนต์ AI ตอนนี้เป็นภาระงานระดับแรกของ azd แล้ว** คุณสามารถเริ่มต้น ปรับใช้ และจัดการโปรเจกต์เอเจนต์ AI ด้วยโฟลว์ `azd init` → `azd up` ที่คุณคุ้นเคย
- **การรวม Microsoft Foundry** ช่วยให้นำการปรับใช้โมเดล, การโฮสต์เอเจนต์, และการตั้งค่าบริการ AI เข้าไปในระบบเทมเพลตของ azd โดยตรง
- **โฟลว์หลักยังคงเหมือนเดิม** ไม่ว่าคุณจะปรับใช้แอป todo, ไมโครเซอร์วิส, หรือโซลูชัน AI แบบหลายเอเจนต์ คำสั่งก็เหมือนกัน

ถ้าคุณเคยใช้ azd มาก่อน การรองรับ AI คือการขยายที่เป็นธรรมชาติ — ไม่ใช่เครื่องมือแยกหรือเส้นทางขั้นสูง ถ้าคุณเริ่มต้นใหม่ คุณจะได้เรียนรู้โฟลว์เดียวที่ใช้ได้กับทุกอย่าง

---

## 🚀 Azure Developer CLI (azd) คืออะไร?

**Azure Developer CLI (azd)** เป็นเครื่องมือคอมมานด์ไลน์ที่เป็นมิตรกับนักพัฒนา ทำให้การปรับใช้แอปพลิเคชันบน Azure ง่ายขึ้น แทนที่จะต้องสร้างและเชื่อมต่อบริการ Azure หลายๆ ตัวด้วยตนเอง คุณสามารถปรับใช้แอปพลิเคชันทั้งหมดด้วยคำสั่งเดียว

### เวทมนตร์ของ `azd up`

```bash
# คำสั่งเดียวนี้ทำทุกอย่าง:
# ✅ สร้างทรัพยากร Azure ทั้งหมด
# ✅ กำหนดค่าการเชื่อมต่อเครือข่ายและความปลอดภัย
# ✅ สร้างโค้ดแอปพลิเคชันของคุณ
# ✅ ปรับใช้ไปยัง Azure
# ✅ ให้ URL ที่ใช้งานได้
azd up
```

**แค่นี้แหละ!** ไม่ต้องคลิกใน Azure Portal, ไม่ต้องเรียนรู้ ARM เทมเพลตที่ซับซ้อนก่อน, ไม่ต้องตั้งค่าด้วยมือ — เพียงแค่แอปที่ใช้งานได้บน Azure

---

## ❓ Azure Developer CLI vs Azure CLI: ต่างกันอย่างไร?

นี่คือคำถามที่พบบ่อยที่สุดสำหรับผู้เริ่มต้น คำตอบง่ายๆ มีดังนี้:

| คุณสมบัติ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **วัตถุประสงค์** | จัดการทรัพยากร Azure แต่ละตัว | ปรับใช้แอปพลิเคชันครบชุด |
| **แนวคิด** | เน้นโครงสร้างพื้นฐาน | เน้นแอปพลิเคชัน |
| **ตัวอย่าง** | `az webapp create --name myapp...` | `azd up` |
| **การเรียนรู้** | ต้องรู้บริการ Azure | แค่รู้จักแอปของคุณ |
| **เหมาะสำหรับ** | DevOps, โครงสร้างพื้นฐาน | นักพัฒนา, การทำต้นแบบ |

### อุปมาอุปไมยง่ายๆ

- **Azure CLI** เหมือนกับการมีเครื่องมือทั้งหมดในการสร้างบ้าน — ค้อน, เลื่อย, ตะปู คุณสามารถสร้างได้ทุกอย่าง แต่ต้องรู้การก่อสร้าง
- **Azure Developer CLI** เหมือนการจ้างผู้รับเหมา — คุณบอกสิ่งที่ต้องการ แล้วเขาจะจัดการก่อสร้างให้

### เมื่อไหร่ควรใช้ตัวไหน

| สถานการณ์ | ใช้อันนี้ |
|----------|----------|
| "อยากปรับใช้เว็บแอปอย่างรวดเร็ว" | `azd up` |
| "ต้องการสร้างบัญชีเก็บข้อมูลเพียงอย่างเดียว" | `az storage account create` |
| "กำลังสร้างแอป AI แบบเต็มรูปแบบ" | `azd init --template azure-search-openai-demo` |
| "ต้องการดีบักทรัพยากร Azure เจาะจง" | `az resource show` |
| "ต้องการปรับใช้ที่พร้อมสำหรับโปรดักชันในไม่กี่นาที" | `azd up --environment production` |

### ทั้งสองทำงานร่วมกันได้!

AZD ใช้ Azure CLI ทำงานเบื้องหลัง คุณสามารถใช้ทั้งสองได้:
```bash
# ปรับใช้แอปของคุณด้วย AZD
azd up

# จากนั้นปรับแต่งทรัพยากรเฉพาะด้วย Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ค้นหาเทมเพลตใน Awesome AZD

อย่าเริ่มจากศูนย์! **Awesome AZD** คือคอลเลกชันเทมเพลตพร้อมปรับใช้จากชุมชน:

| ทรัพยากร | คำอธิบาย |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | เรียกดูเทมเพลตกว่า 200 รายการที่ปรับใช้ได้ด้วยคลิกเดียว |
| 🔗 [**ส่งเทมเพลต**](https://github.com/Azure/awesome-azd/issues) | ร่วมส่งเทมเพลตของคุณสู่ชุมชน |
| 🔗 [**ที่เก็บบน GitHub**](https://github.com/Azure/awesome-azd) | ให้ดาวและสำรวจซอร์สโค้ด |

### เทมเพลต AI ยอดนิยมจาก Awesome AZD

```bash
# แชท RAG กับโมเดล Microsoft Foundry + การค้นหา AI
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

### ขั้นตอนที่ 2: เข้าสู่ระบบ Azure

```bash
azd auth login
```

### ขั้นตอนที่ 3: ปรับใช้แอปของคุณครั้งแรก

```bash
# เริ่มต้นจากแม่แบบ
azd init --template todo-nodejs-mongo

# ปรับใช้ไปยัง Azure (สร้างทุกอย่าง!)
azd up
```

**🎉 แค่นี้แหละ!** แอปของคุณใช้งานได้บน Azure แล้ว

### ล้างข้อมูล (อย่าลืมนะ!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 วิธีใช้คอร์สนี้

คอร์สนี้ออกแบบมาเพื่อ **การเรียนรู้อย่างก้าวหน้า** — เริ่มต้นจากระดับที่คุณรู้สึกสบายใจแล้วค่อย ๆ ขยับไป

| ประสบการณ์ของคุณ | เริ่มที่นี่ |
|-----------------|------------|
| **ใหม่กับ Azure** | [บทที่ 1: พื้นฐาน](#-chapter-1-foundation--quick-start) |
| **รู้จัก Azure, ใหม่กับ AZD** | [บทที่ 1: พื้นฐาน](#-chapter-1-foundation--quick-start) |
| **ต้องการปรับใช้แอป AI** | [บทที่ 2: การพัฒนา AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **ต้องการฝึกปฏิบัติจริง** | [🎓 เวิร์กช็อปเชิงโต้ตอบ](workshop/README.md) - ห้องเรียนแนะนำใช้เวลาประมาณ 3-4 ชั่วโมง |
| **ต้องการแบบแผนสำหรับโปรดักชัน** | [บทที่ 8: แบบแผนโปรดักชันและองค์กร](#-chapter-8-production--enterprise-patterns) |

### ตั้งค่าอย่างรวดเร็ว

1. **ฟอร์กรีโพซิทอรีนี้**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **โคลนมา**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ขอความช่วยเหลือ**: [ชุมชน Discord ของ Azure](https://discord.com/invite/ByRwuEEgH4)

> **ต้องการโคลนแบบโลคัล?**

> รีโพซิทอรีนี้มีการแปลมากกว่า 50 ภาษา ซึ่งทำให้ขนาดการดาวน์โหลดใหญ่ขึ้นมาก หากต้องการโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> วิธีนี้จะมอบทุกอย่างที่คุณต้องการเพื่อทำคอร์สให้เสร็จด้วยความเร็วดาวน์โหลดที่รวดเร็วกว่า


## ภาพรวมของคอร์ส

เชี่ยวชาญ Azure Developer CLI (azd) ผ่านบทเรียนที่มีโครงสร้างซึ่งออกแบบให้เรียนรู้ทีละขั้นตอน เน้นพิเศษในการปรับใช้แอป AI ด้วยการรวม Microsoft Foundry

### ทำไมคอร์สนี้ถึงจำเป็นสำหรับนักพัฒนายุคใหม่

จากข้อมูลเชิงลึกของชุมชน Microsoft Foundry Discord พบว่า **45% ของนักพัฒนาต้องการใช้ AZD สำหรับภาระงาน AI** แต่ประสบปัญหาเกี่ยวกับ:
- สถาปัตยกรรม AI ที่ซับซ้อนหลายบริการ
- แนวปฏิบัติที่ดีที่สุดในการปรับใช้ AI ระดับโปรดักชัน
- การผสานรวมบริการ AI ของ Azure และการตั้งค่า
- การเพิ่มประสิทธิภาพค่าใช้จ่ายสำหรับงาน AI
- การแก้ไขปัญหาการปรับใช้เฉพาะ AI

### วัตถุประสงค์การเรียนรู้

เมื่อจบคอร์สนี้แล้วคุณจะ:
- **เชี่ยวชาญพื้นฐาน AZD**: แนวคิดหลัก, การติดตั้ง และการตั้งค่า
- **ปรับใช้แอป AI**: ใช้ AZD กับบริการ Microsoft Foundry
- **ใช้ Infrastructure as Code**: จัดการทรัพยากร Azure ด้วยเทมเพลต Bicep
- **แก้ไขปัญหาการปรับใช้**: แก้ไขปัญหาทั่วไปและดีบัก
- **เพิ่มประสิทธิภาพในโปรดักชัน**: ความปลอดภัย, การสเกล, การมอนิเตอร์ และการจัดการค่าใช้จ่าย
- **สร้างโซลูชันหลายเอเจนต์**: ปรับใช้สถาปัตยกรรม AI ที่ซับซ้อน

## 🗺️ แผนที่คอร์ส: นำทางอย่างรวดเร็วตามบท

แต่ละบทมี README เฉพาะ พร้อมวัตถุประสงค์การเรียนรู้, การเริ่มต้นอย่างรวดเร็ว และแบบฝึกหัด:

| บท | หัวข้อ | บทเรียน | ระยะเวลา | ความซับซ้อน |
|---------|-------|---------|----------|------------|
| **[บทที่ 1: พื้นฐาน](docs/chapter-01-foundation/README.md)** | เริ่มต้น | [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [การติดตั้ง](docs/chapter-01-foundation/installation.md) &#124; [โปรเจกต์แรก](docs/chapter-01-foundation/first-project.md) | 30-45 นาที | ⭐ |
| **[บทที่ 2: พัฒนา AI](docs/chapter-02-ai-development/README.md)** | แอป AI-First | [การรวม Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [เอเจนต์ AI](docs/chapter-02-ai-development/agents.md) &#124; [การปรับใช้โมเดล](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [เวิร์กช็อป](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ชม. | ⭐⭐ |
| **[บทที่ 3: การกำหนดค่า](docs/chapter-03-configuration/README.md)** | การรับรองความถูกต้อง & ความปลอดภัย | [การกำหนดค่า](docs/chapter-03-configuration/configuration.md) &#124; [การรับรองความถูกต้อง & ความปลอดภัย](docs/chapter-03-configuration/authsecurity.md) | 45-60 นาที | ⭐⭐ |
| **[บทที่ 4: โครงสร้างพื้นฐาน](docs/chapter-04-infrastructure/README.md)** | IaC & การปรับใช้ | [คู่มือการปรับใช้](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [การจัดเตรียม](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ชม. | ⭐⭐⭐ |
| **[บทที่ 5: เอเจนต์หลายตัว](docs/chapter-05-multi-agent/README.md)** | โซลูชันเอเจนต์ AI | [สถานการณ์ค้าปลีก](examples/retail-scenario.md) &#124; [รูปแบบการประสานงาน](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ชม. | ⭐⭐⭐⭐ |
| **[บทที่ 6: ก่อนการปรับใช้](docs/chapter-06-pre-deployment/README.md)** | การวางแผน & การตรวจสอบ | [การตรวจสอบล่วงหน้า](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ข้อมูลแอป](docs/chapter-06-pre-deployment/application-insights.md) | 1 ชม. | ⭐⭐ |
| **[บทที่ 7: การแก้ไขปัญหา](docs/chapter-07-troubleshooting/README.md)** | การดีบัก & การแก้ไข | [ปัญหาที่พบบ่อย](docs/chapter-07-troubleshooting/common-issues.md) &#124; [การดีบัก](docs/chapter-07-troubleshooting/debugging.md) &#124; [ปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ชม. | ⭐⭐ |
| **[บทที่ 8: การผลิต](docs/chapter-08-production/README.md)** | รูปแบบองค์กร | [แนวทางปฏิบัติในการผลิต](docs/chapter-08-production/production-ai-practices.md) | 2-3 ชม. | ⭐⭐⭐⭐ |
| **[🎓 เวิร์กช็อป](workshop/README.md)** | ห้องปฏิบัติการใช้งานจริง | [แนะนำ](workshop/docs/instructions/0-Introduction.md) &#124; [การเลือก](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [การตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [การแยกส่วน](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [การกำหนดค่า](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [การปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [การรื้อถอน](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [สรุป](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ชม. | ⭐⭐ |

**ระยะเวลารวมของหลักสูตร:** ~10-14 ชั่วโมง | **ระดับความชำนาญ:** ผู้เริ่มต้น → พร้อมใช้งานในผลิตภัณฑ์

---

## 📚 บทเรียน

*เลือกเส้นทางการเรียนรู้ของคุณตามระดับประสบการณ์และเป้าหมาย*

### 🚀 บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
**ข้อกำหนดเบื้องต้น**: สมัครสมาชิก Azure, ความรู้พื้นฐานคำสั่งบรรทัดคำสั่ง  
**ระยะเวลา**: 30-45 นาที  
**ระดับความซับซ้อน**: ⭐

#### สิ่งที่คุณจะได้เรียนรู้
- เข้าใจพื้นฐานของ Azure Developer CLI
- ติดตั้ง AZD บนแพลตฟอร์มของคุณ
- การปรับใช้ที่ประสบความสำเร็จครั้งแรกของคุณ

#### แหล่งข้อมูลการเรียนรู้
- **🎯 เริ่มต้นที่นี่**: [Azure Developer CLI คืออะไร?](#what-is-azure-developer-cli)
- **📖 ทฤษฎี**: [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) - แนวคิดหลักและคำศัพท์
- **⚙️ การตั้งค่า**: [การติดตั้ง & การตั้งค่า](docs/chapter-01-foundation/installation.md) - คู่มือสำหรับแต่ละแพลตฟอร์ม
- **🛠️ ฝึกปฏิบัติ**: [โครงการแรกของคุณ](docs/chapter-01-foundation/first-project.md) - สอนทีละขั้นตอน
- **📋 เอกสารอ้างอิงด่วน**: [แผ่นโกงคำสั่ง](resources/cheat-sheet.md)

#### แบบฝึกหัดเชิงปฏิบัติ
```bash
# ตรวจสอบการติดตั้งอย่างรวดเร็ว
azd version

# เปิดใช้แอปพลิเคชันแรกของคุณ
azd init --template todo-nodejs-mongo
azd up
```

**💡 ผลลัพธ์ของบทเรียน**: ปรับใช้เว็บแอปพลิเคชันอย่างง่ายไปยัง Azure โดยใช้ AZD ได้สำเร็จ

**✅ การตรวจสอบความสำเร็จ:**
```bash
# หลังจากที่ทำบทที่ 1 เสร็จ คุณควรจะสามารถ:
azd version              # แสดงเวอร์ชันที่ติดตั้ง
azd init --template todo-nodejs-mongo  # เริ่มต้นโปรเจกต์
azd up                  # นำไปใช้งานบน Azure
azd show                # แสดง URL ของแอปที่กำลังทำงาน
# แอปพลิเคชันเปิดในเบราว์เซอร์และใช้งานได้
azd down --force --purge  # ทำความสะอาดทรัพยากร
```

**📊 ลงทุนเวลา:** 30-45 นาที  
**📈 ระดับทักษะหลังเรียน:** สามารถปรับใช้แอปพื้นฐานได้ด้วยตนเอง  
**📈 ระดับทักษะหลังเรียน:** สามารถปรับใช้แอปพื้นฐานได้ด้วยตนเอง

---

### 🤖 บทที่ 2: พัฒนา AI-First (แนะนำสำหรับนักพัฒนา AI)
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1  
**ระยะเวลา**: 1-2 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การรวม Microsoft Foundry กับ AZD
- การปรับใช้แอปพลิเคชันที่ขับเคลื่อนด้วย AI
- ทำความเข้าใจการกำหนดค่าบริการ AI

#### แหล่งข้อมูลการเรียนรู้
- **🎯 เริ่มต้นที่นี่**: [การรวม Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 เอเจนต์ AI**: [คู่มือเอเจนต์ AI](docs/chapter-02-ai-development/agents.md) - ปรับใช้เอเจนต์อัจฉริยะด้วย AZD
- **📖 รูปแบบ**: [การปรับใช้โมเดล AI](docs/chapter-02-ai-development/ai-model-deployment.md) - ปรับใช้และจัดการโมเดล AI
- **🛠️ เวิร์กช็อป**: [ห้องปฏิบัติการ AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำให้โซลูชัน AI ของคุณพร้อมใช้งานกับ AZD
- **🎥 คู่มือเชิงโต้ตอบ**: [วัสดุเวิร์กช็อป](workshop/README.md) - การเรียนรู้ผ่านเบราว์เซอร์ด้วย MkDocs * สภาพแวดล้อม DevContainer
- **📋 เท็มเพลต**: [เท็มเพลต Microsoft Foundry ที่เด่น](#แหล่งข้อมูลเวิร์กช็อป)
- **📝 ตัวอย่าง**: [ตัวอย่างการปรับใช้ AZD](examples/README.md)

#### แบบฝึกหัดเชิงปฏิบัติ
```bash
# ปล่อยใช้งานแอปพลิเคชัน AI แรกของคุณ
azd init --template azure-search-openai-demo
azd up

# ลองใช้แม่แบบ AI เพิ่มเติม
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 ผลลัพธ์ของบทเรียน**: ปรับใช้และกำหนดค่าแอปพลิเคชันแชทที่ขับเคลื่อนด้วย AI พร้อมความสามารถ RAG

**✅ การตรวจสอบความสำเร็จ:**
```bash
# หลังจากบทที่ 2 คุณควรจะสามารถ:
azd init --template azure-search-openai-demo
azd up
# ทดสอบอินเทอร์เฟซแชท AI
# ถามคำถามและรับคำตอบที่ขับเคลื่อนด้วย AI พร้อมแหล่งข้อมูล
# ตรวจสอบการทำงานของการรวมการค้นหา
azd monitor  # ตรวจสอบว่า Application Insights แสดงเทเลเมทรี
azd down --force --purge
```

**📊 ลงทุนเวลา:** 1-2 ชั่วโมง  
**📈 ระดับทักษะหลังเรียน:** สามารถปรับใช้และกำหนดค่าแอป AI พร้อมใช้งานจริงได้  
**💰 ความตระหนักด้านค่าใช้จ่าย:** เข้าใจค่าใช้จ่ายการพัฒนา $80-150/เดือน, ค่าใช้จ่ายการผลิต $300-3500/เดือน

#### 💰 การพิจารณาค่าใช้จ่ายสำหรับการปรับใช้ AI

**สภาพแวดล้อมการพัฒนา (ประมาณ $80-150/เดือน):**
- โมเดล Microsoft Foundry (จ่ายตามการใช้งาน): $0-50/เดือน (ขึ้นอยู่กับการใช้โทเค็น)
- การค้นหา AI (ระดับพื้นฐาน): $75/เดือน
- Container Apps (แบบใช้ตามปริมาณ): $0-20/เดือน
- การจัดเก็บ (มาตรฐาน): $1-5/เดือน

**สภาพแวดล้อมการผลิต (ประมาณ $300-3,500+/เดือน):**
- โมเดล Microsoft Foundry (PTU เพื่อประสิทธิภาพคงที่): $3,000+/เดือน หรือจ่ายตามการใช้งานปริมาณมาก
- การค้นหา AI (ระดับมาตรฐาน): $250/เดือน
- Container Apps (แบบเฉพาะเจาะจง): $50-100/เดือน
- Application Insights: $5-50/เดือน
- การจัดเก็บ (พรีเมียม): $10-50/เดือน

**💡 เคล็ดลับลดต้นทุน:**
- ใช้ **ระดับฟรี** ของโมเดล Microsoft Foundry เพื่อการเรียนรู้ (รวม Azure OpenAI 50,000 โทเค็น/เดือน)
- ใช้คำสั่ง `azd down` เพื่อยกเลิกการจัดสรรทรัพยากรเมื่อไม่ได้พัฒนาอย่างต่อเนื่อง
- เริ่มต้นด้วยการเรียกเก็บเงินตามการใช้จริง แนะนำให้ปรับเป็น PTU เมื่อเข้าสู่การผลิต
- ใช้ `azd provision --preview` เพื่อประเมินค่าใช้จ่ายก่อนปรับใช้
- เปิดใช้งานการปรับขนาดอัตโนมัติ: จ่ายเฉพาะการใช้งานจริงเท่านั้น

**การตรวจสอบค่าใช้จ่าย:**
```bash
# ตรวจสอบค่าใช้จ่ายรายเดือนโดยประมาณ
azd provision --preview

# ติดตามค่าใช้จ่ายจริงใน Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ บทที่ 3: การกำหนดค่า & การรับรองความถูกต้อง
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1  
**ระยะเวลา**: 45-60 นาที  
**ระดับความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การกำหนดค่าและจัดการสภาพแวดล้อม
- แนวทางปฏิบัติที่ดีที่สุดด้านการรับรองความถูกต้องและความปลอดภัย
- การตั้งชื่อและการจัดองค์กรทรัพยากร

#### แหล่งข้อมูลการเรียนรู้
- **📖 การกำหนดค่า**: [คู่มือการกำหนดค่า](docs/chapter-03-configuration/configuration.md) - การตั้งค่าสภาพแวดล้อม
- **🔐 ความปลอดภัย**: [รูปแบบการรับรองความถูกต้องและตัวตนที่จัดการ](docs/chapter-03-configuration/authsecurity.md) - รูปแบบการรับรองความถูกต้อง
- **📝 ตัวอย่าง**: [ตัวอย่างแอปฐานข้อมูล](examples/database-app/README.md) - ตัวอย่างฐานข้อมูล AZD

#### แบบฝึกหัดเชิงปฏิบัติ
- กำหนดค่าสภาพแวดล้อมหลายตัว (dev, staging, prod)
- ตั้งค่าการรับรองความถูกต้องด้วย managed identity
- ใช้งานการกำหนดค่าสภาพแวดล้อมเฉพาะ

**💡 ผลลัพธ์ของบทเรียน**: จัดการสภาพแวดล้อมหลายตัวด้วยการรับรองความถูกต้องและความปลอดภัยอย่างเหมาะสม

---

### 🏗️ บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1-3  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบการปรับใช้ขั้นสูง
- โครงสร้างพื้นฐานเป็นโค้ดด้วย Bicep
- กลยุทธ์การจัดเตรียมทรัพยากร

#### แหล่งข้อมูลการเรียนรู้
- **📖 การปรับใช้**: [คู่มือการปรับใช้](docs/chapter-04-infrastructure/deployment-guide.md) - เวิร์กโฟลว์ครบชุด
- **🏗️ การจัดเตรียม**: [การจัดเตรียมทรัพยากร](docs/chapter-04-infrastructure/provisioning.md) - การจัดการทรัพยากร Azure
- **📝 ตัวอย่าง**: [ตัวอย่าง Container App](../../examples/container-app) - การปรับใช้แบบคอนเทนเนอร์

#### แบบฝึกหัดเชิงปฏิบัติ
- สร้างเท็มเพลต Bicep แบบกำหนดเอง
- ปรับใช้แอปหลายบริการ
- นำรูปแบบการปรับใช้ blue-green มาใช้

**💡 ผลลัพธ์ของบทเรียน**: ปรับใช้แอปหลายบริการที่ซับซ้อนด้วยเท็มเพลตโครงสร้างพื้นฐานแบบกำหนดเอง

---

### 🎯 บทที่ 5: โซลูชันเอเจนต์หลายตัว AI (ขั้นสูง)
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1-2  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบสถาปัตยกรรมเอเจนต์หลายตัว
- การประสานงานและจัดการเอเจนต์
- การปรับใช้ AI สำหรับใช้งานจริง

#### แหล่งข้อมูลการเรียนรู้
- **🤖 โครงการเด่น**: [โซลูชันเอเจนต์หลายตัวค้าปลีก](examples/retail-scenario.md) - การดำเนินการสมบูรณ์
- **🛠️ เท็มเพลต ARM**: [แพ็กเกจเท็มเพลต ARM](../../examples/retail-multiagent-arm-template) - ปรับใช้ด้วยคลิกเดียว
- **📖 สถาปัตยกรรม**: [รูปแบบการประสานงานเอเจนต์หลายตัว](docs/chapter-06-pre-deployment/coordination-patterns.md) - รูปแบบ

#### แบบฝึกหัดเชิงปฏิบัติ
```bash
# ปรับใช้โซลูชันตัวแทนหลายรายสำหรับค้าปลีกอย่างสมบูรณ์
cd examples/retail-multiagent-arm-template
./deploy.sh

# สำรวจการกำหนดค่าของตัวแทน
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ผลลัพธ์ของบทเรียน**: ปรับใช้และจัดการโซลูชัน AI เอเจนต์หลายตัวที่พร้อมใช้งานจริงกับเอเจนต์ลูกค้าและสินค้าคงคลัง

---

### 🔍 บทที่ 6: การตรวจสอบและวางแผนก่อนการปรับใช้
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 4  
**ระยะเวลา**: 1 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การวางแผนความจุและการตรวจสอบทรัพยากร
- กลยุทธ์การเลือก SKU
- การตรวจสอบก่อนบินและระบบอัตโนมัติ

#### แหล่งข้อมูลการเรียนรู้
- **📊 การวางแผน**: [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) - การตรวจสอบทรัพยากร
- **💰 การเลือก**: [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) - ตัวเลือกที่คุ้มค่า
- **✅ การตรวจสอบ**: [การตรวจสอบก่อนบิน](docs/chapter-06-pre-deployment/preflight-checks.md) - สคริปต์อัตโนมัติ

#### แบบฝึกหัดเชิงปฏิบัติ
- รันสคริปต์ตรวจสอบความจุ
- ปรับปรุงการเลือก SKU ให้ประหยัดค่าใช้จ่าย
- ติดตั้งการตรวจสอบก่อนปรับใช้อัตโนมัติ

**💡 ผลลัพธ์ของบทเรียน**: ตรวจสอบและปรับปรุงการปรับใช้ให้เหมาะสมก่อนใช้งานจริง

---

### 🚨 บทที่ 7: การแก้ไขปัญหา & การดีบัก
**ข้อกำหนดเบื้องต้น**: ผ่านบทใดๆ ที่เกี่ยวข้องกับการปรับใช้  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- วิธีการดีบักอย่างเป็นระบบ
- ปัญหาทั่วไปและวิธีแก้ไข
- การแก้ไขปัญหาเฉพาะกับ AI

#### แหล่งข้อมูลการเรียนรู้
- **🔧 ปัญหาทั่วไป**: [ปัญหาทั่วไป](docs/chapter-07-troubleshooting/common-issues.md) - คำถามที่พบบ่อยและวิธีแก้
- **🕵️ การดีบัก**: [คู่มือการดีบัก](docs/chapter-07-troubleshooting/debugging.md) - กลยุทธ์ทีละขั้นตอน
- **🤖 ปัญหา AI**: [แก้ปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - ปัญหาบริการ AI

#### แบบฝึกหัดเชิงปฏิบัติ
- วิเคราะห์ความล้มเหลวในการปรับใช้
- แก้ไขปัญหาการรับรองความถูกต้อง
- ดีบักการเชื่อมต่อบริการ AI

**💡 ผลลัพธ์ของบทเรียน**: วินิจฉัยและแก้ปัญหาการปรับใช้ที่พบได้อย่างอิสระ

---

### 🏢 บทที่ 8: การผลิต & รูปแบบองค์กร
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1-4  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- กลยุทธ์การปรับใช้ในสภาพแวดล้อมการผลิต
- รูปแบบความปลอดภัยสำหรับองค์กร
- การตรวจสอบและการเพิ่มประสิทธิภาพค่าใช้จ่าย

#### แหล่งข้อมูลการเรียนรู้
- **🏭 การผลิต**: [แนวทางปฏิบัติที่ดีที่สุดสำหรับ Production AI](docs/chapter-08-production/production-ai-practices.md) - แบบแผนองค์กร
- **📝 ตัวอย่าง**: [ตัวอย่างไมโครเซอร์วิส](../../examples/microservices) - สถาปัตยกรรมที่ซับซ้อน
- **📊 การติดตาม**: [การผนวกรวม Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - การติดตาม

#### แบบฝึกหัดปฏิบัติ
- ใช้แบบแผนความปลอดภัยสำหรับองค์กร
- ตั้งค่าการติดตามแบบครอบคลุม
- นำไปใช้ใน production โดยมีกลไกการกำกับดูแลอย่างเหมาะสม

**💡 ผลลัพธ์บทที่เรียน**: นำไปใช้แอปพลิเคชันที่พร้อมสำหรับองค์กรใน production ได้เต็มรูปแบบ

---

## 🎓 ภาพรวมเวิร์กช็อป: ประสบการณ์เรียนรู้เชิงปฏิบัติ

> **⚠️ สถานะเวิร์กช็อป: กำลังพัฒนา**  
> เนื้อหาเวิร์กช็อปกำลังอยู่ระหว่างการพัฒนาและปรับปรุง โมดูลหลักทำงานได้ แต่ส่วนขั้นสูงบางส่วนยังไม่สมบูรณ์ เรากำลังเร่งทำให้เสร็จสมบูรณ์ทุกเนื้อหา [ติดตามความคืบหน้า →](workshop/README.md)

### วัสดุเวิร์กช็อปเชิงโต้ตอบ
**ประสบการณ์เรียนรู้เชิงปฏิบัติที่ครอบคลุมด้วยเครื่องมือบนเบราว์เซอร์และแบบฝึกหัดแนะนำ**

วัสดุของเวิร์กช็อปนำเสนอประสบการณ์เรียนรู้อย่างมีโครงสร้างและโต้ตอบ ที่ช่วยเสริมหลักสูตรในแบบบทเรียนข้างต้น ออกแบบมาเพื่อการเรียนรู้ด้วยตนเองและการสอนเป็นกลุ่ม

#### 🛠️ คุณสมบัติของเวิร์กช็อป
- **ส่วนติดต่อเบราว์เซอร์**: เวิร์กช็อปผ่าน MkDocs ครบถ้วนพร้อมฟีเจอร์ค้นหา คัดลอก และธีม
- **การผนวกรวม GitHub Codespaces**: ตั้งค่าสภาพแวดล้อมสำหรับพัฒนาด้วยคลิกเดียว
- **เส้นทางการเรียนรู้ที่เป็นระบบ**: แบบฝึกหัดแนะนำ 8 โมดูล (รวม 3-4 ชั่วโมง)
- **วิธีการแบบก้าวหน้า**: แนะนำ → เลือก → ตรวจสอบ → วิเคราะห์โครงสร้าง → กำหนดค่า → ปรับแต่ง → รื้อถอน → สรุป
- **ดีฟคอนเทนเนอร์แบบโต้ตอบ**: เครื่องมือและการพึ่งพาที่ตั้งค่าล่วงหน้า

#### 📚 โครงสร้างโมดูลเวิร์กช็อป
เวิร์กช็อปดำเนินตาม **วิธีการแบบก้าวหน้า 8 โมดูล** ที่พาคุณจากการค้นพบสู่ความชำนาญในการนำไปใช้:

| โมดูล | หัวข้อ | สิ่งที่คุณจะทำ | ระยะเวลา |
|--------|-------|----------------|----------|
| **0. แนะนำ** | ภาพรวมเวิร์กช็อป | เข้าใจวัตถุประสงค์การเรียนรู้ ความพร้อมพื้นฐาน และโครงสร้างเวิร์กช็อป | 15 นาที |
| **1. การเลือก** | ค้นหาเทมเพลต | สำรวจเทมเพลต AZD และเลือกเทมเพลต AI ที่เหมาะกับสถานการณ์ | 20 นาที |
| **2. การตรวจสอบ** | นำไปใช้และตรวจสอบ | นำเทมเพลตไปใช้ด้วย `azd up` และตรวจสอบว่าโครงสร้างพื้นฐานทำงาน | 30 นาที |
| **3. การวิเคราะห์โครงสร้าง** | เข้าใจโครงสร้าง | ใช้ GitHub Copilot สำรวจสถาปัตยกรรมเทมเพลต ไฟล์ Bicep และการจัดระเบียบโค้ด | 30 นาที |
| **4. การกำหนดค่า** | เจาะลึก azure.yaml | ชำนาญการกำหนดค่า `azure.yaml` ฮุกวงจรชีวิต และตัวแปรสภาพแวดล้อม | 30 นาที |
| **5. การปรับแต่ง** | ทำให้เป็นของคุณ | เปิดใช้งาน AI Search, การติดตาม, การประเมิน และปรับแต่งสำหรับสถานการณ์ของคุณ | 45 นาที |
| **6. การรื้อถอน** | ทำความสะอาด | ยกเลิกการจัดสรรทรัพยากรอย่างปลอดภัยด้วย `azd down --purge` | 15 นาที |
| **7. สรุป** | ขั้นตอนถัดไป | ทบทวนความสำเร็จ แนวคิดหลัก และการเรียนรู้ต่อเนื่อง | 15 นาที |

**ลำดับเวิร์กช็อป:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 การเริ่มต้นใช้งานเวิร์กช็อป  
```bash
# ตัวเลือกที่ 1: GitHub Codespaces (แนะนำ)
# คลิก "Code" → "Create codespace on main" ในที่เก็บโค้ด

# ตัวเลือกที่ 2: การพัฒนาแบบโลคอล
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ทำตามคำแนะนำการตั้งค่าใน workshop/README.md
```
  
#### 🎯 ผลลัพธ์การเรียนรู้ของเวิร์กช็อป  
เมื่อเสร็จสิ้นเวิร์กช็อป ผู้เข้าร่วมจะสามารถ:  
- **นำแอป AI ไปใช้งานบน production**: ใช้ AZD กับบริการ Microsoft Foundry  
- **ชำนาญสถาปัตยกรรมมัลติเอเยนต์**: นำโซลูชันเอเยนต์ AI แบบประสานงาน  
- **ใช้แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย**: ตั้งค่าการพิสูจน์ตัวตนและการควบคุมการเข้าถึง  
- **เพิ่มประสิทธิภาพเพื่อรองรับการขยายขนาด**: ออกแบบการนำไปใช้ที่คุ้มค่าและมีประสิทธิภาพ  
- **แก้ปัญหาการนำไปใช้**: แก้ไขปัญหาทั่วไปด้วยตนเอง

#### 📖 แหล่งข้อมูลเวิร์กช็อป
- **🎥 คู่มือเชิงโต้ตอบ**: [วัสดุเวิร์กช็อป](workshop/README.md) - สภาพแวดล้อมเรียนบนเบราว์เซอร์  
- **📋 คำแนะนำตามโมดูล**:  
  - [0. แนะนำ](workshop/docs/instructions/0-Introduction.md) - ภาพรวมและวัตถุประสงค์เวิร์กช็อป  
  - [1. การเลือก](workshop/docs/instructions/1-Select-AI-Template.md) - ค้นหาและเลือกเทมเพลต AI  
  - [2. การตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) - นำเทมเพลตไปใช้และตรวจสอบ  
  - [3. การวิเคราะห์โครงสร้าง](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - สำรวจสถาปัตยกรรมเทมเพลต  
  - [4. การกำหนดค่า](workshop/docs/instructions/4-Configure-AI-Template.md) - เชี่ยวชาญ azure.yaml  
  - [5. การปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) - ปรับแต่งให้เหมาะกับสถานการณ์  
  - [6. การรื้อถอน](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ทำความสะอาดทรัพยากร  
  - [7. สรุป](workshop/docs/instructions/7-Wrap-up.md) - ทบทวนและขั้นตอนถัดไป  
- **🛠️ ห้องปฏิบัติการเวิร์กช็อป AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - แบบฝึกหัดเน้น AI  
- **💡 เริ่มต้นด่วน**: [คู่มือการตั้งค่าเวิร์กช็อป](workshop/README.md#quick-start) - การกำหนดค่าสภาพแวดล้อม  

**เหมาะสำหรับ**: การฝึกอบรมองค์กร หลักสูตรมหาวิทยาลัย เรียนรู้ด้วยตนเอง และบูทแคมป์สำหรับนักพัฒนา

---

## 📖 เจาะลึก: ความสามารถของ AZD

นอกจากพื้นฐานแล้ว AZD ยังมีคุณสมบัติทรงพลังสำหรับการติดตั้งใน production:

- **การติดตั้งด้วยเทมเพลต** - ใช้เทมเพลตที่สร้างไว้ล่วงหน้าสำหรับรูปแบบแอปทั่วไป  
- **การจัดการโครงสร้างพื้นฐานในรูปแบบโค้ด** - จัดการทรัพยากร Azure โดยใช้ Bicep หรือ Terraform  
- **เวิร์กโฟลว์บูรณาการ** - การจัดเตรียม นำไปใช้ และติดตามแอปพลิเคชันอย่างราบรื่น  
- **เหมาะสำหรับนักพัฒนา** - ปรับแต่งเพื่อเพิ่มประสิทธิภาพและประสบการณ์นักพัฒนา

### **AZD + Microsoft Foundry: เหมาะสำหรับการนำ AI ไปใช้งาน**

**ทำไมต้องใช้ AZD สำหรับโซลูชัน AI?** AZD ช่วยแก้ปัญหาหลักที่นักพัฒนา AI เผชิญ:

- **เทมเพลตพร้อมใช้สำหรับ AI** - เทมเพลตตั้งค่าล่วงหน้าสำหรับโมเดล Microsoft Foundry, Cognitive Services และงาน ML  
- **การติดตั้ง AI ที่ปลอดภัย** - แบบแผนความปลอดภัยสำหรับบริการ AI, คีย์ API, และ endpoints โมเดล  
- **รูปแบบ AI สำหรับ Production** - แนวทางปฏิบัติที่ดีที่สุดสำหรับแอป AI ที่ขยายได้และคุ้มค่า  
- **เวิร์กโฟลว์ AI ตั้งแต่ต้นจนจบ** - ตั้งแต่พัฒนาโมเดลจนถึงการติดตั้ง production พร้อมการติดตามอย่างเหมาะสม  
- **การเพิ่มประสิทธิภาพต้นทุน** - การจัดสรรและปรับสเกลทรัพยากรอย่างชาญฉลาดสำหรับงาน AI  
- **การผนวกรวมกับ Microsoft Foundry** - การเชื่อมต่ออย่างราบรื่นกับแคตตาล็อกโมเดลและ endpoints ของ Microsoft Foundry

---

## 🎯 ห้องสมุดเทมเพลต & ตัวอย่าง

### เทมเพลตเด่น: Microsoft Foundry  
**เริ่มที่นี่ถ้าคุณจะนำแอป AI ไปใช้งาน!**

> **หมายเหตุ:** เทมเพลตเหล่านี้แสดงแบบแผน AI ต่างๆ บางส่วนเป็น Azure Samples ภายนอก บางส่วนเป็นการนำไปใช้ภายใน

| เทมเพลต | บทเรียน | ความซับซ้อน | บริการ | ประเภท |
|----------|---------|-------------|---------|--------|
| [**เริ่มแชท AI**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ภายนอก |
| [**เริ่ม AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | บทที่ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ภายนอก |
| [**สาธิต Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ภายนอก |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ภายนอก |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ภายนอก |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ภายนอก |
| [**โซลูชันมัลติเอเยนต์สำหรับ Retail**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ภายใน** |

### เทมเพลตเด่น: กรณีการเรียนรู้ครบถ้วน  
**เทมเพลตแอปพร้อมสำหรับ production แมปกับบทเรียน**

| เทมเพลต | บทเรียน | ความซับซ้อน | การเรียนรู้หลัก |
|----------|----------|-------------|------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | รูปแบบการนำ AI ไปใช้พื้นฐาน |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | การใช้งาน RAG กับ Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | บทที่ 4 | ⭐⭐ | การผนวกรวม Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | เฟรมเวิร์กเอเยนต์และการเรียกใช้ฟังก์ชัน |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐ | การประสานงาน AI สำหรับองค์กร |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | สถาปัตยกรรมมัลติเอเยนต์กับเอเยนต์ลูกค้าและสินค้าคงคลัง |

### เรียนรู้จากประเภทตัวอย่าง

> **📌 ตัวอย่างภายใน vs. ภายนอก:**  
> **ตัวอย่างภายใน** (ในรีโปนี้) = พร้อมใช้งานทันที  
> **ตัวอย่างภายนอก** (Azure Samples) = โคลนจากรีโปที่เชื่อมโยง

#### ตัวอย่างภายใน (พร้อมใช้)  
- [**โซลูชันมัลติเอเยนต์สำหรับ Retail**](examples/retail-scenario.md) - การนำไปใช้ใน production พร้อมเทมเพลต ARM ครบถ้วน  
  - สถาปัตยกรรมมัลติเอเยนต์ (ลูกค้า + สินค้าคงคลัง)  
  - การติดตามและประเมินผลอย่างครบถ้วน  
  - นำไปใช้คลิกเดียวผ่านเทมเพลต ARM

#### ตัวอย่างภายใน - แอปคอนเทนเนอร์ (บทที่ 2-5)  
**ตัวอย่างการติดตั้งคอนเทนเนอร์ครบถ้วนในรีโปนี้:**  
- [**ตัวอย่างแอปคอนเทนเนอร์**](examples/container-app/README.md) - คู่มือการติดตั้งคอนเทนเนอร์อย่างครบถ้วน  
  - [API Flask แบบง่าย](../../examples/container-app/simple-flask-api) - REST API พื้นฐานพร้อม scale-to-zero  
  - [สถาปัตยกรรมไมโครเซอร์วิส](../../examples/container-app/microservices) - การติดตั้งมัลติเซอร์วิสพร้อมสำหรับ production  
  - รูปแบบ Quick Start, Production และขั้นสูง  
  - แนวทางการติดตาม ความปลอดภัย และเพิ่มประสิทธิภาพต้นทุน  

#### ตัวอย่างภายนอก - แอปพลิเคชันง่าย (บทที่ 1-2)  
**โคลนรีโป Azure Samples เหล่านี้เพื่อเริ่มต้น:**  
- [แอปเว็บง่าย - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - รูปแบบการติดตั้งพื้นฐาน  
- [เว็บไซต์แบบสถิต - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - การติดตั้งเนื้อหาสถิต  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - การติดตั้ง REST API  

#### ตัวอย่างภายนอก - การผนวกรวมฐานข้อมูล (บทที่ 3-4)   
- [แอปฐานข้อมูล - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - รูปแบบการเชื่อมต่อฐานข้อมูล  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - เวิร์กโฟลว์ข้อมูลแบบ Serverless  

#### ตัวอย่างภายนอก - รูปแบบขั้นสูง (บทที่ 4-8)  
- [ไมโครเซอร์วิส Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - สถาปัตยกรรมมัลติเซอร์วิส  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - การประมวลผลเบื้องหลัง  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - รูปแบบ ML พร้อมสำหรับ production  

### คอลเลกชันเทมเพลตภายนอก  
- [**แกลเลอรีเทมเพลต AZD อย่างเป็นทางการ**](https://azure.github.io/awesome-azd/) - คอลเลกชันเทมเพลตอย่างเป็นทางการและชุมชน  
- [**เอกสารเทมเพลต Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - เอกสาร Microsoft Learn  
- [**โฟลเดอร์ตัวอย่าง**](examples/README.md) - ตัวอย่างการเรียนรู้ภายในพร้อมคำอธิบายละเอียด  

---

## 📚 แหล่งข้อมูล & การอ้างอิงเพื่อการเรียนรู้

### อ้างอิงด่วน  
- [**ชีตคำสั่ง azd**](resources/cheat-sheet.md) - คำสั่ง azd สำคัญจัดเรียงตามบทเรียน  
- [**พจนานุกรมคำศัพท์**](resources/glossary.md) - คำศัพท์ Azure และ azd  
- [**คำถามที่พบบ่อย (FAQ)**](resources/faq.md) - คำถามทั่วไปจัดตามบทเรียน  
- [**คู่มือฝึกปฏิบัติ**](resources/study-guide.md) - แบบฝึกหัดฝึกทักษะครบถ้วน  

### เวิร์กช็อปเชิงปฏิบัติ  
- [**ห้องปฏิบัติการเวิร์กช็อป AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำให้โซลูชัน AI ของคุณพร้อมนำด้วย AZD (2-3 ชั่วโมง)  
- [**เวิร์กช็อปเชิงโต้ตอบ**](workshop/README.md) - แบบฝึกแนะนำ 8 โมดูลด้วย MkDocs และ GitHub Codespaces  
  - ลำดับ: แนะนำ → เลือก → ตรวจสอบ → วิเคราะห์โครงสร้าง → กำหนดค่า → ปรับแต่ง → รื้อถอน → สรุป  

### แหล่งข้อมูลเรียนรู้อื่นๆ ภายนอก
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [เครื่องคิดเลขราคาของ Azure](https://azure.microsoft.com/pricing/calculator/)
- [สถานะ Azure](https://status.azure.com/)

### ทักษะตัวแทน AI สำหรับบรรณาธิการของคุณ
- [**ทักษะ Microsoft Azure บน skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - ทักษะตัวแทนเปิด 37 ทักษะสำหรับ AI ของ Azure, Foundry, การปรับใช้, การวินิจฉัย, การปรับแต่งค่าใช้จ่าย และอื่นๆ ติดตั้งใน GitHub Copilot, Cursor, Claude Code หรือเอเจนต์ที่รองรับ:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 คู่มือแก้ไขปัญหาเบื้องต้นอย่างรวดเร็ว

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
<summary><strong>❌ "ไม่พบการสมัครสมาชิก" หรือ "ไม่ได้ตั้งค่าการสมัครสมาชิก"</strong></summary>

```bash
# แสดงรายการการสมัครใช้งานที่มีอยู่
az account list --output table

# กำหนดการสมัครใช้งานเริ่มต้น
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

# หรือใช้ SKU ขนาดเล็กกว่าในระหว่างการพัฒนา
# แก้ไข infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ล้มเหลวกึ่งกลางทาง</strong></summary>

```bash
# ตัวเลือก 1: ล้างข้อมูลและลองใหม่
azd down --force --purge
azd up

# ตัวเลือก 2: แก้ไขเฉพาะโครงสร้างพื้นฐาน
azd provision

# ตัวเลือก 3: ตรวจสอบสถานะโดยละเอียด
azd show

# ตัวเลือก 4: ตรวจสอบบันทึกใน Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "การรับรองความถูกต้องล้มเหลว" หรือ "โทเค็นหมดอายุ"</strong></summary>

```bash
# ตรวจสอบสิทธิ์อีกครั้ง
az logout
az login

azd auth logout
azd auth login

# ยืนยันการตรวจสอบสิทธิ์
az account show
```
</details>

<details>
<summary><strong>❌ "ทรัพยากรมีอยู่แล้ว" หรือชื่อซ้ำกัน</strong></summary>

```bash
# AZD สร้างชื่อที่ไม่ซ้ำกัน แต่ถ้าเกิดความขัดแย้ง:
azd down --force --purge

# จากนั้นลองใหม่ด้วยสภาพแวดล้อมใหม่
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ การปรับใช้แม่แบบใช้เวลานานเกินไป</strong></summary>

**เวลารอปกติ:**
- เว็บแอปง่าย ๆ: 5-10 นาที
- แอปที่มีฐานข้อมูล: 10-15 นาที
- แอป AI: 15-25 นาที (การจัดสรร OpenAI ช้า)

```bash
# ตรวจสอบความคืบหน้า
azd show

# หากติดขัดเกิน 30 นาที ให้ตรวจสอบ Azure Portal:
azd monitor
# มองหาการปรับใช้ที่ล้มเหลว
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
# - User Access Administrator (สำหรับการมอบหมายบทบาท)
```
</details>

<details>
<summary><strong>❌ ไม่พบ URL แอปพลิเคชันที่ปรับใช้</strong></summary>

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

### 📚 แหล่งข้อมูลแก้ไขปัญหาครบถ้วน

- **คู่มือปัญหาทั่วไป:** [วิธีแก้ไขโดยละเอียด](docs/chapter-07-troubleshooting/common-issues.md)
- **ปัญหาเฉพาะ AI:** [การแก้ไขปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **คู่มือดีบัก:** [ขั้นตอนการดีบัก](docs/chapter-07-troubleshooting/debugging.md)
- **ขอความช่วยเหลือ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 การจบหลักสูตร & การรับรอง

### การติดตามความก้าวหน้า
ติดตามความก้าวหน้าการเรียนรู้ของคุณผ่านแต่ละบท:

- [ ] **บทที่ 1**: พื้นฐาน & เริ่มต้นด่วน ✅
- [ ] **บทที่ 2**: การพัฒนาแบบ AI-First ✅  
- [ ] **บทที่ 3**: การตั้งค่า & การรับรองความถูกต้อง ✅
- [ ] **บทที่ 4**: โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้ ✅
- [ ] **บทที่ 5**: โซลูชัน AI หลายเอเจนต์ ✅
- [ ] **บทที่ 6**: การตรวจสอบ & การวางแผนก่อนปรับใช้ ✅
- [ ] **บทที่ 7**: การแก้ไขปัญหา & ดีบัก ✅
- [ ] **บทที่ 8**: รูปแบบการใช้งานจริง & องค์กร ✅

### การตรวจสอบความรู้
หลังจากจบบทเรียนแต่ละบท ให้ตรวจสอบความรู้ของคุณโดย:
1. **แบบฝึกหัดภาคปฏิบัติ**: ทำการปรับใช้ตามบทเรียน
2. **ตรวจสอบความรู้**: ทบทวนส่วนคำถามที่พบบ่อยสำหรับบทนั้น
3. **การอภิปรายในชุมชน**: แบ่งปันประสบการณ์ของคุณใน Azure Discord
4. **บทถัดไป**: ไปยังระดับความซับซ้อนถัดไป

### ประโยชน์จากการจบหลักสูตร
เมื่อจบบททั้งหมด คุณจะได้รับ:
- **ประสบการณ์การผลิต**: ปรับใช้แอป AI จริงใน Azure
- **ทักษะมืออาชีพ**: ความสามารถในการปรับใช้งานสำหรับองค์กร  
- **การยอมรับในชุมชน**: เป็นสมาชิกที่แข็งขันในชุมชนนักพัฒนาของ Azure
- **ความก้าวหน้าในสายอาชีพ**: ความเชี่ยวชาญการปรับใช้ AZD และ AI ที่เป็นที่ต้องการ

---

## 🤝 ชุมชน & การสนับสนุน

### ขอความช่วยเหลือ & การสนับสนุน
- **ปัญหาทางเทคนิค**: [รายงานบั๊กและขอฟีเจอร์](https://github.com/microsoft/azd-for-beginners/issues)
- **คำถามด้านการเรียนรู้**: [ชุมชน Microsoft Azure Discord](https://discord.gg/microsoft-azure) และ [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ความช่วยเหลือเฉพาะ AI**: เข้าร่วม [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **เอกสาร**: [เอกสารอย่างเป็นทางการของ Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### ข้อมูลเชิงลึกจาก Microsoft Foundry Discord

**ผลโพลล่าสุดจากช่อง #Azure:**
- **45%** ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI
- **ความท้าทายหลัก**: การปรับใช้หลายบริการ, การจัดการข้อมูลรับรอง, ความพร้อมใช้งานในงานจริง  
- **ที่ร้องขอมากที่สุด**: แม่แบบเฉพาะ AI, คู่มือแก้ไขปัญหา, แนวปฏิบัติที่ดีที่สุด

**เข้าร่วมชุมชนของเราเพื่อ:**
- แบ่งปันประสบการณ์ AZD + AI และขอความช่วยเหลือ
- เข้าถึงตัวอย่างแม่แบบ AI เวอร์ชันพรีวิวก่อนใคร
- มีส่วนร่วมในการสร้างแนวปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ AI
- มีอิทธิพลต่อการพัฒนาฟีเจอร์ AI + AZD ในอนาคต

### การมีส่วนร่วมในหลักสูตร
เรายินดีรับการมีส่วนร่วม! กรุณาอ่าน [คู่มือการมีส่วนร่วม](CONTRIBUTING.md) สำหรับรายละเอียดเกี่ยวกับ:
- **การปรับปรุงเนื้อหา**: พัฒนาบทและตัวอย่างที่มีอยู่
- **ตัวอย่างใหม่**: เพิ่มสถานการณ์จริงและแม่แบบ  
- **การแปลภาษา**: ช่วยดูแลการสนับสนุนหลายภาษา
- **รายงานบั๊ก**: ปรับปรุงความถูกต้องและความชัดเจน
- **มาตรฐานชุมชน**: ปฏิบัติตามแนวทางชุมชนที่ครอบคลุม

---

## 📄 ข้อมูลหลักสูตร

### ใบอนุญาต
โครงการนี้ได้รับอนุญาตภายใต้ MIT License - ดูไฟล์ [LICENSE](../../LICENSE) สำหรับรายละเอียด

### แหล่งเรียนรู้ที่เกี่ยวข้องของ Microsoft

ทีมของเราผลิตหลักสูตรการเรียนรู้อื่น ๆ ที่ครอบคลุม:

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
 
### ซีรีส์ Generative AI
[![Generative AI สำหรับผู้เริ่มต้น](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### การเรียนรู้แกนกลาง
[![ML สำหรับผู้เริ่มต้น](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science สำหรับผู้เริ่มต้น](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI สำหรับผู้เริ่มต้น](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity สำหรับผู้เริ่มต้น](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev สำหรับผู้เริ่มต้น](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT สำหรับผู้เริ่มต้น](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development สำหรับผู้เริ่มต้น](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ซีรีส์ Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ การนำทางหลักสูตร

**🚀 พร้อมเริ่มเรียนรู้แล้วหรือยัง?**

**ผู้เริ่มต้น**: เริ่มต้นด้วย [บทที่ 1: พื้นฐาน & การเริ่มต้นด่วน](#-chapter-1-foundation--quick-start)  
**นักพัฒนา AI**: ข้ามไปที่ [บทที่ 2: การพัฒนา AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**นักพัฒนาที่มีประสบการณ์**: เริ่มที่ [บทที่ 3: การตั้งค่า & การตรวจสอบสิทธิ์](#️-chapter-3-configuration--authentication)

**ขั้นตอนถัดไป**: [เริ่มบทที่ 1 - พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ความแม่นยำสูงสุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นทางในภาษาต้นฉบับถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญแนะนำให้ใช้การแปลโดยผู้เชี่ยวชาญด้านภาษา เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->