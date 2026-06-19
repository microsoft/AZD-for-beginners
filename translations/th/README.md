# AZD สำหรับผู้เริ่มต้น: การเรียนรู้ที่มีโครงสร้าง

![AZD-for-beginners](../../translated_images/th/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### การแปลอัตโนมัติ (อัปเดตอยู่เสมอ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](./README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ต้องการโคลนไฟล์ในเครื่อง?**
>
> ที่เก็บนี้มีการแปลมากกว่า 50 ภาษา ซึ่งเพิ่มขนาดไฟล์ดาวน์โหลดอย่างมาก หากต้องการโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
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
> วิธีนี้จะให้ทุกสิ่งที่คุณต้องการเพื่อทำหลักสูตรให้เสร็จโดยดาวน์โหลดเร็วขึ้นมาก
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 มีอะไรใหม่ใน azd วันนี้

> 📌 หลักสูตรนี้ผ่านการตรวจสอบกับ **`azd 1.25.6`** (มิถุนายน 2026) ใช้คำสั่ง `azd version` เพื่อตรวจสอบเวอร์ชันปัจจุบัน และ `azd upgrade` เพื่ออัปเดตเป็นเวอร์ชันล่าสุด

Azure Developer CLI เติบโตขึ้นเกินกว่าการใช้งานเว็บแอปและ API แบบดั้งเดิม ตอนนี้ azd เป็นเครื่องมือเดียวสำหรับการปรับใช้แอปพลิเคชัน **ทุกรูปแบบ** ไปยัง Azure — รวมถึงแอปพลิเคชันที่ขับเคลื่อนด้วย AI และตัวแทนอัจฉริยะ

นี่คือสิ่งที่หมายถึงสำหรับคุณ:

- **ตัวแทน AI เป็นภาระงาน azd ชั้นหนึ่งแล้ว** คุณสามารถเริ่มต้น ปรับใช้ และจัดการโครงการตัวแทน AI โดยใช้ workflow เดียวกับที่คุณรู้จัก `azd init` → `azd up`
- **วงจรชีวิตของตัวแทนครบถ้วนจาก CLI** ส่วนขยาย `azure.ai.agents` ครอบคลุมการทำงานทั้งหมด—`azd ai agent init` เพื่อสร้างโครง, `azd ai agent invoke` เพื่อทดสอบ (พร้อมแสดงเวลาตอบสนอง), `azd ai agent eval generate` และ `azd ai agent optimize` เพื่อวัดและปรับปรุงคุณภาพ และ `azd ai agent delete` เพื่อล้างข้อมูล
- **บล็อกการสร้าง AI เพิ่มเติม** ส่วนขยายตัวอย่างใหม่—`azure.ai.skills` และ `azure.ai.connections`—ช่วยให้จัดการทักษะตัวแทนซ้ำได้และการเชื่อมต่อ Foundry โดยตรงกับ azd
- **การผสานรวม Microsoft Foundry** นำการปรับใช้โมเดล, โฮสต์ตัวแทน, และการกำหนดค่าบริการ AI เข้าไปในระบบแม่แบบ azd โดยตรง
- **พื้นฐานการใช้งานประจำวันที่ราบรื่นยิ่งขึ้น** การออกอัปเดตตั้งแต่ล่าสุดทำให้ `azd init` ทำงานซ้ำได้อย่างปลอดภัย, `azd auth login` ล้างโทเคนเก่าโดยอัตโนมัติ และเพิ่มพรอมต์การตั้งค่า `azd tool` ครั้งแรกอย่างเป็นมิตร
- **Workflow หลักไม่มีการเปลี่ยนแปลง** ไม่ว่าคุณจะปรับใช้แอป to-do, ไมโครเซอร์วิส, หรือโซลูชัน AI หลายตัวแทน คำสั่งก็เหมือนเดิม

> **หมายเหตุสำหรับผู้ใช้ Aspire:** Microsoft เรียกผลิตภัณฑ์นี้เพียงชื่อ **Aspire** (เดิม ".NET Aspire") การสนับสนุน Aspire ของ azd ไม่เปลี่ยนแปลง—มีเพียงชื่อที่ปรับใหม่

หากคุณเคยใช้ azd มาก่อน การสนับสนุน AI เป็นเพียงส่วนขยายธรรมชาติ — ไม่ใช่เครื่องมือแยกหรือเส้นทางขั้นสูง หากคุณเริ่มต้นใหม่ คุณจะได้เรียนรู้ workflow เดียวที่ใช้ได้ทุกอย่าง

---

## 🚀 Azure Developer CLI (azd) คืออะไร?

**Azure Developer CLI (azd)** คือเครื่องมือบรรทัดคำสั่งที่เป็นมิตรสำหรับนักพัฒนา ช่วยให้การปรับใช้แอปพลิเคชันไปยัง Azure ง่ายขึ้น แทนที่จะสร้างและเชื่อมต่อทรัพยากร Azure ทีละหลายรายการ คุณสามารถปรับใช้แอปพลิเคชันทั้งหมดด้วยคำสั่งเดียว

### ความมหัศจรรย์ของ `azd up`

```bash
# คำสั่งเดียวนี้ทำทุกอย่าง:
# ✅ สร้างทรัพยากร Azure ทั้งหมด
# ✅ กำหนดค่าเครือข่ายและความปลอดภัย
# ✅ สร้างโค้ดแอปพลิเคชันของคุณ
# ✅ ปรับใช้ไปยัง Azure
# ✅ ให้ URL ที่ใช้งานได้
azd up
```

**แค่นั้นเอง!** ไม่ต้องคลิกผ่าน Azure Portal, ไม่ต้องเรียนรู้เทมเพลต ARM ที่ซับซ้อน, ไม่ต้องตั้งค่าด้วยตนเอง—แค่แอปที่ทำงานบน Azure

---

## ❓ Azure Developer CLI กับ Azure CLI ต่างกันอย่างไร?

นี่คือคำถามที่ผู้เริ่มต้นถามบ่อยที่สุด นี่คือคำตอบง่ายๆ:

| คุณสมบัติ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **วัตถุประสงค์** | จัดการทรัพยากร Azure ทีละรายการ | ปรับใช้แอปพลิเคชันครบชุด |
| **ทัศนคติ** | มุ่งเน้นโครงสร้างพื้นฐาน | มุ่งเน้นแอปพลิเคชัน |
| **ตัวอย่าง** | `az webapp create --name myapp...` | `azd up` |
| **ความยากในการเรียนรู้** | ต้องรู้บริการ Azure | แค่รู้แอปของคุณ |
| **เหมาะสำหรับ** | DevOps, โครงสร้างพื้นฐาน | นักพัฒนา, ต้นแบบ |

### อุปมาอุปมัยง่ายๆ

- **Azure CLI** เหมือนมีเครื่องมือครบสำหรับสร้างบ้าน — ค้อน, เลื่อย, ตะปู คุณสามารถสร้างอะไรก็ได้ แต่ต้องรู้เรื่องก่อสร้าง
- **Azure Developer CLI** เหมือนจ้างผู้รับเหมา — บอกความต้องการ แล้วเขาจะจัดการก่อสร้างให้

### เมื่อใดควรใช้แต่ละแบบ

| สถานการณ์ | ควรใช้แบบนี้ |
|----------|----------|
| "ฉันต้องการปรับใช้เว็บแอปอย่างรวดเร็ว" | `azd up` |
| "ฉันต้องสร้างบัญชีเก็บข้อมูลเท่านั้น" | `az storage account create` |
| "ฉันสร้างแอป AI เต็มรูปแบบ" | `azd init --template azure-search-openai-demo` |
| "ฉันต้องการดีบักทรัพยากร Azure เฉพาะ" | `az resource show` |
| "ฉันต้องการปรับใช้จริงพร้อมใช้งานในไม่กี่นาที" | `azd up --environment production` |

### พวกมันทำงานร่วมกันได้!

AZD ใช้ Azure CLI เป็นฐาน คุณสามารถใช้ทั้งสองอย่างด้วยกัน:
```bash
# ปรับใช้แอปของคุณด้วย AZD
azd up

# จากนั้นปรับแต่งทรัพยากรเฉพาะด้วย Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 ค้นหาแม่แบบใน Awesome AZD

อย่าเริ่มจากศูนย์! **Awesome AZD** คือแหล่งรวบรวมแม่แบบที่พร้อมปรับใช้ในชุมชน:

| ทรัพยากร | รายละเอียด |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | เรียกดูแม่แบบกว่า 200 แบบ พร้อมปรับใช้ด้วยคลิกเดียว |
| 🔗 [**ส่งแม่แบบ**](https://github.com/Azure/awesome-azd/issues) | ร่วมแบ่งปันแม่แบบของคุณกับชุมชน |
| 🔗 [**ที่เก็บ GitHub**](https://github.com/Azure/awesome-azd) | กดดาวและสำรวจซอร์สโค้ด |

### แม่แบบ AI ยอดนิยมจาก Awesome AZD

```bash
# RAG แชทกับโมเดล Microsoft Foundry + การค้นหา AI
azd init --template azure-search-openai-demo

# แอปแชท AI แบบรวดเร็ว
azd init --template openai-chat-app-quickstart

# เอเย่นต์ AI กับเอเย่นต์จาก Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 เริ่มต้นใน 3 ขั้นตอน

ก่อนเริ่ม ให้ตรวจสอบว่าเครื่องของคุณพร้อมสำหรับแม่แบบที่ต้องการปรับใช้:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

หากมีการตรวจสอบใดล้มเหลว ให้แก้ไขก่อนแล้วค่อยดำเนินการต่อกับการเริ่มต้นอย่างรวดเร็ว

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

### ขั้นตอนที่ 2: ยืนยันตัวตนสำหรับ AZD

```bash
# ไม่จำเป็นหากคุณวางแผนที่จะใช้คำสั่ง Azure CLI โดยตรงในหลักสูตรนี้
az login

# จำเป็นสำหรับเวิร์กโฟลว์ของ AZD
azd auth login
```

ถ้าคุณไม่แน่ใจว่าควรใช้แบบไหน ให้ทำตามเวิร์กโฟลว์ตั้งค่าฉบับเต็มที่ [การติดตั้งและตั้งค่า](docs/chapter-01-foundation/installation.md#authentication-setup)

### ขั้นตอนที่ 3: ปรับใช้แอปแรกของคุณ

```bash
# เริ่มต้นจากเทมเพลต
azd init --template todo-nodejs-mongo

# ปรับใช้ไปยัง Azure (สร้างทุกอย่าง!)
azd up
```

**🎉 เสร็จแล้ว!** แอปของคุณตอนนี้ใช้งานบน Azure แล้ว

### ทำความสะอาด (อย่าลืม!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 วิธีใช้หลักสูตรนี้

หลักสูตรนี้ออกแบบมาให้เรียนรู้แบบค่อยเป็นค่อยไป — เริ่มต้นที่ระดับที่คุณถนัดและก้าวไปข้างหน้า:

| ประสบการณ์ของคุณ | เริ่มที่นี่ |
|-----------------|------------|
| **ใหม่กับ Azure** | [บทที่ 1: พื้นฐาน](#-chapter-1-foundation--quick-start) |
| **รู้จัก Azure แต่ใหม่กับ AZD** | [บทที่ 1: พื้นฐาน](#-chapter-1-foundation--quick-start) |
| **ต้องการปรับใช้แอป AI** | [บทที่ 2: การพัฒนา AI เป็นอันดับแรก](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **ต้องการฝึกปฏิบัติจริง** | [🎓 การอบรมเชิงปฏิบัติการแบบโต้ตอบ](workshop/README.md) - ห้องทดลองแนะนำ 3-4 ชั่วโมง |
| **ต้องการรูปแบบสำหรับการผลิต** | [บทที่ 8: การผลิตและองค์กร](#-chapter-8-production--enterprise-patterns) |

### การตั้งค่าอย่างรวดเร็ว

1. **Fork ที่เก็บนี้**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **โคลนมัน**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ขอความช่วยเหลือ**: [ชุมชน Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **ต้องการโคลนไฟล์ในเครื่อง?**

> ที่เก็บนี้มีการแปลมากกว่า 50 ภาษา ซึ่งเพิ่มขนาดไฟล์ดาวน์โหลดอย่างมาก หากต้องการโคลนโดยไม่รวมการแปล ให้ใช้ sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> วิธีนี้จะให้ทุกสิ่งที่คุณต้องการเพื่อทำหลักสูตรให้เสร็จโดยดาวน์โหลดเร็วขึ้นมาก


## ภาพรวมหลักสูตร

เป็นผู้เชี่ยวชาญ Azure Developer CLI (azd) ผ่านบทต่างๆ ที่ออกแบบมาเพื่อการเรียนรู้อย่างต่อเนื่อง โดยเน้นเป็นพิเศษที่การปรับใช้แอป AI พร้อมการผสานรวม Microsoft Foundry
### ทำไมคอร์สนี้จึงจำเป็นสำหรับนักพัฒนายุคใหม่

จากข้อคิดเห็นของชุมชน Microsoft Foundry Discord, **45% ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI** แต่พบกับความท้าทายในเรื่อง:
- สถาปัตยกรรม AI หลายบริการที่ซับซ้อน
- แนวทางปฏิบัติที่ดีที่สุดในการนำ AI เข้าสู่การผลิต  
- การผสานรวมและการตั้งค่าบริการ Azure AI
- การเพิ่มประสิทธิภาพต้นทุนสำหรับงาน AI
- การแก้ไขปัญหาเฉพาะสำหรับการนำ AI ไปใช้งาน

### วัตถุประสงค์การเรียนรู้

เมื่อคุณสำเร็จคอร์สนี้ที่มีโครงสร้าง คุณจะได้:
- **ชำนาญพื้นฐาน AZD**: แนวคิดหลัก, การติดตั้ง และการตั้งค่า
- **นำแอป AI ขึ้นใช้งาน**: ใช้ AZD กับบริการ Microsoft Foundry
- **ใช้งาน Infrastructure as Code**: จัดการทรัพยากร Azure ด้วยแม่แบบ Bicep
- **แก้ไขปัญหาการนำขึ้นใช้งาน**: แก้ไขปัญหาทั่วไปและดีบัก
- **เพิ่มประสิทธิภาพสำหรับการผลิต**: ความปลอดภัย, การขยายทรัพยากร, การติดตาม และการจัดการต้นทุน
- **สร้างโซลูชัน Multi-Agent**: นำสถาปัตยกรรม AI ที่ซับซ้อนขึ้นใช้งาน

## ก่อนเริ่ม: บัญชี, การเข้าถึง และสมมติฐาน

ก่อนเริ่มบทที่ 1 ตรวจสอบให้แน่ใจว่าคุณมีสิ่งต่อไปนี้ ขั้นตอนการติดตั้งในคู่มือต่อไปนี้สมมติว่าคุณได้จัดการสิ่งพื้นฐานเหล่านี้แล้ว

- **บัญชีสมัครใช้งาน Azure**: คุณสามารถใช้บัญชีสมัครใช้งานที่มีอยู่จากที่ทำงานหรือบัญชีของคุณเอง หรือสร้าง [ทดลองใช้ฟรี](https://aka.ms/azurefreetrial) เพื่อเริ่มต้นได้
- **สิทธิ์สร้างทรัพยากร Azure**: สำหรับการฝึกหัดส่วนใหญ่ คุณควรมีสิทธิ์ **Contributor** อย่างน้อยบนบัญชีสมัครใช้งานหรือกลุ่มทรัพยากรเป้าหมาย บางบทเรียนอาจสมมติว่าคุณสามารถสร้างกลุ่มทรัพยากร, Managed Identities และการกำหนด RBAC ได้
- [**บัญชี GitHub**](https://github.com): มีประโยชน์สำหรับการ fork repository, ติดตามการเปลี่ยนแปลงของคุณเอง และใช้ GitHub Codespaces สำหรับเวิร์กช็อป
- **สิ่งที่ต้องติดตั้งตามแม่แบบ**: แม่แบบบางตัวต้องใช้เครื่องมือท้องถิ่นเช่น Node.js, Python, Java หรือ Docker ให้รันตัวตรวจสอบการตั้งค่าก่อนเริ่มเพื่อป้องกันเครื่องมือหาย
- **ความคุ้นเคยกับเทอร์มินัลพื้นฐาน**: ไม่จำเป็นต้องเชี่ยวชาญ แต่ควรรันคำสั่งเช่น `git clone`, `azd auth login`, และ `azd up` ได้อย่างสบาย

> **ทำงานในบัญชีองค์กรหรือไม่?**  
> หากสภาพแวดล้อม Azure ของคุณถูกดูแลโดยผู้ดูแลระบบ ให้ยืนยันล่วงหน้าว่าคุณสามารถนำทรัพยากรขึ้นในบัญชีสมัครใช้งานหรือกลุ่มทรัพยากรที่วางแผนจะใช้ได้หรือไม่ หากไม่ได้ ขอบัญชี sandbox หรือตำแหน่ง Contributor ก่อนเริ่ม

> **ใหม่กับ Azure?**  
> เริ่มต้นด้วยบัญชีทดลองใช้งาน Azure ของคุณเองหรือบัญชีจ่ายตามการใช้งานที่ https://aka.ms/azurefreetrial เพื่อให้คุณสามารถทำแบบฝึกหัดจนจบได้โดยไม่ต้องรอการอนุมัติระดับผู้เช่า

## 🗺️ แผนผังคอร์ส: นำทางเร็วตามบทเรียน

แต่ละบทมี README เฉพาะ พร้อมทั้งวัตถุประสงค์การเรียนรู้, การเริ่มต้นอย่างรวดเร็ว และแบบฝึกหัด:

| บทเรียน | หัวข้อ | บทเรียน | ระยะเวลา | ความซับซ้อน |
|---------|-------|---------|----------|------------|
| **[บทที่ 1: พื้นฐาน](docs/chapter-01-foundation/README.md)** | เริ่มต้น | [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [การติดตั้ง](docs/chapter-01-foundation/installation.md) &#124; [โปรเจกต์แรก](docs/chapter-01-foundation/first-project.md) | 30-45 นาที | ⭐ |
| **[บทที่ 2: การพัฒนา AI](docs/chapter-02-ai-development/README.md)** | แอป AI-First | [ผสานรวม Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [การนำโมเดลขึ้นใช้งาน](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [เวิร์กช็อป](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ชั่วโมง | ⭐⭐ |
| **[บทที่ 3: การตั้งค่า](docs/chapter-03-configuration/README.md)** | การพิสูจน์ตัวตน & ความปลอดภัย | [การตั้งค่า](docs/chapter-03-configuration/configuration.md) &#124; [พิสูจน์ตัวตน & ความปลอดภัย](docs/chapter-03-configuration/authsecurity.md) | 45-60 นาที | ⭐⭐ |
| **[บทที่ 4: โครงสร้างพื้นฐาน](docs/chapter-04-infrastructure/README.md)** | IaC & การนำขึ้นใช้งาน | [คู่มือการนำขึ้นใช้งาน](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [การ provision](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ชั่วโมง | ⭐⭐⭐ |
| **[บทที่ 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | โซลูชัน AI Agent | [สถานการณ์ค้าปลีก](examples/retail-scenario.md) &#124; [รูปแบบการประสานงาน](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ชั่วโมง | ⭐⭐⭐⭐ |
| **[บทที่ 6: ก่อนนำขึ้นใช้งาน](docs/chapter-06-pre-deployment/README.md)** | การวางแผน & ตรวจสอบ | [ตรวจสอบขั้นตอนก่อนบิน](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [การวางแผนความจุ](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ชั่วโมง | ⭐⭐ |
| **[บทที่ 7: แก้ไขปัญหา](docs/chapter-07-troubleshooting/README.md)** | ดีบัก & แก้ไข | [ปัญหาทั่วไป](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ดีบัก](docs/chapter-07-troubleshooting/debugging.md) &#124; [ปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ชั่วโมง | ⭐⭐ |
| **[บทที่ 8: การผลิต](docs/chapter-08-production/README.md)** | รูปแบบองค์กร | [แนวทางการผลิต](docs/chapter-08-production/production-ai-practices.md) | 2-3 ชั่วโมง | ⭐⭐⭐⭐ |
| **[🎓 เวิร์กช็อป](workshop/README.md)** | ห้องปฏิบัติการภาคปฏิบัติ | [แนะนำ](workshop/docs/instructions/0-Introduction.md) &#124; [เลือก](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [ตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [การถอดรหัส](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [ตั้งค่า](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [ปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [รื้องาน](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [สรุป](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ชั่วโมง | ⭐⭐ |

**รวมเวลาทั้งหมด:** ~10-14 ชั่วโมง | **ระดับความชำนาญ:** มือใหม่ → พร้อมใช้งานจริง

---

## 📚 บทเรียนเพื่อการเรียนรู้

*เลือกเส้นทางการเรียนรู้ตามระดับประสบการณ์และเป้าหมายของคุณ*

### 🚀 บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว  
**สิ่งที่ต้องมี:** สมัครใช้งาน Azure, ความรู้บรรทัดคำสั่งพื้นฐาน  
**ระยะเวลา:** 30-45 นาที  
**ความซับซ้อน:** ⭐

#### สิ่งที่คุณจะได้เรียนรู้
- เข้าใจพื้นฐาน Azure Developer CLI
- ติดตั้ง AZD บนแพลตฟอร์มของคุณ
- นำโปรเจกต์แรกขึ้นใช้งานสำเร็จ

#### แหล่งเรียนรู้
- **🎯 เริ่มที่นี่**: [Azure Developer CLI คืออะไร?](#what-is-azure-developer-cli)
- **📖 ทฤษฎี**: [พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) - แนวคิดหลักและคำศัพท์
- **⚙️ การตั้งค่า**: [การติดตั้ง & ตั้งค่า](docs/chapter-01-foundation/installation.md) - คู่มือเฉพาะแพลตฟอร์ม
- **🛠️ ปฏิบัติ**: [โปรเจกต์แรกของคุณ](docs/chapter-01-foundation/first-project.md) - บทสอนทีละขั้นตอน
- **📋 อ้างอิงด่วน**: [แผ่นคำสั่ง](resources/cheat-sheet.md)

#### แบบฝึกหัดปฏิบัติ  
```bash
# การตรวจสอบการติดตั้งอย่างรวดเร็ว
azd version

# ติดตั้งแอปพลิเคชันแรกของคุณ
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 ผลลัพธ์บทเรียน:** นำเว็บแอปพลิเคชันง่าย ๆ ขึ้น Azure สำเร็จด้วย AZD

**✅ การยืนยันความสำเร็จ:**  
```bash
# หลังจากทำบทที่ 1 เสร็จ คุณควรจะสามารถ:
azd version              # แสดงเวอร์ชันที่ติดตั้งแล้ว
azd init --template todo-nodejs-mongo  # เริ่มต้นโปรเจกต์
azd up                  # นำไปใช้บน Azure
azd show                # แสดง URL ของแอปที่กำลังทำงาน
# แอปพลิเคชันเปิดในเบราว์เซอร์และทำงานได้
azd down --force --purge  # ล้างทรัพยากร
```
  
**📊 เวลาใช้:** 30-45 นาที  
**📈 ระดับทักษะหลังเรียน:** นำแอปพื้นฐานขึ้นใช้งานได้เอง

---

### 🤖 บทที่ 2: การพัฒนา AI-First (แนะนำสำหรับนักพัฒนา AI)  
**สิ่งที่ต้องมี:** เรียนบทที่ 1 เสร็จ  
**ระยะเวลา:** 1-2 ชั่วโมง  
**ความซับซ้อน:** ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การผสานรวม Microsoft Foundry กับ AZD
- การนำแอปที่ใช้ AI ขึ้นใช้งาน
- เข้าใจการตั้งค่าบริการ AI

#### แหล่งเรียนรู้
- **🎯 เริ่มที่นี่:** [การผสานรวม Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents:** [คู่มือ AI Agents](docs/chapter-02-ai-development/agents.md) - นำเอเย่นต์อัจฉริยะขึ้นใช้งานด้วย AZD
- **📖 รูปแบบ:** [การนำโมเดล AI ขึ้นใช้งาน](docs/chapter-02-ai-development/ai-model-deployment.md) - นำและจัดการโมเดล AI
- **🛠️ เวิร์กช็อป:** [เวิร์กช็อป AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำโซลูชัน AI ของคุณให้พร้อมด้วย AZD
- **🎥 คู่มือโต้ตอบ:** [วัสดุเวิร์กช็อป](workshop/README.md) - เรียนรู้ผ่านเว็บเบราว์เซอร์ด้วย MkDocs * สภาพแวดล้อม DevContainer
- **📋 แม่แบบ:** [แม่แบบ Microsoft Foundry](#แหล่งข้อมูลเวิร์กช็อป)
- **📝 ตัวอย่าง:** [ตัวอย่างการนำ AZD ขึ้นใช้งาน](examples/README.md)

#### แบบฝึกหัดปฏิบัติ  
```bash
# เปิดใช้งานแอป AI แรกของคุณ
azd init --template azure-search-openai-demo
azd up

# ลองใช้แม่แบบ AI เพิ่มเติม
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 ผลลัพธ์บทเรียน:** นำแชทแอปพลิเคชันที่ใช้ AI พร้อมความสามารถ RAG ขึ้นใช้งานและตั้งค่า

**✅ การยืนยันความสำเร็จ:**  
```bash
# หลังจากบทที่ 2 คุณควรจะสามารถ:
azd init --template azure-search-openai-demo
azd up
# ทดสอบอินเทอร์เฟซแชท AI
# ถามคำถามและรับคำตอบที่ขับเคลื่อนโดย AI พร้อมแหล่งข้อมูล
# ตรวจสอบการทำงานของการรวมการค้นหา
azd monitor  # ตรวจสอบว่า Application Insights แสดงข้อมูล telemetry
azd down --force --purge
```
  
**📊 เวลาใช้:** 1-2 ชั่วโมง  
**📈 ระดับทักษะหลังเรียน:** นำและตั้งค่าแอป AI พร้อมใช้งานจริงได้  
**💰 ความเข้าใจต้นทุน:** เข้าใจต้นทุนพัฒนาประมาณ $80-150 ต่อเดือน และต้นทุนผลิต $300-3500 ต่อเดือน

#### 💰 ข้อควรพิจารณาด้านต้นทุนสำหรับการนำ AI ขึ้นใช้งาน

**สภาพแวดล้อมการพัฒนา (ประมาณ $80-150/เดือน):**  
- โมเดล Microsoft Foundry (จ่ายตามการใช้งาน): $0-50/เดือน (ขึ้นกับการใช้ token)  
- AI Search (ชั้นพื้นฐาน): $75/เดือน  
- Container Apps (การใช้ตามจริง): $0-20/เดือน  
- Storage (มาตรฐาน): $1-5/เดือน  

**สภาพแวดล้อมการผลิต (ประมาณ $300-3,500+/เดือน):**  
- โมเดล Microsoft Foundry (PTU เพื่อประสิทธิภาพสม่ำเสมอ): $3,000+/เดือน หรือจ่ายตามใช้งานปริมาณมาก  
- AI Search (ชั้นมาตรฐาน): $250/เดือน  
- Container Apps (แบบเฉพาะ): $50-100/เดือน  
- Application Insights: $5-50/เดือน  
- Storage (พรีเมียม): $10-50/เดือน  

**💡 เคล็ดลับการเพิ่มประสิทธิภาพด้านต้นทุน:**  
- ใช้โมเดล Microsoft Foundry ฟรีเพื่อเรียนรู้ (รวม Azure OpenAI 50,000 tokens/เดือน)  
- รัน `azd down` เพื่อปลดปล่อยทรัพยากรเมื่อไม่พัฒนา  
- เริ่มด้วยการเรียกเก็บเงินตามการใช้งานจริง แล้วอัพเกรดเป็น PTU เฉพาะตอนผลิต  
- ใช้ `azd provision --preview` เพื่อตรวจสอบต้นทุนก่อนนำขึ้นใช้งาน  
- เปิดใช้งาน auto-scaling: จ่ายเฉพาะการใช้งานจริง  

**การตรวจสอบต้นทุน:**  
```bash
# ตรวจสอบค่าใช้จ่ายตามประมาณการรายเดือน
azd provision --preview

# ตรวจสอบค่าใช้จ่ายจริงใน Azure Portal
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ บทที่ 3: การตั้งค่า & การพิสูจน์ตัวตน  
**สิ่งที่ต้องมี:** เรียนบทที่ 1 เสร็จ  
**ระยะเวลา:** 45-60 นาที  
**ความซับซ้อน:** ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การจัดการและตั้งค่าสภาพแวดล้อม
- แนวทางการพิสูจน์ตัวตนและความปลอดภัยที่ดีที่สุด
- การตั้งชื่อและจัดระเบียบทรัพยากร

#### แหล่งเรียนรู้
- **📖 การตั้งค่า:** [คู่มือการตั้งค่า](docs/chapter-03-configuration/configuration.md) - การตั้งค่าสภาพแวดล้อม  
- **🔐 ความปลอดภัย:** [รูปแบบการพิสูจน์ตัวตนและ Managed Identity](docs/chapter-03-configuration/authsecurity.md) - รูปแบบการพิสูจน์ตัวตน  
- **📝 ตัวอย่าง:** [ตัวอย่างแอปฐานข้อมูล](examples/database-app/README.md) - ตัวอย่างฐานข้อมูล AZD  

#### แบบฝึกหัดปฏิบัติ  
- ตั้งค่าสภาพแวดล้อมหลายแบบ (dev, staging, prod)  
- ตั้งค่าการพิสูจน์ตัวตนด้วย Managed Identity  
- ใช้งานการตั้งค่าสภาพแวดล้อมเฉพาะ  

**💡 ผลลัพธ์บทเรียน:** จัดการสภาพแวดล้อมหลายแบบด้วยการพิสูจน์ตัวตนและความปลอดภัยอย่างเหมาะสม

---

### 🏗️ บทที่ 4: Infrastructure as Code & การนำขึ้นใช้งาน  
**สิ่งที่ต้องมี:** เรียนบทที่ 1-3 เสร็จ  
**ระยะเวลา:** 1-1.5 ชั่วโมง  
**ความซับซ้อน:** ⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบการนำขึ้นใช้งานขั้นสูง
- Infrastructure as Code ด้วย Bicep
- กลยุทธ์การจัดเตรียมทรัพยากร

#### แหล่งเรียนรู้
- **📖 การนำขึ้นใช้งาน:** [คู่มือการนำขึ้นใช้งาน](docs/chapter-04-infrastructure/deployment-guide.md) - ขั้นตอนอย่างครบถ้วน  
- **🏗️ การจัดเตรียม:** [การจัดเตรียมทรัพยากร](docs/chapter-04-infrastructure/provisioning.md) - การจัดการทรัพยากร Azure  
- **📝 ตัวอย่าง:** [ตัวอย่าง Container App](../../examples/container-app) - การนำขึ้นใช้งานแบบ container  

#### แบบฝึกหัดปฏิบัติ  
- สร้างแม่แบบ Bicep ปรับแต่งเอง  
- นำแอปหลายบริการขึ้นใช้งาน  
- ใช้กลยุทธ์ blue-green deployment  

**💡 ผลลัพธ์บทเรียน:** นำแอปหลายบริการที่ซับซ้อนขึ้นใช้งานโดยใช้แม่แบบโครงสร้างพื้นฐานที่ปรับแต่งเอง

---
### 🎯 บทที่ 5: โซลูชัน AI แบบหลายตัวแทน (ขั้นสูง)
**ข้อกำหนดเบื้องต้น**: ทำบทที่ 1-2 เสร็จแล้ว  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- รูปแบบสถาปัตยกรรมแบบหลายตัวแทน
- การประสานงานและการจัดการตัวแทน
- การใช้งาน AI ที่พร้อมสำหรับการใช้งานจริง

#### แหล่งเรียนรู้
- **🤖 โครงการเด่น**: [โซลูชัน AI แบบหลายตัวแทนสำหรับค้าปลีก](examples/retail-scenario.md) - การใช้งานครบถ้วน
- **🛠️ แบบแผน ARM**: [แพ็กเกจแบบแผน ARM](../../examples/retail-multiagent-arm-template) - ติดตั้งด้วยคลิกเดียว
- **📖 สถาปัตยกรรม**: [รูปแบบการประสานงานแบบหลายตัวแทน](docs/chapter-06-pre-deployment/coordination-patterns.md) - รูปแบบต่าง ๆ

#### แบบฝึกหัดปฏิบัติ
```bash
# ปรับใช้โซลูชันมัลติเอเจนต์ค้าปลีกครบวงจร
cd examples/retail-multiagent-arm-template
./deploy.sh

# สำรวจการตั้งค่าเอเจนต์
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ผลลัพธ์บทเรียน**: ติดตั้งและจัดการโซลูชัน AI แบบหลายตัวแทนที่พร้อมสำหรับการใช้งานจริงโดยมีตัวแทนลูกค้าและสต็อกสินค้า

---

### 🔍 บทที่ 6: การตรวจสอบและวางแผนก่อนการติดตั้ง
**ข้อกำหนดเบื้องต้น**: ทำบทที่ 4 เสร็จแล้ว  
**ระยะเวลา**: 1 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- การวางแผนกำลังการผลิตและการตรวจสอบทรัพยากร
- กลยุทธ์การเลือก SKU
- การตรวจสอบก่อนติดตั้งและระบบอัตโนมัติ

#### แหล่งเรียนรู้
- **📊 การวางแผน**: [การวางแผนกำลังการผลิต](docs/chapter-06-pre-deployment/capacity-planning.md) - การตรวจสอบทรัพยากร
- **💰 การเลือก**: [การเลือก SKU](docs/chapter-06-pre-deployment/sku-selection.md) - ตัวเลือกที่ประหยัดค่าใช้จ่าย
- **✅ การตรวจสอบ**: [การตรวจสอบก่อนติดตั้ง](docs/chapter-06-pre-deployment/preflight-checks.md) - สคริปต์อัตโนมัติ

#### แบบฝึกหัดปฏิบัติ
- รันสคริปต์ตรวจสอบกำลังการผลิต
- ปรับแต่งการเลือก SKU ให้คุ้มค่า
- ติดตั้งระบบตรวจสอบก่อนติดตั้งอัตโนมัติ

**💡 ผลลัพธ์บทเรียน**: ตรวจสอบและปรับปรุงการติดตั้งก่อนดำเนินการ

---

### 🚨 บทที่ 7: การแก้ไขปัญหาและดีบัก
**ข้อกำหนดเบื้องต้น**: ทำบทการติดตั้งใดก็ได้เสร็จแล้ว  
**ระยะเวลา**: 1-1.5 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- วิธีการดีบักอย่างเป็นระบบ
- ปัญหาทั่วไปและวิธีแก้ไข
- การแก้ปัญหาเฉพาะ AI

#### แหล่งเรียนรู้
- **🔧 ปัญหาทั่วไป**: [ปัญหาทั่วไป](docs/chapter-07-troubleshooting/common-issues.md) - คำถามที่พบบ่อยและวิธีแก้ไข
- **🕵️ การดีบัก**: [คู่มือดีบัก](docs/chapter-07-troubleshooting/debugging.md) - กลยุทธ์ทีละขั้นตอน
- **🤖 ปัญหา AI**: [การแก้ปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - ปัญหาของบริการ AI

#### แบบฝึกหัดปฏิบัติ
- วินิจฉัยข้อผิดพลาดในการติดตั้ง
- แก้ปัญหาการตรวจสอบสิทธิ์
- ดีบักการเชื่อมต่อบริการ AI

**💡 ผลลัพธ์บทเรียน**: วินิจฉัยและแก้ไขปัญหาการติดตั้งทั่วไปได้ด้วยตนเอง

---

### 🏢 บทที่ 8: รูปแบบการผลิตและองค์กร
**ข้อกำหนดเบื้องต้น**: ทำบทที่ 1-4 เสร็จแล้ว  
**ระยะเวลา**: 2-3 ชั่วโมง  
**ระดับความซับซ้อน**: ⭐⭐⭐⭐

#### สิ่งที่คุณจะได้เรียนรู้
- กลยุทธ์การติดตั้งใช้งานจริง
- รูปแบบความปลอดภัยในองค์กร
- การติดตามและการเพิ่มประสิทธิภาพค่าใช้จ่าย

#### แหล่งเรียนรู้
- **🏭 การผลิต**: [แนวทางปฏิบัติที่ดีที่สุดสำหรับ AI ในการผลิต](docs/chapter-08-production/production-ai-practices.md) - รูปแบบองค์กร
- **📝 ตัวอย่าง**: [ตัวอย่างไมโครเซอร์วิส](../../examples/microservices) - สถาปัตยกรรมซับซ้อน
- **📊 การติดตาม**: [การรวม Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - การติดตาม

#### แบบฝึกหัดปฏิบัติ
- ใช้รูปแบบความปลอดภัยองค์กร
- ตั้งค่าการติดตามครบวงจร
- ติดตั้งใช้งานในระบบจริงพร้อมการกำกับดูแลที่เหมาะสม

**💡 ผลลัพธ์บทเรียน**: ติดตั้งแอปพลิเคชันที่พร้อมใช้งานในองค์กรด้วยความสามารถผลิตเต็มรูปแบบ

---

## 🎓 ภาพรวมเวิร์กช็อป: ประสบการณ์การเรียนรู้แบบลงมือทำ

> **⚠️ สถานะเวิร์กช็อป: กำลังพัฒนา**  
> เนื้อหาเวิร์กช็อปอยู่ระหว่างการพัฒนาและปรับปรุง โมดูลหลักใช้งานได้แล้ว แต่บางส่วนของเนื้อหาขั้นสูงยังไม่สมบูรณ์ กำลังดำเนินการให้ครบทุกเนื้อหา [ติดตามความคืบหน้า →](workshop/README.md)

### เอกสารเวิร์กช็อปแบบโต้ตอบ
**การเรียนรู้แบบลงมือทำครบวงจรด้วยเครื่องมือบนเบราว์เซอร์และแบบฝึกหัดแนะนำ**

สื่อเวิร์กช็อปของเรานำเสนอประสบการณ์การเรียนรู้อย่างเป็นระบบและโต้ตอบได้ ที่เสริมหลักสูตรตามบทเรียนที่กล่าวมา เวิร์กช็อปนี้ออกแบบสำหรับการเรียนรู้ตามจังหวะตนเองและการสอนโดยผู้สอน

#### 🛠️ คุณสมบัติของเวิร์กช็อป
- **อินเทอร์เฟซบนเบราว์เซอร์**: เวิร์กช็อปบน MkDocs ครบถ้วนพร้อมฟีเจอร์ค้นหา คัดลอก และธีม
- **การรวมกับ GitHub Codespaces**: ตั้งค่าสภาพแวดล้อมพัฒนาแบบคลิกเดียว
- **เส้นทางการเรียนรู้อย่างมีโครงสร้าง**: แบบฝึกหัด 8 โมดูล (รวม 3-4 ชั่วโมง)
- **วิธีการเรียนรู้แบบก้าวหน้า**: การแนะนำ → การเลือก → การตรวจสอบ → การแยกโครงสร้าง → การกำหนดค่า → การปรับแต่ง → การรื้อถอน → สรุป
- **สภาพแวดล้อม DevContainer แบบโต้ตอบ**: เครื่องมือและส่วนประกอบที่ตั้งค่าล่วงหน้า

#### 📚 โครงสร้างโมดูลเวิร์กช็อป
เวิร์กช็อปจัดตาม **8 โมดูลตามวิธีการเรียนรู้แบบก้าวหน้า** ที่นำคุณจากการค้นพบถึงความเชี่ยวชาญในการติดตั้ง:

| โมดูล | หัวข้อ | สิ่งที่คุณจะทำ | ระยะเวลา |
|--------|-------|----------------|----------|
| **0. บทนำ** | ภาพรวมเวิร์กช็อป | เข้าใจวัตถุประสงค์การเรียนรู้ ข้อกำหนด และโครงสร้างเวิร์กช็อป | 15 นาที |
| **1. การเลือก** | การค้นหาเทมเพลต | สำรวจเทมเพลต AZD และเลือกเทมเพลต AI ที่เหมาะกับสถานการณ์ของคุณ | 20 นาที |
| **2. การตรวจสอบ** | ติดตั้งและยืนยัน | ติดตั้งเทมเพลตด้วย `azd up` และตรวจสอบระบบโครงสร้างพื้นฐาน | 30 นาที |
| **3. การแยกโครงสร้าง** | เข้าใจโครงสร้าง | ใช้ GitHub Copilot สำรวจสถาปัตยกรรมเทมเพลต, ไฟล์ Bicep และการจัดการโค้ด | 30 นาที |
| **4. การกำหนดค่า** | เจาะลึก azure.yaml | เรียนรู้การกำหนดค่า `azure.yaml` ฟังก์ชันไลฟ์ไซเคิล และตัวแปรสภาพแวดล้อม | 30 นาที |
| **5. การปรับแต่ง** | ทำให้เป็นของคุณ | เปิดใช้ AI Search, ติดตาม, ประเมินผล และปรับแต่งให้เหมาะกับสถานการณ์ของคุณ | 45 นาที |
| **6. การรื้อถอน** | เก็บความสะอาด | ถอนการติดตั้งทรัพยากรอย่างปลอดภัยด้วย `azd down --purge` | 15 นาที |
| **7. สรุป** | ก้าวต่อไป | ทบทวนความสำเร็จ แนวคิดสำคัญ และดำเนินการเรียนรู้ต่อ | 15 นาที |

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
# ตัวเลือก 1: GitHub Codespaces (แนะนำ)
# คลิก "Code" → "Create codespace on main" ในที่เก็บข้อมูล

# ตัวเลือก 2: การพัฒนาในเครื่อง
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ทำตามคำแนะนำการติดตั้งใน workshop/README.md
```
  
#### 🎯 ผลลัพธ์การเรียนรู้ของเวิร์กช็อป  
เมื่อจบเวิร์กช็อป ผู้เข้าร่วมจะสามารถ:  
- **ติดตั้งแอปพลิเคชัน AI สำหรับการผลิตจริง**: ใช้ AZD กับบริการ Microsoft Foundry  
- **เชี่ยวชาญสถาปัตยกรรมหลายตัวแทน**: นำโซลูชันตัวแทน AI ที่ประสานกันจริงๆ มาใช้งาน  
- **ใช้แนวทางปฏิบัติด้านความปลอดภัย**: กำหนดค่าการพิสูจน์ตัวตนและการควบคุมการเข้าถึง  
- **เพิ่มประสิทธิภาพสำหรับการสเกล**: ออกแบบการติดตั้งที่คุ้มค่าและมีประสิทธิภาพ  
- **แก้ไขปัญหาการติดตั้ง**: แก้ไขปัญหาทั่วไปได้ด้วยตนเอง  

#### 📖 แหล่งข้อมูลเวิร์กช็อป  
- **🎥 คู่มือแบบโต้ตอบ**: [เอกสารเวิร์กช็อป](workshop/README.md) - สภาพแวดล้อมการเรียนรู้บนเบราว์เซอร์  
- **📋 คำแนะนำรายโมดูล**:  
  - [0. บทนำ](workshop/docs/instructions/0-Introduction.md) - ภาพรวมและวัตถุประสงค์เวิร์กช็อป  
  - [1. การเลือก](workshop/docs/instructions/1-Select-AI-Template.md) - ค้นหาและเลือกเทมเพลต AI  
  - [2. การตรวจสอบ](workshop/docs/instructions/2-Validate-AI-Template.md) - ติดตั้งและยืนยันเทมเพลต  
  - [3. การแยกโครงสร้าง](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - สำรวจสถาปัตยกรรมเทมเพลต  
  - [4. การกำหนดค่า](workshop/docs/instructions/4-Configure-AI-Template.md) - เรียนรู้ azure.yaml  
  - [5. การปรับแต่ง](workshop/docs/instructions/5-Customize-AI-Template.md) - ปรับแต่งสำหรับสถานการณ์ของคุณ  
  - [6. การรื้อถอน](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ทำความสะอาดทรัพยากร  
  - [7. สรุป](workshop/docs/instructions/7-Wrap-up.md) - ทบทวนและก้าวต่อไป  
- **🛠️ ห้องปฏิบัติการ AI เวิร์กช็อป**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - แบบฝึกหัดเน้น AI  
- **💡 เริ่มต้นอย่างรวดเร็ว**: [คู่มือการตั้งค่าเวิร์กช็อป](workshop/README.md#quick-start) - การกำหนดสภาพแวดล้อม  

**เหมาะสำหรับ**: การฝึกอบรมองค์กร คอร์สในมหาวิทยาลัย การเรียนรู้ด้วยตนเอง และบู๊ทแคมป์สำหรับนักพัฒนา

---

## 📖 เจาะลึก: ความสามารถของ AZD

นอกจากพื้นฐานแล้ว AZD ยังมอบฟีเจอร์ทรงพลังสำหรับการติดตั้งใช้งานจริง:

- **การติดตั้งแบบใช้เทมเพลต** - ใช้เทมเพลตสำเร็จรูปสำหรับรูปแบบแอปพลิเคชันทั่วไป  
- **โครงสร้างพื้นฐานเป็นโค้ด** - จัดการทรัพยากร Azure ด้วย Bicep หรือ Terraform  
- **เวิร์กโฟลว์แบบบูรณาการ** - สร้าง ติดตั้ง และติดตามแอปพลิเคชันอย่างไร้รอยต่อ  
- **เหมาะสำหรับนักพัฒนา** - ปรับแต่งให้เหมาะกับประสิทธิภาพและประสบการณ์ของนักพัฒนา

### **AZD + Microsoft Foundry: เหมาะสำหรับการติดตั้ง AI**

**ทำไมต้อง AZD สำหรับโซลูชัน AI?** AZD ตอบโจทย์ความท้าทายหลักของนักพัฒนา AI:

- **เทมเพลตที่พร้อมใช้งานสำหรับ AI** - เทมเพลตที่ตั้งค่าไว้ล่วงหน้าสำหรับโมเดล Microsoft Foundry, บริการ AI ของ Azure และงาน ML  
- **การติดตั้ง AI ที่ปลอดภัย** - รูปแบบความปลอดภัยในตัวสำหรับบริการ AI, กุญแจ API และจุดเชื่อมต่อโมเดล  
- **รูปแบบ AI สำหรับการผลิต** - แนวทางการปฏิบัติที่ดีที่สุดสำหรับแอป AI ที่สามารถขยายและคุ้มค่า  
- **เวิร์กโฟลว์ AI แบบครบวงจร** - ตั้งแต่การพัฒนาโมเดลถึงการติดตั้งใช้งานจริงพร้อมการติดตามที่เหมาะสม  
- **การเพิ่มประสิทธิภาพค่าใช้จ่าย** - การจัดสรรทรัพยากรอัจฉริยะและกลยุทธ์สเกลสำหรับงาน AI  
- **การรวม Microsoft Foundry** - การเชื่อมต่อไปยังแคตตาล็อกโมเดลและจุดเชื่อมต่อของ Microsoft Foundry อย่างไร้รอยต่อ

---

## 🎯 เทมเพลตและคลังตัวอย่าง

### เทมเพลตเด่น: Microsoft Foundry
**เริ่มต้นที่นี่ถ้าคุณกำลังติดตั้งแอป AI!**

> **หมายเหตุ:** เทมเพลตเหล่านี้แสดงรูปแบบต่าง ๆ ของ AI บางอันเป็นตัวอย่าง Azure ภายนอก บางอันเป็นการใช้งานภายใน

| เทมเพลต | บทเรียน | ความซับซ้อน | บริการ | ประเภท |
|----------|---------|------------|----------|------|
| [**เริ่มต้นกับ AI Chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ภายนอก |
| [**เริ่มต้นกับ AI Agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | บทที่ 2 | ⭐⭐ | ตัวแทน Foundry + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ภายนอก |
| [**สาธิต Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ภายนอก |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ภายนอก |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ภายนอก |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ภายนอก |
| [**โซลูชัน AI แบบหลายตัวแทนสำหรับค้าปลีก**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ภายใน** |

### เทมเพลตรูปแบบเรียนรู้ครบถ้วน
**เทมเพลตแอปพลิเคชันที่พร้อมใช้งานจริง ผูกกับบทเรียนต่าง ๆ**

| เทมเพลต | บทเรียน | ความซับซ้อน | หัวข้อเรียนรู้สำคัญ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | บทที่ 2 | ⭐ | รูปแบบการติดตั้ง AI พื้นฐาน |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | บทที่ 2 | ⭐⭐ | การใช้งาน RAG กับ Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | บทที่ 4 | ⭐⭐ | การผนวก Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | บทที่ 5 | ⭐⭐⭐ | เฟรมเวิร์กตัวแทนและการเรียกฟังก์ชัน |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | บทที่ 8 | ⭐⭐⭐ | การประสานงาน AI ในองค์กร |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | บทที่ 5 | ⭐⭐⭐⭐ | สถาปัตยกรรมหลายตัวแทนกับตัวแทนลูกค้าและสต็อกสินค้า |

### เรียนรู้จากตัวอย่างตามประเภท

> **📌 ตัวอย่างภายในกับตัวอย่างภายนอก:**  
> **ตัวอย่างภายใน** (ในที่เก็บนี้) = ใช้งานได้ทันที  
> **ตัวอย่างภายนอก** (Azure Samples) = โคลนจากที่เก็บที่ลิงก์ไว้

#### ตัวอย่างภายใน (พร้อมใช้)
- [**โซลูชัน AI แบบหลายตัวแทนสำหรับค้าปลีก**](examples/retail-scenario.md) - การใช้งานจริงครบถ้วนพร้อมเทมเพลต ARM  
  - สถาปัตยกรรมหลายตัวแทน (ตัวแทนลูกค้า + ตัวแทนสต็อก)  
  - การติดตามและการประเมินผลครบวงจร  
  - ติดตั้งด้วยคลิกเดียวผ่านเทมเพลต ARM

#### ตัวอย่างภายใน - แอป Container (บทที่ 2-5)  
**ตัวอย่างการติดตั้ง container ครบถ้วนในที่เก็บนี้:**
- [**ตัวอย่าง Container App**](examples/container-app/README.md) - คู่มือฉบับสมบูรณ์สำหรับการปรับใช้แบบ containerized  
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - REST API เบื้องต้นพร้อมสเกลเป็นศูนย์  
  - [Microservices Architecture](../../examples/container-app/microservices) - การปรับใช้บริการหลายบริการที่พร้อมใช้งานในผลิตจริง  
  - รูปแบบการเริ่มต้นเร็ว การผลิต และการปรับใช้ขั้นสูง  
  - คำแนะนำด้านการตรวจสอบ ความปลอดภัย และการเพิ่มประสิทธิภาพต้นทุน  

#### ตัวอย่างภายนอก - แอปพลิเคชันง่าย (บทที่ 1-2)  
**โคลนที่เก็บ Azure Samples เหล่านี้เพื่อเริ่มต้นได้เลย:**  
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - รูปแบบการปรับใช้พื้นฐาน  
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - การปรับใช้เนื้อหาสแตติก  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - การปรับใช้ REST API  

#### ตัวอย่างภายนอก - การผสานฐานข้อมูล (บทที่ 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - รูปแบบการเชื่อมต่อฐานข้อมูล  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - โฟลว์งานข้อมูลแบบ serverless  

#### ตัวอย่างภายนอก - รูปแบบขั้นสูง (บทที่ 4-8)  
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - สถาปัตยกรรมหลายบริการ  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - การประมวลผลเบื้องหลัง  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - รูปแบบ ML พร้อมใช้งานจริง  

### คอลเลกชันแม่แบบภายนอก  
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - คอลเลกชันจัดอย่างดีของแม่แบบอย่างเป็นทางการและจากชุมชน  
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - เอกสารแม่แบบ Microsoft Learn  
- [**Examples Directory**](examples/README.md) - ตัวอย่างการเรียนรู้ในเครื่องพร้อมคำอธิบายละเอียด  

---

## 📚 แหล่งเรียนรู้ & อ้างอิง

### อ้างอิงด่วน  
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - คำสั่ง azd สำคัญจัดเรียงตามบท  
- [**คำศัพท์**](resources/glossary.md) - คำศัพท์ Azure และ azd  
- [**คำถามที่พบบ่อย**](resources/faq.md) - คำถามทั่วไปจัดเรียงตามบทเรียน  
- [**Study Guide**](resources/study-guide.md) - แบบฝึกหัดครบถ้วน  

### เวิร์กช็อปแบบลงมือทำ  
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - ทำโซลูชัน AI ของคุณเพื่อปรับใช้กับ AZD (2-3 ชั่วโมง)  
- [**Interactive Workshop**](workshop/README.md) - แบบฝึกหัดนำทาง 8 โมดูลด้วย MkDocs และ GitHub Codespaces  
  - ตามลำดับ: บทนำ → การเลือก → การตรวจสอบ → การแยกวิเคราะห์ → การตั้งค่า → การปรับแต่ง → การสรุป → การปิดท้าย  

### แหล่งเรียนรู้อื่น ๆ  
- เอกสาร Azure Developer CLI (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- ศูนย์สถาปัตยกรรม Azure (https://learn.microsoft.com/en-us/azure/architecture/)  
- เครื่องมือคำนวณราคา Azure (https://azure.microsoft.com/pricing/calculator/)  
- สถานะ Azure (https://status.azure.com/)  

### ทักษะเอเย่นต์ AI สำหรับตัวแก้ไขของคุณ  
- [**ทักษะ Microsoft Azure บน skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - ทักษะเอเย่นต์เปิด 37 รายการสำหรับ Azure AI, Foundry, การปรับใช้, การวินิจฉัย, การเพิ่มประสิทธิภาพต้นทุน และอื่น ๆ ติดตั้งใน GitHub Copilot, Cursor, Claude Code หรือเอเย่นต์ที่รองรับ:  
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```
  
---

## 🔧 คู่มือแก้ไขปัญหาอย่างรวดเร็ว

**ปัญหาที่พบบ่อยสำหรับผู้เริ่มต้นและวิธีแก้ไขทันที:**

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

# ตรวจสอบการติดตั้ง
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# แสดงรายการการสมัครใช้งานที่มี
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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# ลองใช้งานภูมิภาค Azure ต่าง ๆ
azd env set AZURE_LOCATION "westus2"
azd up

# หรือใช้ SKU ขนาดเล็กกว่าในช่วงพัฒนา
# แก้ไข infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# ตัวเลือกที่ 1: ทำความสะอาดและลองใหม่อีกครั้ง
azd down --force --purge
azd up

# ตัวเลือกที่ 2: แก้ไขโครงสร้างพื้นฐานเท่านั้น
azd provision

# ตัวเลือกที่ 3: ตรวจสอบสถานะโดยละเอียด
azd show

# ตัวเลือกที่ 4: ตรวจสอบบันทึกใน Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# ยืนยันตัวตนอีกครั้งสำหรับ AZD
azd auth logout
azd auth login

# ตัวเลือก: รีเฟรช Azure CLI ด้วยถ้าคุณกำลังรันคำสั่ง az
az logout
az login

# ตรวจสอบการยืนยันตัวตน
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD สร้างชื่อที่ไม่ซ้ำกัน แต่ถ้าเกิดความขัดแย้ง:
azd down --force --purge

# จากนั้นลองอีกครั้งด้วยสภาพแวดล้อมใหม่
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**เวลารอปกติ:**  
- แอปเว็บอย่างง่าย: 5-10 นาที  
- แอปที่มีฐานข้อมูล: 10-15 นาที  
- แอป AI: 15-25 นาที (การจัดเตรียม OpenAI ช้า)  

```bash
# ตรวจสอบความคืบหน้า
azd show

# หากติดขัดเกิน 30 นาที ให้ตรวจสอบพอร์ทัล Azure:
azd monitor --overview
# มองหาการปรับใช้ที่ล้มเหลว
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# ตรวจสอบบทบาท Azure ของคุณ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# คุณต้องมีบทบาทอย่างน้อย "Contributor"
# ขอให้ผู้ดูแลระบบ Azure ของคุณให้อำนาจ:
# - Contributor (สำหรับทรัพยากร)
# - User Access Administrator (สำหรับการกำหนดบทบาท)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

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

### 📚 แหล่งข้อมูลแก้ไขปัญหาเต็มรูปแบบ

- **คู่มือปัญหาทั่วไป:** [วิธีแก้ปัญหารายละเอียด](docs/chapter-07-troubleshooting/common-issues.md)  
- **ปัญหาเฉพาะ AI:** [แก้ไขปัญหา AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)  
- **คู่มือการดีบัก:** [ดีบักทีละขั้นตอน](docs/chapter-07-troubleshooting/debugging.md)  
- **ขอความช่วยเหลือ:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli  

---

## 🎓 การจบหลักสูตร & การรับรอง

### การติดตามความก้าวหน้า  
ติดตามความคืบหน้าเรียนรู้ของคุณในแต่ละบท:  

- [ ] **บทที่ 1**: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว ✅  
- [ ] **บทที่ 2**: การพัฒนา AI-First ✅  
- [ ] **บทที่ 3**: การตั้งค่า & การยืนยันตัวตน ✅  
- [ ] **บทที่ 4**: โครงสร้างพื้นฐานเป็นโค้ด & การปรับใช้ ✅  
- [ ] **บทที่ 5**: โซลูชัน AI หลายเอเย่นต์ ✅  
- [ ] **บทที่ 6**: การตรวจสอบ & การวางแผนก่อนปรับใช้ ✅  
- [ ] **บทที่ 7**: การแก้ไขปัญหา & การดีบัก ✅  
- [ ] **บทที่ 8**: รูปแบบการผลิต & องค์กร ✅  

### การยืนยันการเรียนรู้  
หลังจากจบบทเรียนแต่ละบท ให้ตรวจสอบความรู้ของคุณโดย:  
1. **แบบฝึกหัดปฏิบัติ:** สร้างการปรับใช้ตามบทเรียน  
2. **ตรวจสอบความรู้:** ทบทวนส่วนคำถามที่พบบ่อยของบทเรียน  
3. **อภิปรายในชุมชน:** แบ่งปันประสบการณ์ใน Azure Discord  
4. **บทถัดไป:** ย้ายสู่ระดับความซับซ้อนถัดไป  

### ประโยชน์จากการจบหลักสูตร  
หลังจากจบบทเรียนทั้งหมด คุณจะมี:  
- **ประสบการณ์ผลิตจริง:** ปรับใช้แอป AI จริงบน Azure  
- **ทักษะมืออาชีพ:** ความสามารถปรับใช้สำหรับองค์กร  
- **การยอมรับในชุมชน:** สมาชิกชุมชนผู้พัฒนา Azure ที่เข้มแข็ง  
- **ความก้าวหน้าในอาชีพ:** ความเชี่ยวชาญ AZD และการปรับใช้ AI ที่เป็นที่ต้องการ  

---

## 🤝 ชุมชน & การสนับสนุน

### ขอความช่วยเหลือ & การสนับสนุน  
- **ปัญหาทางเทคนิค:** [รายงานบั๊กและขอฟีเจอร์](https://github.com/microsoft/azd-for-beginners/issues)  
- **คำถามการเรียนรู้:** [ชุมชน Microsoft Azure Discord](https://discord.gg/microsoft-azure) และ [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **ช่วยเหลือเฉพาะ AI:** ร่วมกับ [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **เอกสาร:** [เอกสาร Azure Developer CLI อย่างเป็นทางการ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### ข้อมูลเชิงลึกจากชุมชน Microsoft Foundry Discord

**ผลโพลล่าสุดจากช่อง #Azure:**  
- **45%** ของนักพัฒนาต้องการใช้ AZD สำหรับงาน AI  
- **ความท้าทายหลัก:** การปรับใช้หลายบริการ, การจัดการข้อมูลรับรอง, การพร้อมใช้งานผลิต  
- **สิ่งที่ร้องขอบ่อย:** แม่แบบเฉพาะ AI, คู่มือแก้ปัญหา, แนวทางปฏิบัติที่ดีที่สุด  

**เข้าร่วมชุมชนของเราเพื่อ:**  
- แชร์ประสบการณ์ AZD + AI และรับความช่วยเหลือ  
- เข้าถึงตัวอย่างแม่แบบ AI รุ่นแรก  
- มีส่วนร่วมในแนวทางปฏิบัติที่ดีที่สุดของการปรับใช้ AI  
- ส่งผลต่อการพัฒนาฟีเจอร์ AI + AZD ในอนาคต  

### การมีส่วนร่วมกับหลักสูตร  
เรายินดีรับการมีส่วนร่วม! กรุณาอ่าน [คู่มือการมีส่วนร่วม](CONTRIBUTING.md) สำหรับรายละเอียดเกี่ยวกับ:  
- **ปรับปรุงเนื้อหา:** ยกระดับบทเรียนและตัวอย่างที่มีอยู่  
- **ตัวอย่างใหม่:** เพิ่มสถานการณ์จริงและแม่แบบ  
- **การแปลภาษา:** ช่วยรักษาการสนับสนุนหลายภาษา  
- **รายงานบั๊ก:** ปรับปรุงความถูกต้องและความชัดเจน  
- **มาตรฐานชุมชน:** ปฏิบัติตามแนวปฏิบัติชุมชนแบบเปิดกว้าง  

---

## 📄 ข้อมูลหลักสูตร

### ใบอนุญาต  
โครงการนี้ได้รับอนุญาตภายใต้ MIT License - ดูไฟล์ [LICENSE](../../LICENSE) สำหรับรายละเอียด  

### แหล่งเรียนรู้ Microsoft ที่เกี่ยวข้อง

ทีมของเราผลิตหลักสูตรการเรียนรู้อื่น ๆ ที่ครอบคลุมอย่างละเอียด:

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
 
### การเรียนรู้หลัก
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ชุดบทเรียน Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ การนำทางหลักสูตร

**🚀 พร้อมเริ่มการเรียนรู้หรือยัง?**

**ผู้เริ่มต้น**: เริ่มที่ [บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว](#-chapter-1-foundation--quick-start)  
**นักพัฒนา AI**: ข้ามไปที่ [บทที่ 2: การพัฒนา AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**นักพัฒนาที่มีประสบการณ์**: เริ่มที่ [บทที่ 3: การกำหนดค่า & การพิสูจน์ตัวตน](#️-chapter-3-configuration--authentication)

**ขั้นตอนถัดไป**: [เริ่มบทที่ 1 - พื้นฐาน AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->