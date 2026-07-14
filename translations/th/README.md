# AZD สำหรับมือใหม่: การเรียนรู้แบบมีโครงสร้าง

![AZD-for-beginners](../../translated_images/th/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### การแปลอัตโนมัติ (อัปเดตตลอดเวลา)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](./README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ต้องการโคลนแบบโลคัล?**
>
> ที่เก็บนี้รวมการแปลกว่า 50 ภาษา ซึ่งทำให้ขนาดดาวน์โหลดใหญ่ขึ้นมาก หากต้องการโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
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
> วิธีนี้จะให้ทุกอย่างที่คุณต้องการเพื่อทำหลักสูตรให้เสร็จพร้อมการดาวน์โหลดที่เร็วขึ้นมาก
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 มีอะไรใหม่ใน azd วันนี้

> 📌 หลักสูตรนี้ได้รับการตรวจสอบกับ **`azd 1.27.1`** (กรกฎาคม 2026) ให้เรียกใช้ `azd version` เพื่อตรวจสอบเวอร์ชันของคุณ และ `azd upgrade` เพื่อรับเวอร์ชันล่าสุด

Azure Developer CLI ได้เติบโตไปเกินแอปเว็บและ APIs แบบเดิม ๆ วันนี้ azd คือเครื่องมือเดียวสำหรับการปรับใช้แอปพลิเคชัน **ทุกประเภท** ไปยัง Azure รวมถึงแอป AI และเอเจนต์อัจฉริยะ

นี่คือสิ่งที่หมายถึงสำหรับคุณ:

- **เอเจนต์ AI ตอนนี้เป็นภาระงานชั้นยอดของ azd** คุณสามารถเริ่มต้น, ปรับใช้, และจัดการโปรเจกต์เอเจนต์ AI โดยใช้ workflow `azd init` → `azd up` ที่คุณคุ้นเคย
- **วงจรชีวิตเอเจนต์ครบถ้วนจาก CLI** ส่วนขยาย `azure.ai.agents` ครอบคลุมทั้งกระบวนการ— `azd ai agent init` เพื่อเริ่มโครงสร้าง, `azd ai agent invoke` เพื่อทดสอบ (พร้อมผลลัพธ์เวลาโต้ตอบ), `azd ai agent eval generate` และ `azd ai agent optimize` เพื่อวัดและปรับปรุงคุณภาพ, และ `azd ai agent delete` เพื่อทำความสะอาด
- **บล็อกการสร้าง AI เพิ่มเติม** ส่วนขยายพรีวิวใหม่— `azure.ai.skills` และ `azure.ai.connections` ช่วยให้คุณจัดการทักษะเอเจนต์ที่นำกลับมาใช้ใหม่และการเชื่อมต่อ Foundry ได้โดยตรงกับ azd
- **การรวม Microsoft Foundry** ช่วยให้การปรับใช้โมเดล, โฮสต์เอเจนต์, และการตั้งค่าบริการ AI รวมเข้าไปในระบบแม่แบบ azd
- **พื้นฐานที่ราบรื่นในแต่ละวัน** เวอร์ชันล่าสุดทำให้ `azd init` เป็น idempotent (ปลอดภัยที่จะรันซ้ำ), ทำให้ `azd auth login` ล้างโทเคนเก่าอัตโนมัติ และเพิ่ม prompt การตั้งค่าแรกสำหรับ `azd tool`
- **Workflow หลักไม่เปลี่ยนแปลง** ไม่ว่าคุณจะปรับใช้แอป to-do, ไมโครเซอร์วิส, หรือโซลูชัน AI หลายเอเจนต์ คำสั่งก็เหมือนเดิม

> **หมายเหตุสำหรับผู้ใช้ Aspire:** Microsoft เรียกผลิตภัณฑ์นี้ว่า **Aspire** เท่านั้น (เดิม ".NET Aspire") การสนับสนุน azd สำหรับ Aspire ไม่เปลี่ยนแปลง—เพียงแต่ชื่อได้รับการอัปเดต

หากคุณเคยใช้ azd มาก่อน การสนับสนุน AI เป็นส่วนขยายที่เป็นธรรมชาติ—ไม่ใช่เครื่องมือแยกหรือเส้นทางขั้นสูง หากคุณเริ่มต้นใหม่ คุณจะเรียนรู้ workflow เดียวที่ใช้งานได้กับทุกอย่าง

---

## 🚀 Azure Developer CLI (azd) คืออะไร?

**Azure Developer CLI (azd)** คือเครื่องมือบรรทัดคำสั่งที่ใช้งานง่ายสำหรับนักพัฒนา ช่วยให้ปรับใช้แอปพลิเคชันไปยัง Azure ได้ง่าย แทนที่จะสร้างและเชื่อมต่อทรัพยากร Azure ทีละหลายรายการ คุณสามารถปรับใช้แอปพลิเคชันทั้งหมดด้วยคำสั่งเดียว

### เวทมนตร์ของ `azd up`

```bash
# คำสั่งเดียวนี้ทำทุกอย่าง:
# ✅ สร้างทรัพยากร Azure ทั้งหมด
# ✅ กำหนดค่าเครือข่ายและความปลอดภัย
# ✅ สร้างรหัสแอปพลิเคชันของคุณ
# ✅ ปล่อยไปยัง Azure
# ✅ ให้ URL ที่ใช้งานได้แก่คุณ
azd up
```

**แค่นี้แหละ!** ไม่ต้องคลิกบน Azure Portal, ไม่ต้องเรียนรู้เทมเพลต ARM ที่ซับซ้อนก่อน, และไม่ต้องตั้งค่าด้วยตัวเอง - เพียงแอปที่ทำงานได้บน Azure

---

## ❓ Azure Developer CLI กับ Azure CLI แตกต่างกันอย่างไร?

นี่คือคำถามที่พบบ่อยที่สุดสำหรับมือใหม่ นี่คือคำตอบง่าย ๆ:

| ฟีเจอร์ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **วัตถุประสงค์** | จัดการทรัพยากร Azure แต่ละชิ้น | ปรับใช้แอปพลิเคชันทั้งหมด |
| **แนวคิดหลัก** | มุ่งเน้นโครงสร้างพื้นฐาน | มุ่งเน้นแอปพลิเคชัน |
| **ตัวอย่างคำสั่ง** | `az webapp create --name myapp...` | `azd up` |
| **ความยากในการเรียนรู้** | ต้องรู้บริการ Azure | เพียงรู้จักแอปของคุณ |
| **เหมาะสำหรับ** | DevOps, โครงสร้างพื้นฐาน | นักพัฒนา, การสร้างต้นแบบ |

### อุปมาอุปไมยง่าย ๆ

- **Azure CLI** เหมือนการมีเครื่องมือทั้งหมดสำหรับสร้างบ้าน - ค้อน, เลื่อย, ตะปู คุณสร้างอะไรก็ได้ แต่ต้องรู้การก่อสร้าง
- **Azure Developer CLI** เหมือนการว่าจ้างผู้รับเหมา - คุณบอกสิ่งที่ต้องการ แล้วเขาดูแลการสร้างให้

### ใช้เมื่อไหร่

| สถานการณ์ | ใช้อันนี้ |
|----------|----------|
| "ฉันต้องการปรับใช้เว็บแอปอย่างรวดเร็ว" | `azd up` |
| "ฉันแค่ต้องสร้างบัญชีเก็บข้อมูล" | `az storage account create` |
| "ฉันกำลังสร้างแอป AI เต็มรูปแบบ" | `azd init --template azure-search-openai-demo` |
| "ฉันต้องการดีบักทรัพยากร Azure เฉพาะ" | `az resource show` |
| "ฉันต้องการปรับใช้ที่พร้อมใช้งานระดับโปรดักชันในไม่กี่นาที" | `azd up --environment production` |

### ทั้งสองทำงานด้วยกันได้!

AZD ใช้ Azure CLI ภายใน คุณสามารถใช้ทั้งสองอย่าง:
```bash
# ทำการปรับใช้แอปของคุณด้วย AZD
azd up

# จากนั้นปรับแต่งทรัพยากรเฉพาะด้วย Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ค้นหาแม่แบบใน Awesome AZD

ไม่ต้องเริ่มต้นจากศูนย์! **Awesome AZD** คือคอลเลกชันชุมชนของแม่แบบที่พร้อมปรับใช้:

| ทรัพยากร | คำอธิบาย |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | เรียกดูแม่แบบกว่า 200 แบบพร้อมปุ่มปรับใช้ครั้งเดียว |
| 🔗 [**ส่งแม่แบบ**](https://github.com/Azure/awesome-azd/issues) | มีส่วนร่วมโดยการส่งแม่แบบของคุณเองให้ชุมชน |
| 🔗 [**ที่เก็บ GitHub**](https://github.com/Azure/awesome-azd) | กดดาวและสำรวจซอร์สโค้ด |

### แม่แบบ AI ที่ได้รับความนิยมจาก Awesome AZD

```bash
# แชท RAG กับโมเดล Microsoft Foundry + การค้นหา AI
azd init --template azure-search-openai-demo

# แอปพลิเคชันแชท AI อย่างรวดเร็ว
azd init --template openai-chat-app-quickstart

# เอเย่นต์ AI กับเอเย่นต์ Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 เริ่มต้นใน 3 ขั้นตอน

ก่อนเริ่ม ให้แน่ใจว่าเครื่องของคุณพร้อมสำหรับแม่แบบที่คุณต้องการปรับใช้:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

หากการตรวจสอบข้อใดล้มเหลว ให้แก้ไขก่อนแล้วจึงดำเนินการต่อกับการเริ่มต้นอย่างรวดเร็ว

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

### ขั้นตอนที่ 2: การยืนยันตัวตนสำหรับ AZD

```bash
# เป็นตัวเลือกถ้าคุณวางแผนที่จะใช้คำสั่ง Azure CLI โดยตรงในหลักสูตรนี้
az login

# จำเป็นสำหรับเวิร์กโฟลว์ AZD
azd auth login
```

หากคุณไม่แน่ใจว่าต้องการแบบไหน ให้ทำตามขั้นตอนการตั้งค่าเต็มใน [การติดตั้ง & การตั้งค่า](docs/chapter-01-foundation/installation.md#authentication-setup)

### ขั้นตอนที่ 3: ปรับใช้แอปแรกของคุณ

```bash
# เริ่มต้นจากเทมเพลต
azd init --template todo-nodejs-mongo

# นำไปใช้บน Azure (สร้างทุกอย่าง!)
azd up
```

**🎉 แค่นี้แหละ!** แอปของคุณออนไลน์บน Azure แล้ว

### ทำความสะอาด (อย่าลืม!)

```bash
# ลบทรัพยากรทั้งหมดเมื่อทดลองเสร็จสิ้น
azd down --force --purge
```

---

## 📚 วิธีใช้หลักสูตรนี้

หลักสูตรนี้ออกแบบมาเพื่อ **การเรียนรู้อย่างก้าวหน้า** - เริ่มจากระดับที่คุณสะดวกและก้าวไปเรื่อย ๆ:

| ประสบการณ์ของคุณ | เริ่มที่นี่ |
|-----------------|------------|
| **มือใหม่กับ Azure** | [บทที่ 1: พื้นฐาน](#-chapter-1-foundation--quick-start) |
| **รู้จัก Azure แต่ไม่เคยใช้ AZD** | [บทที่ 1: พื้นฐาน](#-chapter-1-foundation--quick-start) |
| **ต้องการปรับใช้แอป AI** | [บทที่ 2: การพัฒนา AI-แรก](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **ต้องการฝึกปฏิบัติ** | [🎓 เวิร์กช็อปอินเทอร์แอคทีฟ](workshop/README.md) - ห้องปฏิบัติการแนะนำ 3-4 ชั่วโมง |
| **ต้องการแพตเทิร์นโปรดักชัน** | [บทที่ 8: โปรดักชัน & องค์กร](#-chapter-8-production--enterprise-patterns) |

### การตั้งค่าอย่างรวดเร็ว

1. **Fork ที่เก็บนี้**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **โคลนมัน**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ขอความช่วยเหลือ**: [ชุมชน Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **ต้องการโคลนแบบโลคัล?**

> ที่เก็บนี้รวมการแปลกว่า 50 ภาษา ซึ่งทำให้ขนาดดาวน์โหลดใหญ่ขึ้นมาก หากต้องการโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> วิธีนี้จะให้ทุกอย่างที่คุณต้องการเพื่อทำหลักสูตรให้เสร็จพร้อมการดาวน์โหลดที่เร็วขึ้นมาก


## ภาพรวมหลักสูตร

เรียนรู้ Azure Developer CLI (azd) ผ่านบทเรียนที่มีโครงสร้างออกแบบมาเพื่อการเรียนรู้อย่างก้าวหน้า โดยเน้นพิเศษที่การปรับใช้แอป AI ด้วยการรวมเข้ากับ Microsoft Foundry


### ทำไมคอร์สนี้จึงจำเป็นสำหรับนักพัฒนาสมัยใหม่

อิงจากข้อมูลเชิงลึกของชุมชน Microsoft Foundry Discord, **45% ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI** แต่ประสบกับความท้าทายเรื่อง:
- สถาปัตยกรรม AI หลายบริการที่ซับซ้อน
- แนวทางปฏิบัติที่ดีที่สุดในการนำเสนอ AI ในสภาพแวดล้อมการผลิต  
- การรวมและกำหนดค่าบริการ AI ของ Azure
- การปรับค่าใช้จ่ายให้เหมาะสมสำหรับงาน AI
- การแก้ไขปัญหาเฉพาะที่เกิดจากการนำ AI ไปใช้

### วัตถุประสงค์การเรียนรู้

เมื่อคุณผ่านคอร์สนี้ที่มีโครงสร้าง คุณจะได้:
- **เข้าใจพื้นฐาน AZD อย่างเชี่ยวชาญ**: แนวคิดหลัก การติดตั้ง และการกำหนดค่า
- **นำแอปพลิเคชัน AI ไปใช้งาน**: ใช้ AZD กับบริการ Microsoft Foundry
- **นำเสนอ Infrastructure as Code**: จัดการทรัพยากร Azure ด้วยเทมเพลต Bicep
- **แก้ไขปัญหาในการนำเสนอ**: แก้ไขปัญหาทั่วไปและดีบักปัญหา
- **ปรับให้เหมาะสมกับการผลิต**: ความปลอดภัย ขยายระบบ ตรวจสอบ และจัดการค่าใช้จ่าย
- **สร้างโซลูชัน Multi-Agent**: นำเสนอสถาปัตยกรรม AI ที่ซับซ้อน

## ก่อนเริ่มต้น: บัญชี การเข้าถึง และสมมติฐาน

ก่อนเริ่มบทที่ 1 ตรวจสอบให้แน่ใจว่าคุณมีสิ่งต่อไปนี้ ขั้นตอนการติดตั้งในคำแนะนำนี้ถือว่าสิ่งเหล่านี้ได้รับการจัดการแล้ว

- **การสมัครใช้งาน Azure**: คุณสามารถใช้การสมัครใช้งานที่มีอยู่จากที่ทำงานหรือบัญชีของคุณเอง หรือสร้าง [ทดลองใช้งานฟรี](https://aka.ms/azurefreetrial) เพื่อเริ่มต้น
- **สิทธิ์ในการสร้างทรัพยากร Azure**: สำหรับแบบฝึกหัดส่วนใหญ่ คุณควรมีสิทธิ์เข้าถึงอย่างน้อยในระดับ **Contributor** บนการสมัครใช้งานหรือกลุ่มทรัพยากรเป้าหมาย บางบทอาจสมมติว่าคุณสามารถสร้างกลุ่มทรัพยากร managed identities และการกำหนด RBAC ได้
- [**บัญชี GitHub**](https://github.com): มีประโยชน์สำหรับการ fork รีโพสิทอรี ติดตามการเปลี่ยนแปลงของคุณ และใช้ GitHub Codespaces สำหรับเวิร์กชอป
- **ข้อกำหนด runtime ของเทมเพลต**: เทมเพลตบางตัวจำเป็นต้องมีเครื่องมือท้องถิ่นเช่น Node.js, Python, Java หรือ Docker ให้รันโปรแกรมตรวจสอบการตั้งค่าก่อนเริ่มเพื่อจับข้อขาดแคลนเครื่องมือได้เร็ว
- **ความคุ้นเคยกับเทอร์มินัลขั้นพื้นฐาน**: คุณไม่จำเป็นต้องเชี่ยวชาญ แต่ควรมีความสะดวกใจกับคำสั่ง เช่น `git clone`, `azd auth login`, และ `azd up`

> **ทำงานในองค์กรที่มีการสมัครใช้งานหรือไม่?**
> หากสภาพแวดล้อม Azure ของคุณถูกดูแลโดยผู้ดูแลระบบ ยืนยันล่วงหน้าว่าคุณสามารถนำเสนอทรัพยากรในการสมัครใช้งานหรือกลุ่มทรัพยากรที่คุณวางแผนจะใช้ได้หรือไม่ หากไม่สามารถ ให้ขอการสมัครใช้งาน sandbox หรือสิทธิ์ Contributor ก่อนเริ่มต้น

> **ใหม่กับ Azure?**
> เริ่มด้วยการทดลองใช้งาน Azure ส่วนตัวของคุณหรือสมัครแบบ pay-as-you-go ที่ https://aka.ms/azurefreetrial เพื่อให้คุณทำแบบฝึกหัดเสร็จสิ้นโดยไม่ต้องรอการอนุมัติในระดับ tenant

## 🗺️ แผนที่คอร์ส: การนำทางอย่างรวดเร็วตามบท

แต่ละบทมี README ที่แยกสำหรับวัตถุประสงค์การเรียนรู้ การเริ่มต้นอย่างรวดเร็ว และแบบฝึกหัด:

| บท | หัวข้อ | บทเรียน | ระยะเวลา | ความซับซ้อน |
|---------|-------|---------|----------|------------|
| **[บท 1: พื้นฐาน](docs/chapter-01-foundation/README.md)** | เริ่มต้น | [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [การติดตั้ง](docs/chapter-01-foundation/installation.md) &#124; [โครงการแรก](docs/chapter-01-foundation/first-project.md) | 30-45 นาที | ⭐ |
| **[บท 2: พัฒนา AI](docs/chapter-02-ai-development/README.md)** | แอป AI-First | [การรวม Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [การนำ AI Model ไปใช้งาน](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [เวิร์กชอป](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ชั่วโมง | ⭐⭐ |
| **[บท 3: การกำหนดค่า](docs/chapter-03-configuration/README.md)** | การยืนยันตัวตน & ความปลอดภัย | [การกำหนดค่า](docs/chapter-03-configuration/configuration.md) &#124; [การยืนยันตัวตน & ความปลอดภัย](docs/chapter-03-configuration/authsecurity.md) | 45-60 นาที | ⭐⭐ |
| **[บท 4: โครงสร้างพื้นฐาน](docs/chapter-04-infrastructure/README.md)** | IaC & การนำเสนอ | [คู่มือการนำเสนอ](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [การจัดหาทรัพยากร](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ชั่วโมง | ⭐⭐⭐ |
| **[บท 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | โซลูชัน AI Agent | [สถานการณ์ค้าปลีก](examples/retail-scenario.md) &#124; [รูปแบบการประสานงาน](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ชั่วโมง | ⭐⭐⭐⭐ |
| **[บท 6: ก่อนการนำเสนอ](docs/chapter-06-pre-deployment/README.md)** | การวางแผน & การตรวจสอบ | [การตรวจสอบก่อนบิน](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ชั่วโมง | ⭐⭐ |
| **[บท 7: แก้ไขปัญหา](docs/chapter-07-troubleshooting/README.md)** | ดีบัก & แก้ไข | [ปัญหาทั่วไป](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ดีบัก](docs/chapter-07-troubleshooting/debugging.md) &#124; [ปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ชั่วโมง | ⭐⭐ |
| **[บท 8: การผลิต](docs/chapter-08-production/README.md)** | รูปแบบองค์กร | [แนวทางการผลิต](docs/chapter-08-production/production-ai-practices.md) | 2-3 ชั่วโมง | ⭐⭐⭐⭐ |
| **[🎓 เวิร์กชอป](workshop/README.md)** | ห้องปฏิบัติการใช้งานจริง | [แนะนำ](workshop/docs/instructions/0-Introduction.md) &#124; [การเลือก](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [การตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [การแยกวิเคราะห์](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [การกำหนดค่า](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [การปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [การรื้อถอน](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [สรุป](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ชั่วโมง | ⭐⭐ |

**ระยะเวลารวมของคอร์ส:** ~10-14 ชั่วโมง | **ระดับทักษะ:** ผู้เริ่มต้น → พร้อมผลิต

---

## 📚 บทเรียน

*เลือกเส้นทางการเรียนรู้ตามระดับประสบการณ์และเป้าหมาย*

### 🚀 บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
**ข้อกำหนดเบื้องต้น**: การสมัครใช้งาน Azure ความรู้พื้นฐานคอมมานด์ไลน์  
**ระยะเวลา**: 30-45 นาที  
**ความซับซ้อน**: ⭐

#### สิ่งที่คุณจะได้เรียนรู้
- เข้าใจพื้นฐานของ Azure Developer CLI
- การติดตั้ง AZD บนแพลตฟอร์มของคุณ
- การนำเสนอโปรเจกต์แรกที่ประสบความสำเร็จ

#### แหล่งเรียนรู้
- **🎯 เริ่มที่นี่**: [Azure Developer CLI คืออะไร?](#what-is-azure-developer-cli)
- **📖 ทฤษฎี**: [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) - แนวคิดหลักและคำศัพท์
- **⚙️ การตั้งค่า**: [การติดตั้ง & การตั้งค่า](docs/chapter-01-foundation/installation.md) - คู่มือเฉพาะแพลตฟอร์ม
- **🛠️ ปฏิบัติ**: [โปรเจกต์แรกของคุณ](docs/chapter-01-foundation/first-project.md) - คู่มือทีละขั้นตอน
- **📋 อ้างอิงด่วน**: [ชีทคำสั่ง](resources/cheat-sheet.md)

#### แบบฝึกหัดเชิงปฏิบัติ
```bash
# ตรวจสอบการติดตั้งอย่างรวดเร็ว
azd version

# ติดตั้งแอปพลิเคชันแรกของคุณ
azd init --template todo-nodejs-mongo
azd up
```

**💡 ผลลัพธ์บทเรียน**: นำเสนอแอปเว็บอย่างง่ายไปยัง Azure ด้วย AZD ได้สำเร็จ

**✅ การยืนยันความสำเร็จ:**
```bash
# หลังจากทำบทที่ 1 เสร็จแล้ว คุณควรจะสามารถ:
azd version              # แสดงเวอร์ชันที่ติดตั้ง
azd init --template todo-nodejs-mongo  # เริ่มต้นโปรเจกต์
azd up                  # ส่งไปยัง Azure
azd show                # แสดง URL ของแอปที่กำลังทำงาน
# เปิดแอปในเบราว์เซอร์และทำงานได้
azd down --force --purge  # ทำความสะอาดทรัพยากร
```

**📊 ระยะเวลาที่ใช้:** 30-45 นาที  
**📈 ระดับทักษะหลังเรียน:** สามารถนำเสนอแอปพื้นฐานได้อย่างอิสระ
**📈 ระดับทักษะหลังเรียน:** สามารถนำเสนอแอปพื้นฐานได้อย่างอิสระ

---

### 🤖 บทที่ 2: การพัฒนา AI-First (แนะนำสำหรับนักพัฒนา AI)
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1 แล้ว  
**ระยะเวลา**: 1-2 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การรวม Microsoft Foundry กับ AZD
- การนำแอปพลิเคชันที่ขับเคลื่อนด้วย AI ไปใช้
- เข้าใจการกำหนดค่าบริการ AI

#### แหล่งเรียนรู้
- **🎯 เริ่มที่นี่**: [การรวม Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [คู่มือ AI Agents](docs/chapter-02-ai-development/agents.md) - การนำ Agent อัจฉริยะไปใช้งานด้วย AZD
- **📖 รูปแบบ**: [การนำ Model AI ไปใช้งาน](docs/chapter-02-ai-development/ai-model-deployment.md) - การนำและจัดการโมเดล AI
- **🛠️ เวิร์กชอป**: [ห้องปฏิบัติการ AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำโซลูชัน AI ให้พร้อมใช้งานด้วย AZD
- **🎥 คู่มือแบบโต้ตอบ**: [สื่อเวิร์กชอป](workshop/README.md) - เรียนรู้ผ่านเบราว์เซอร์ด้วย MkDocs * สภาพแวดล้อม DevContainer
- **📋 เทมเพลต**: [เทมเพลต Microsoft Foundry](#แหล่งข้อมูลเวิร์กช็อป)
- **📝 ตัวอย่าง**: [ตัวอย่างการนำเสนอ AZD](examples/README.md)

#### แบบฝึกหัดเชิงปฏิบัติ
```bash
# เปิดตัวแอปพลิเคชัน AI แรกของคุณ
azd init --template azure-search-openai-demo
azd up

# ลองใช้เทมเพลต AI เพิ่มเติม
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 ผลลัพธ์บทเรียน**: นำแอปแชทที่ขับเคลื่อนด้วย AI พร้อมฟีเจอร์ RAG ไปใช้งานและกำหนดค่า

**✅ การยืนยันความสำเร็จ:**
```bash
# หลังจากบทที่ 2 คุณควรจะสามารถ:
azd init --template azure-search-openai-demo
azd up
# ทดสอบอินเทอร์เฟซแชทของ AI
# ถามคำถามและรับคำตอบที่ขับเคลื่อนด้วย AI พร้อมแหล่งที่มา
# ยืนยันการทำงานของการรวมการค้นหา
azd monitor  # ตรวจสอบว่า Application Insights แสดงข้อมูลเทเลเมทรี
azd down --force --purge
```

**📊 ระยะเวลาที่ใช้:** 1-2 ชั่วโมง  
**📈 ระดับทักษะหลังเรียน:** สามารถนำเสนอและกำหนดค่าแอป AI พร้อมสำหรับผลิตได้  
**💰 ความเข้าใจค่าใช้จ่าย:** เข้าใจค่าใช้จ่ายพัฒนา $80-150/เดือน และผลิต $300-3500/เดือน

#### 💰 ข้อควรพิจารณาค่าใช้จ่ายสำหรับการนำ AI ไปใช้

**สภาพแวดล้อมการพัฒนา (ประมาณ $80-150/เดือน):**
- โมเดล Microsoft Foundry (จ่ายตามจริง): $0-50/เดือน (ขึ้นอยู่กับการใช้ token)
- AI Search (ระดับ Basic): $75/เดือน
- Container Apps (แบบคิดตามการใช้งาน): $0-20/เดือน
- Storage (ระดับ Standard): $1-5/เดือน

**สภาพแวดล้อมผลิต (ประมาณ $300-3,500+/เดือน):**
- โมเดล Microsoft Foundry (PTU สำหรับประสิทธิภาพคงที่): $3,000+/เดือน หรือ จ่ายตามจริงในปริมาณสูง
- AI Search (ระดับ Standard): $250/เดือน
- Container Apps (แบบเฉพาะ): $50-100/เดือน
- Application Insights: $5-50/เดือน
- Storage (ระดับ Premium): $10-50/เดือน

**💡 เคล็ดลับการปรับค่าใช้จ่ายให้เหมาะสม:**
- ใช้ **ระดับฟรี** ของโมเดล Microsoft Foundry เพื่อเรียนรู้ (Azure OpenAI รวม 50,000 tokens/เดือน)
- รัน `azd down` เพื่อยกเลิกการจัดสรรทรัพยากรเมื่อไม่พัฒนา
- เริ่มด้วยการคิดค่าบริการตามการใช้งาน อัปเกรดเป็น PTU เฉพาะสำหรับผลิต
- ใช้คำสั่ง `azd provision --preview` เพื่อตีราคาก่อนการนำเสนอ
- เปิดใช้ auto-scaling: จ่ายเฉพาะการใช้งานจริง

**การติดตามค่าใช้จ่าย:**
```bash
# ตรวจสอบค่าใช้จ่ายโดยประมาณรายเดือน
azd provision --preview

# ตรวจสอบค่าใช้จ่ายจริงใน Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ บทที่ 3: การกำหนดค่า & การยืนยันตัวตน
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1 แล้ว  
**ระยะเวลา**: 45-60 นาที  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การกำหนดค่าและการจัดการสภาพแวดล้อม
- แนวทางปฏิบัติที่ดีที่สุดด้านการยืนยันตัวตนและความปลอดภัย
- การตั้งชื่อและการจัดระเบียบทรัพยากร

#### แหล่งเรียนรู้
- **📖 การกำหนดค่า**: [คู่มือการกำหนดค่า](docs/chapter-03-configuration/configuration.md) - การตั้งค่าสภาพแวดล้อม
- **🔐 ความปลอดภัย**: [รูปแบบการยืนยันตัวตนและ managed identity](docs/chapter-03-configuration/authsecurity.md) - รูปแบบการยืนยันตัวตน
- **📝 ตัวอย่าง**: [ตัวอย่างแอปฐานข้อมูล](examples/database-app/README.md) - ตัวอย่างฐานข้อมูล AZD

#### แบบฝึกหัดเชิงปฏิบัติ
- กำหนดค่าสภาพแวดล้อมหลายชุด (dev, staging, prod)
- ตั้งค่าการยืนยันตัวตน managed identity
- นำการกำหนดค่าสภาพแวดล้อมแบบเฉพาะมาใช้

**💡 ผลลัพธ์บทเรียน**: จัดการสภาพแวดล้อมหลายชุดด้วยการยืนยันตัวตนและความปลอดภัยอย่างเหมาะสม

---

### 🏗️ บทที่ 4: Infrastructure as Code & การนำเสนอ
**ข้อกำหนดเบื้องต้น**: ผ่านบทที่ 1-3  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบการนำเสนอขั้นสูง
- Infrastructure as Code ด้วย Bicep
- กลยุทธ์การจัดหาทรัพยากร

#### แหล่งเรียนรู้
- **📖 การนำเสนอ**: [คู่มือการนำเสนอ](docs/chapter-04-infrastructure/deployment-guide.md) - เวิร์กโฟลว์ครบถ้วน
- **🏗️ การจัดหา**: [การจัดหาทรัพยากร](docs/chapter-04-infrastructure/provisioning.md) - การจัดการทรัพยากร Azure
- **📝 ตัวอย่าง**: [ตัวอย่าง Container App](../../examples/container-app) - การนำเสนอแบบคอนเทนเนอร์

#### แบบฝึกหัดเชิงปฏิบัติ
- สร้างเทมเพลต Bicep ที่กำหนดเอง
- นำเสนอแอปพลิเคชันหลายบริการ
- นำกลยุทธ์ blue-green deployment มาใช้

**💡 ผลลัพธ์บทเรียน**: นำเสนอแอปพลิเคชันหลายบริการที่ซับซ้อนโดยใช้เทมเพลตโครงสร้างพื้นฐานแบบกำหนดเอง

---


### 🎯 บทที่ 5: โซลูชัน AI แบบหลายตัวแทน (ขั้นสูง)
**ข้อกำหนดเบื้องต้น**: บทที่ 1-2 เสร็จสมบูรณ์  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบสถาปัตยกรรมแบบหลายตัวแทน
- การประสานงานและการประสานตัวแทน
- การปรับใช้ AI ที่พร้อมสำหรับการผลิต

#### แหล่งเรียนรู้
- **🤖 โครงการเด่น**: [โซลูชัน AI แบบหลายตัวแทนสำหรับค้าปลีก](examples/retail-scenario.md) - การนำไปใช้อย่างครบถ้วน
- **🛠️ แม่แบบ ARM**: [แพ็กเกจแม่แบบ ARM](../../examples/retail-multiagent-arm-template) - การปรับใช้ในคลิกเดียว
- **📖 สถาปัตยกรรม**: [รูปแบบการประสานงานแบบหลายตัวแทน](docs/chapter-06-pre-deployment/coordination-patterns.md) - รูปแบบ

#### แบบฝึกหัดปฏิบัติ
```bash
# เปิดใช้โซลูชันตัวแทนหลายรายในธุรกิจค้าปลีกอย่างครบวงจร
cd examples/retail-multiagent-arm-template
./deploy.sh

# สำรวจการตั้งค่าตัวแทน
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ผลลัพธ์บทเรียน**: ปรับใช้และจัดการโซลูชัน AI แบบหลายตัวแทนที่พร้อมสำหรับการผลิตด้วยตัวแทนลูกค้าและตัวแทนสินค้าคงคลัง

---

### 🔍 บทที่ 6: การตรวจสอบและวางแผนก่อนการปรับใช้
**ข้อกำหนดเบื้องต้น**: บทที่ 4 เสร็จสมบูรณ์  
**ระยะเวลา**: 1 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การวางแผนความจุและการตรวจสอบทรัพยากร
- กลยุทธ์การเลือก SKU
- การตรวจสอบก่อนปรับใช้และระบบอัตโนมัติ

#### แหล่งเรียนรู้
- **📊 การวางแผน**: [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) - การตรวจสอบทรัพยากร
- **💰 การเลือก**: [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) - ตัวเลือกที่คุ้มค่า
- **✅ การตรวจสอบ**: [การตรวจสอบก่อนปรับใช้](docs/chapter-06-pre-deployment/preflight-checks.md) - สคริปต์อัตโนมัติ

#### แบบฝึกหัดปฏิบัติ
- รันสคริปต์ตรวจสอบความจุ
- ปรับปรุงการเลือก SKU ให้ประหยัดค่าใช้จ่าย
- นำระบบตรวจสอบก่อนปรับใช้อัตโนมัติมาใช้

**💡 ผลลัพธ์บทเรียน**: ตรวจสอบและปรับปรุงการปรับใช้ก่อนดำเนินงาน

---

### 🚨 บทที่ 7: การแก้ไขปัญหาและการดีบัก
**ข้อกำหนดเบื้องต้น**: เสร็จสิ้นบทใดบทหนึ่งของการปรับใช้  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- วิธีการดีบักอย่างเป็นระบบ
- ปัญหาทั่วไปและวิธีแก้ไข
- การแก้ไขปัญหาเฉพาะ AI

#### แหล่งเรียนรู้
- **🔧 ปัญหาพบบ่อย**: [ปัญหาพบบ่อย](docs/chapter-07-troubleshooting/common-issues.md) - คำถามที่พบบ่อยและวิธีแก้ไข
- **🕵️ การดีบัก**: [คู่มือการดีบัก](docs/chapter-07-troubleshooting/debugging.md) - กลยุทธ์ทีละขั้นตอน
- **🤖 ปัญหา AI**: [การแก้ไขปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - ปัญหาบริการ AI

#### แบบฝึกหัดปฏิบัติ
- วินิจฉัยความล้มเหลวในการปรับใช้
- แก้ไขปัญหาการรับรองความถูกต้อง
- ดีบักการเชื่อมต่อบริการ AI

**💡 ผลลัพธ์บทเรียน**: สามารถวินิจฉัยและแก้ไขปัญหาการปรับใช้ทั่วไปได้ด้วยตนเอง

---

### 🏢 บทที่ 8: รูปแบบการผลิตและองค์กร
**ข้อกำหนดเบื้องต้น**: บทที่ 1-4 เสร็จสมบูรณ์  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- กลยุทธ์การปรับใช้ในการผลิต
- รูปแบบความปลอดภัยองค์กร
- การตรวจสอบและการเพิ่มประสิทธิภาพค่าใช้จ่าย

#### แหล่งเรียนรู้
- **🏭 การผลิต**: [แนวปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต](docs/chapter-08-production/production-ai-practices.md) - รูปแบบองค์กร
- **📝 ตัวอย่าง**: [ตัวอย่างไมโครเซอร์วิส](../../examples/microservices) - สถาปัตยกรรมที่ซับซ้อน
- **📊 การตรวจสอบ**: [การรวม Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - การตรวจสอบ

#### แบบฝึกหัดปฏิบัติ
- นำรูปแบบความปลอดภัยองค์กรมาใช้
- ตั้งค่าการตรวจสอบอย่างครบถ้วน
- ปรับใช้ในระดับการผลิตด้วยการกำกับดูแลที่เหมาะสม

**💡 ผลลัพธ์บทเรียน**: ปรับใช้แอปพลิเคชันสำหรับองค์กรพร้อมความสามารถเต็มที่ในการผลิต

---

## 🎓 ภาพรวมเวิร์กช็อป: ประสบการณ์เรียนรู้แบบปฏิบัติ

> **⚠️ สถานะเวิร์กช็อป: กำลังพัฒนา**  
> วัสดุเวิร์กช็อปกำลังอยู่ระหว่างการพัฒนาและปรับปรุง โมดูลหลักใช้ได้ แต่บางส่วนขั้นสูงยังไม่สมบูรณ์ เรากำลังเร่งทำให้เนื้อหาทั้งหมดเสร็จสมบูรณ์ [ติดตามความคืบหน้า →](workshop/README.md)

### วัสดุเวิร์กช็อปแบบโต้ตอบ
**ประสบการณ์เรียนรู้เชิงปฏิบัติครบถ้วนด้วยเครื่องมือบนเบราว์เซอร์และแบบฝึกหัดที่แนะนำ**

วัสดุเวิร์กช็อปของเรามอบประสบการณ์การเรียนรู้อย่างมีโครงสร้างและโต้ตอบ ซึ่งเสริมหลักสูตรตามบทข้างต้น เวิร์กช็อปนี้ออกแบบสำหรับการเรียนรู้ด้วยตนเองและการสอนโดยผู้สอน

#### 🛠️ คุณสมบัติเวิร์กช็อป
- **อินเทอร์เฟซบนเบราว์เซอร์**: เวิร์กช็อปเต็มรูปแบบที่ใช้ MkDocs พร้อมฟีเจอร์ค้นหา คัดลอก และธีม
- **การรวม GitHub Codespaces**: ตั้งค่าสภาพแวดล้อมการพัฒนาในคลิกเดียว
- **เส้นทางการเรียนรู้อย่างมีโครงสร้าง**: แบบฝึกหัดแนะนำ 8 โมดูล (รวม 3-4 ชั่วโมง)
- **ระเบียบวิธีการเรียนรู้แบบก้าวหน้า**: แนะนำ → การเลือก → การตรวจสอบ → การวิเคราะห์โครงสร้าง → การตั้งค่า → การปรับแต่ง → การล้างข้อมูล → การสรุป
- **สภาพแวดล้อม DevContainer แบบโต้ตอบ**: เครื่องมือและการพึ่งพาก่อนตั้งค่า

#### 📚 โครงสร้างโมดูลเวิร์กช็อป
เวิร์กช็อปนี้ใช้ **ระเบียบวิธีแบบก้าวหน้าจำนวน 8 โมดูล** ซึ่งนำคุณจากการค้นพบไปสู่ความชำนาญในการปรับใช้:

| โมดูล | หัวข้อ | สิ่งที่คุณจะทำ | ระยะเวลา |
|--------|-------|----------------|----------|
| **0. แนะนำ** | ภาพรวมเวิร์กช็อป | เข้าใจวัตถุประสงค์การเรียนรู้ ข้อกำหนดเบื้องต้น และโครงสร้างเวิร์กช็อป | 15 นาที |
| **1. การเลือก** | การค้นหาแม่แบบ | สำรวจแม่แบบ AZD และเลือกแม่แบบ AI ที่เหมาะกับสถานการณ์ของคุณ | 20 นาที |
| **2. การตรวจสอบ** | การปรับใช้และตรวจสอบ | ปรับใช้แม่แบบด้วย `azd up` และตรวจสอบโครงสร้างพื้นฐานทำงานถูกต้อง | 30 นาที |
| **3. การวิเคราะห์โครงสร้าง** | เข้าใจโครงสร้าง | ใช้ GitHub Copilot สำรวจสถาปัตยกรรมแม่แบบ ไฟล์ Bicep และการจัดระเบียบโค้ด | 30 นาที |
| **4. การตั้งค่า** | เจาะลึก azure.yaml | ชำนาญการตั้งค่า `azure.yaml` hooks ชีวิตและตัวแปรสภาพแวดล้อม | 30 นาที |
| **5. การปรับแต่ง** | ทำให้เป็นของคุณ | เปิดใช้งาน AI Search, tracing, การประเมินผล และปรับแต่งให้เหมาะกับสถานการณ์คุณ | 45 นาที |
| **6. การล้างข้อมูล** | ทำความสะอาด | ปลดปล่อยทรัพยากรอย่างปลอดภัยด้วย `azd down --purge` | 15 นาที |
| **7. การสรุป** | ขั้นตอนถัดไป | ทบทวนความสำเร็จ แนวคิดสำคัญ และต่อยอดการเรียนรู้ของคุณ | 15 นาที |

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
# คลิก "Code" → "Create codespace on main" ในรีโพซิทอรี

# ตัวเลือกที่ 2: การพัฒนาแบบ Local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ทำตามคำแนะนำการตั้งค่าใน workshop/README.md
```

#### 🎯 ผลลัพธ์การเรียนรู้เวิร์กช็อป
เมื่อจบเวิร์กช็อป ผู้เข้าร่วมจะสามารถ:
- **ปรับใช้แอปพลิเคชัน AI สำหรับการผลิต**: ใช้ AZD กับบริการ Microsoft Foundry
- **ชำนาญสถาปัตยกรรมตัวแทนหลายตัว**: นำโซลูชัน AI ตัวแทนประสานงานมาใช้
- **ใช้นโยบายความปลอดภัยที่ดีที่สุด**: ตั้งค่าการรับรองและการควบคุมการเข้าถึง
- **เพิ่มประสิทธิภาพสำหรับการขยาย**: ออกแบบการปรับใช้ที่คุ้มค่าและมีประสิทธิภาพ
- **แก้ไขปัญหาการปรับใช้**: แก้ไขปัญหาทั่วไปได้อย่างอิสระ

#### 📖 แหล่งข้อมูลเวิร์กช็อป
- **🎥 คู่มือแบบโต้ตอบ**: [วัสดุเวิร์กช็อป](workshop/README.md) - สภาพแวดล้อมการเรียนรู้บนเบราว์เซอร์
- **📋 คำแนะนำโมดูลต่อโมดูล**:
  - [0. แนะนำ](workshop/docs/instructions/0-Introduction.md) - ภาพรวมและวัตถุประสงค์เวิร์กช็อป
  - [1. การเลือก](workshop/docs/instructions/1-Select-AI-Template.md) - ค้นหาและเลือกแม่แบบ AI
  - [2. การตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) - ปรับใช้และตรวจสอบแม่แบบ
  - [3. การวิเคราะห์โครงสร้าง](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - สำรวจสถาปัตยกรรมแม่แบบ
  - [4. การตั้งค่า](workshop/docs/instructions/4-Configure-AI-Template.md) - เชี่ยวชาญ azure.yaml
  - [5. การปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) - ปรับแต่งให้เหมาะกับสถานการณ์ของคุณ
  - [6. การล้างข้อมูล](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ทำความสะอาดทรัพยากร
  - [7. การสรุป](workshop/docs/instructions/7-Wrap-up.md) - ทบทวนและขั้นตอนถัดไป
- **🛠️ ห้องปฏิบัติการเวิร์กช็อป AI**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - แบบฝึกหัดเน้น AI
- **💡 เริ่มต้นอย่างรวดเร็ว**: [คู่มือการตั้งค่าเวิร์กช็อป](workshop/README.md#quick-start) - การตั้งค่าสภาพแวดล้อม

**เหมาะสำหรับ**: การฝึกอบรมองค์กร หลักสูตรมหาวิทยาลัย การเรียนรู้ด้วยตนเอง และบูทแคมป์นักพัฒนา

---

## 📖 เจาะลึก: ความสามารถของ AZD

นอกเหนือจากพื้นฐานแล้ว AZD ยังมีฟีเจอร์ทรงพลังสำหรับการปรับใช้ในระดับการผลิต:

- **การปรับใช้โดยใช้แม่แบบ** - ใช้แม่แบบที่สร้างไว้ล่วงหน้าสำหรับรูปแบบแอปพลิเคชันทั่วไป
- **โครงสร้างพื้นฐานเป็นโค้ด** - จัดการทรัพยากร Azure ด้วย Bicep หรือ Terraform  
- **เวิร์กโฟลว์แบบบูรณาการ** - บูตเครื่อง ปรับใช้ และตรวจสอบแอปได้อย่างราบรื่น
- **เน้นนักพัฒนา** - ปรับปรุงประสิทธิภาพและประสบการณ์นักพัฒนา

### **AZD + Microsoft Foundry: เหมาะกับการปรับใช้ AI**

**ทำไมต้อง AZD สำหรับโซลูชัน AI?** AZD ตอบโจทย์ความท้าทายหลักที่นักพัฒนา AI เผชิญ:

- **แม่แบบพร้อมใช้งานสำหรับ AI** - แม่แบบตั้งค่าล่วงหน้าสำหรับ Microsoft Foundry Models, บริการ Azure AI และงาน ML
- **การปรับใช้ AI ที่ปลอดภัย** - รูปแบบความปลอดภัยในตัวสำหรับบริการ AI, คีย์ API และจุดเชื่อมต่อโมเดล  
- **รูปแบบ AI สำหรับการผลิต** - แนวปฏิบัติที่ดีที่สุดสำหรับการปรับใช้แอป AI ที่ขยายได้และคุ้มค่าต้นทุน
- **เวิร์กโฟลว์ AI ตั้งแต่ต้นจนจบ** - ตั้งแต่การพัฒนาโมเดลจนถึงการปรับใช้จริงพร้อมการตรวจสอบที่เหมาะสม
- **การเพิ่มประสิทธิภาพค่าใช้จ่าย** - การจัดสรรทรัพยากรและการขยายอย่างชาญฉลาดสำหรับงาน AI
- **การรวม Microsoft Foundry** - การเชื่อมต่อที่ราบรื่นกับแค็ตตาล็อกและจุดเชื่อมต่อของ Microsoft Foundry

---

## 🎯 ห้องสมุดแม่แบบและตัวอย่าง

### แนะนำ: แม่แบบ Microsoft Foundry
**เริ่มที่นี่ถ้าคุณกำลังปรับใช้แอป AI!**

> **หมายเหตุ:** แม่แบบเหล่านี้แสดงรูปแบบต่าง ๆ ของ AI บางส่วนเป็นตัวอย่าง Azure ภายนอก บางส่วนเป็นการใช้งานในเครื่อง

| แม่แบบ | บท | ความซับซ้อน | บริการ | ประเภท |
|----------|---------|------------|----------|------|
| [**เริ่มต้นกับ AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ภายนอก |
| [**เริ่มต้นกับ AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | บทที่ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ภายนอก |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ภายนอก |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ภายนอก |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ภายนอก |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ภายนอก |
| [**โซลูชัน AI แบบหลายตัวแทนสำหรับค้าปลีก**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ในเครื่อง** |

### แนะนำ: สถานการณ์การเรียนรู้ที่ครบถ้วน
**แม่แบบแอปที่พร้อมใช้งานจริงตามบทเรียนที่แยกตามบทเรียน**

| แม่แบบ | บทเรียน | ความซับซ้อน | การเรียนรู้หลัก |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | รูปแบบการปรับใช้ AI เบื้องต้น |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | การใช้งาน RAG กับ Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | บทที่ 4 | ⭐⭐ | การรวมเทคโนโลยี Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | เฟรมเวิร์กตัวแทนและการเรียกใช้ฟังก์ชัน |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐ | การประสานงาน AI สำหรับองค์กร |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | สถาปัตยกรรมหลายตัวแทนด้วยตัวแทนลูกค้าและสินค้าคงคลัง |

### เรียนรู้ตามประเภทตัวอย่าง

> **📌 ตัวอย่างภายในเครื่อง vs. ภายนอก:**  
> **ตัวอย่างภายในเครื่อง** (ในรีโปนี้) = พร้อมใช้งานทันที  
> **ตัวอย่างภายนอก** (ตัวอย่าง Azure) = โคลนจากรีโปที่ลิงก์ไว้

#### ตัวอย่างภายในเครื่อง (พร้อมใช้งาน)
- [**โซลูชัน AI แบบหลายตัวแทนสำหรับค้าปลีก**](examples/retail-scenario.md) - การใช้งานครบถ้วนที่พร้อมสำหรับการผลิตพร้อมแม่แบบ ARM
  - สถาปัตยกรรมหลายตัวแทน (ตัวแทนลูกค้า + ตัวแทนสินค้าคงคลัง)
  - การตรวจสอบและการประเมินผลอย่างครอบคลุม
  - ปรับใช้ในคลิกเดียวผ่านแม่แบบ ARM

#### ตัวอย่างภายในเครื่อง - แอปพลิเคชันคอนเทนเนอร์ (บทที่ 2-5)
**ตัวอย่างการปรับใช้คอนเทนเนอร์ครบถ้วนในรีโปนี้:**

- [**ตัวอย่างแอปคอนเทนเนอร์**](examples/container-app/README.md) - คู่มือครบถ้วนสำหรับการปรับใช้แบบคอนเทนเนอร์
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - REST API พื้นฐานพร้อมการปรับสเกลเป็นศูนย์
  - [สถาปัตยกรรมไมโครเซอร์วิส](../../examples/container-app/microservices) - การปรับใช้หลายบริการพร้อมสำหรับโปรดักชัน
  - รูปแบบการเริ่มต้นอย่างรวดเร็ว, โปรดักชัน, และขั้นสูง
  - คำแนะนำด้านการตรวจสอบ, ความปลอดภัย และการปรับต้นทุนให้เหมาะสม

#### ตัวอย่างภายนอก - แอปพลิเคชันง่ายๆ (บทที่ 1-2)
**โคลนคลังตัวอย่าง Azure เหล่านี้เพื่อเริ่มต้น:**
- [แอปเว็บง่ายๆ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - รูปแบบการปรับใช้พื้นฐาน
- [เว็บไซต์สถิติก์ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - การปรับใช้เนื้อหาสถิติก์
- [แอปคอนเทนเนอร์ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - การปรับใช้ REST API

#### ตัวอย่างภายนอก - การผสานฐานข้อมูล (บทที่ 3-4)  
- [แอปฐานข้อมูล - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - รูปแบบการเชื่อมต่อฐานข้อมูล
- [ฟังก์ชัน + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - เวิร์กโฟลว์ข้อมูลแบบเซิร์ฟเวอร์เลส

#### ตัวอย่างภายนอก - รูปแบบขั้นสูง (บทที่ 4-8)
- [ไมโครเซอร์วิส Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - สถาปัตยกรรมหลายบริการ
- [งาน Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - การประมวลผลเบื้องหลัง  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - รูปแบบ ML พร้อมสำหรับโปรดักชัน

### คอลเลกชันเทมเพลตภายนอก
- [**คอลเลกชันเทมเพลต AZD อย่างเป็นทางการ**](https://azure.github.io/awesome-azd/) - คอลเลกชันเทมเพลตอย่างเป็นทางการและชุมชนที่คัดสรรแล้ว
- [**เทมเพลต Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - เอกสารเทมเพลตจาก Microsoft Learn
- [**ไดเรกทอรีตัวอย่าง**](examples/README.md) - ตัวอย่างการเรียนรู้ในเครื่องพร้อมคำอธิบายอย่างละเอียด

---

## 📚 แหล่งข้อมูลการเรียนรู้ & การอ้างอิง

### อ้างอิงด่วน
- [**แผ่นคำสั่งอย่างย่อ**](resources/cheat-sheet.md) - คำสั่ง azd สำคัญจัดเรียงตามบท
- [**อภิธานศัพท์**](resources/glossary.md) - คำศัพท์ Azure และ azd  
- [**คำถามที่พบบ่อย**](resources/faq.md) - คำถามทั่วไปจัดเรียงตามบทเรียน
- [**คู่มือการศึกษา**](resources/study-guide.md) - แบบฝึกหัดเชิงปฏิบัติครบถ้วน

### เวิร์กช็อปแบบลงมือทำ
- [**ห้องทดลองเวิร์กช็อป AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำให้โซลูชัน AI ของคุณสามารถปรับใช้ด้วย AZD (2-3 ชั่วโมง)
- [**เวิร์กช็อปแบบโต้ตอบ**](workshop/README.md) - แบบฝึกหัดแปดโมดูลแนะนำด้วย MkDocs และ GitHub Codespaces
  - ตามลำดับ: บทนำ → เลือก → ตรวจสอบ → แตกส่วน → กำหนดค่า → ปรับแต่ง → ยกเลิก → สรุป

### แหล่งการเรียนรู้นอก
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [เครื่องมือคำนวณราคาของ Azure](https://azure.microsoft.com/pricing/calculator/)
- [สถานะ Azure](https://status.azure.com/)

### ทักษะ AI Agent สำหรับโปรแกรมแก้ไขของคุณ
- [**ทักษะ Microsoft Azure บน skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - ทักษะตัวแทน 37 รายการสำหรับ Azure AI, Foundry, การปรับใช้, การวินิจฉัย, การปรับต้นทุนให้เหมาะสม และอื่น ๆ ติดตั้งได้ใน GitHub Copilot, Cursor, Claude Code หรือเอเจนต์ที่รองรับ:
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
<summary><strong>❌ "ไม่พบการสมัครใช้บริการ" หรือ "ยังไม่ได้ตั้งค่าสมัครใช้บริการ"</strong></summary>

```bash
# แสดงรายการการสมัครใช้งานที่มี
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
<summary><strong>❌ "โควต้าไม่เพียงพอ" หรือ "เกินโควต้า"</strong></summary>

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
<summary><strong>❌ "azd up" ล้มเหลวกลางทาง</strong></summary>

```bash
# ตัวเลือกที่ 1: ทำความสะอาดและลองใหม่อีกครั้ง
azd down --force --purge
azd up

# ตัวเลือกที่ 2: แก้ไขเฉพาะโครงสร้างพื้นฐาน
azd provision

# ตัวเลือกที่ 3: ตรวจสอบสถานะโดยละเอียด
azd show

# ตัวเลือกที่ 4: ตรวจสอบบันทึกใน Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "การตรวจสอบสิทธิ์ล้มเหลว" หรือ "โทเค็นหมดอายุ"</strong></summary>

```bash
# รับรองตัวตนอีกครั้งสำหรับ AZD
azd auth logout
azd auth login

# ไม่จำเป็น: รีเฟรช Azure CLI ด้วยหากคุณกำลังใช้คำสั่ง az
az logout
az login

# ตรวจสอบการรับรองตัวตน
az account show
```
</details>

<details>
<summary><strong>❌ "ทรัพยากรมีอยู่แล้ว" หรือ ข้อขัดแย้งของชื่อ</strong></summary>

```bash
# AZD สร้างชื่อที่ไม่ซ้ำกัน แต่ถ้ามีความขัดแย้ง:
azd down --force --purge

# จากนั้นลองใหม่ด้วยสภาพแวดล้อมใหม่
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ การปรับใช้เทมเพลตช้าเกินไป</strong></summary>

**เวลารอปกติ:**
- แอปเว็บง่ายๆ: 5-10 นาที
- แอปที่มีฐานข้อมูล: 10-15 นาที
- แอป AI: 15-25 นาที (การจัดสรร OpenAI ช้ากว่า)

```bash
# ตรวจสอบความคืบหน้า
azd show

# หากติดอยู่เกิน 30 นาที ให้ตรวจสอบพอร์ทัล Azure:
azd monitor --overview
# มองหาการปรับใช้งานที่ล้มเหลว
```
</details>

<details>
<summary><strong>❌ "ไม่ได้รับอนุญาต" หรือ "ถูกห้าม"</strong></summary>

```bash
# ตรวจสอบบทบาท Azure ของคุณ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# คุณต้องมีบทบาทอย่างน้อย "ผู้ร่วมให้ข้อมูล"
# ขอให้ผู้ดูแลระบบ Azure ของคุณอนุญาต:
# - ผู้ร่วมให้ข้อมูล (สำหรับทรัพยากร)
# - ผู้ดูแลการเข้าถึงผู้ใช้ (สำหรับการกำหนดบทบาท)
```
</details>

<details>
<summary><strong>❌ ไม่พบ URL ของแอปที่ปรับใช้</strong></summary>

```bash
# แสดงจุดสิ้นสุดของบริการทั้งหมด
azd show

# หรือเปิด Azure Portal
azd monitor

# ตรวจสอบบริการเฉพาะ
azd env get-values
# ค้นหาตัวแปร *_URL
```
</details>

### 📚 แหล่งข้อมูลการแก้ไขปัญหาแบบครบถ้วน

- **คู่มือปัญหาทั่วไป:** [การแก้ไขปัญหาอย่างละเอียด](docs/chapter-07-troubleshooting/common-issues.md)
- **ปัญหาเฉพาะ AI:** [แก้ไขปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **คู่มือดีบั๊ก:** [ขั้นตอนดีบั๊กอย่างละเอียด](docs/chapter-07-troubleshooting/debugging.md)
- **ขอความช่วยเหลือ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 การสำเร็จหลักสูตร & การรับรอง

### การติดตามความก้าวหน้า
ติดตามความก้าวหน้าการเรียนรู้ในแต่ละบท:

- [ ] **บทที่ 1**: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว ✅
- [ ] **บทที่ 2**: การพัฒนา AI-First ✅  
- [ ] **บทที่ 3**: การกำหนดค่า & การตรวจสอบสิทธิ์ ✅
- [ ] **บทที่ 4**: โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้ ✅
- [ ] **บทที่ 5**: โซลูชัน AI หลายเอเจนต์ ✅
- [ ] **บทที่ 6**: การตรวจสอบก่อนปรับใช้ & การวางแผน ✅
- [ ] **บทที่ 7**: การแก้ไขปัญหา & การดีบั๊ก ✅
- [ ] **บทที่ 8**: รูปแบบโปรดักชัน & องค์กร ✅

### การตรวจสอบการเรียนรู้
หลังจากสำเร็จแต่ละบท ให้ตรวจสอบความรู้โดย:
1. **แบบฝึกหัดปฏิบัติ**: ทำการปรับใช้เชิงปฏิบัติในบท
2. **การทบทวนความรู้**: ดูส่วนคำถามที่พบบ่อยของบทนั้น
3. **การอภิปรายชุมชน**: แชร์ประสบการณ์ของคุณใน Azure Discord
4. **บทถัดไป**: ก้าวไปยังระดับความซับซ้อนถัดไป

### สิทธิประโยชน์จากการสำเร็จหลักสูตร
เมื่อสำเร็จทุกบท คุณจะได้รับ:
- **ประสบการณ์โปรดักชัน**: ปรับใช้แอป AI จริงบน Azure
- **ทักษะมืออาชีพ**: ความสามารถในการปรับใช้ในระดับองค์กร  
- **การยอมรับในชุมชน**: สมาชิกที่มีส่วนร่วมในชุมชนผู้พัฒนา Azure
- **ความก้าวหน้าในอาชีพ**: ความเชี่ยวชาญ AZD และ AI ที่เป็นที่ต้องการ

---

## 🤝 ชุมชน & การสนับสนุน

### ขอความช่วยเหลือ & การสนับสนุน
- **ปัญหาด้านเทคนิค**: [รายงานบั๊กและขอคุณสมบัติใหม่](https://github.com/microsoft/azd-for-beginners/issues)
- **คำถามการเรียนรู้**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) และ [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ความช่วยเหลือเฉพาะ AI**: เข้าร่วม [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **เอกสาร**: [เอกสาร Azure Developer CLI อย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### ข้อมูลเชิงลึกจากชุมชน Microsoft Foundry Discord

**ผลการสำรวจล่าสุดจากช่อง #Azure:**
- **45%** ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI
- **ความท้าทายสูงสุด**: การปรับใช้หลายบริการ, การจัดการข้อมูลรับรอง, ความพร้อมใช้งานโปรดักชัน  
- **ที่ถูกขอมากที่สุด**: เทมเพลตเฉพาะ AI, คู่มือแก้ไขปัญหา, แนวทางปฏิบัติที่ดีที่สุด

**เข้าร่วมชุมชนของเราเพื่อ:**
- แชร์ประสบการณ์ AZD + AI และรับความช่วยเหลือ
- เข้าถึงตัวอย่างเทมเพลต AI ใหม่ก่อนใคร
- มีส่วนร่วมในแนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้ AI
- มีอิทธิพลต่อการพัฒนาฟีเจอร์ AI + AZD ในอนาคต

### การมีส่วนร่วมกับหลักสูตร
เรายินดีต้อนรับการมีส่วนร่วม! กรุณาอ่าน [คู่มือการมีส่วนร่วม](CONTRIBUTING.md) สำหรับรายละเอียดเกี่ยวกับ:
- **การปรับปรุงเนื้อหา**: พัฒนาบทเรียนและตัวอย่างเดิม
- **ตัวอย่างใหม่**: เพิ่มสถานการณ์จริงและเทมเพลต  
- **การแปลภาษา**: ช่วยรักษาความสนับสนุนหลายภาษา
- **รายงานบั๊ก**: ปรับปรุงความถูกต้องและความชัดเจน
- **มาตรฐานชุมชน**: ปฏิบัติตามแนวทางชุมชนที่ครอบคลุม

---

## 📄 ข้อมูลหลักสูตร

### สิทธิ์ใช้งาน
โครงการนี้ได้รับอนุญาตภายใต้ใบอนุญาต MIT - ดูไฟล์ [LICENSE](../../LICENSE) สำหรับรายละเอียดเพิ่มเติม

### แหล่งเรียนรู้ที่เกี่ยวข้องจาก Microsoft

ทีมของเราผลิตหลักสูตรการเรียนรู้อื่นๆ ที่ครอบคลุม:

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
 
### ชุดหลักสูตร Generative AI
[![Generative AI สำหรับผู้เริ่มต้น](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### การเรียนรู้หลัก
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ชุดการเรียนรู้ Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ การนำทางหลักสูตร

**🚀 พร้อมเริ่มเรียนรู้หรือยัง?**

**ผู้เริ่มต้น**: เริ่มต้นที่ [บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว](#-chapter-1-foundation--quick-start)  
**นักพัฒนา AI**: ข้ามไปที่ [บทที่ 2: การพัฒนา AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**นักพัฒนาที่มีประสบการณ์**: เริ่มที่ [บทที่ 3: การตั้งค่า & การพิสูจน์ตัวตน](#️-chapter-3-configuration--authentication)

**ขั้นตอนถัดไป**: [เริ่มบทที่ 1 - พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->