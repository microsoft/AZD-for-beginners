# 7. สรุปและขั้นตอนถัดไป

!!! tip "ข้อความสำคัญหลักคือ"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. สิ่งที่คุณทำสำเร็จ

ขอแสดงความยินดี! ในเวิร์กช็อปนี้ คุณได้ทำสำเร็จ:

| โมดูล | สิ่งที่ทำได้ |
|:---|:---|
| **โมดูล 1** | ค้นพบ Azure Developer CLI และเลือกเทมเพลต AI |
| **โมดูล 2** | ติดตั้งและตรวจสอบโซลูชัน AI agents ครบถ้วน |
| **โมดูล 3** | แยกโครงสร้างเทมเพลตเพื่อเข้าใจสถาปัตยกรรม |
| **โมดูล 4** | สำรวจการกำหนดค่า `azure.yaml` และ lifecycle hooks |
| **โมดูล 5** | ปรับแต่งเทมเพลตให้เหมาะกับสถานการณ์ของคุณ |
| **โมดูล 6** | ปิดโครงสร้างพื้นฐานอย่างปลอดภัยและจัดการทรัพยากร |

---

## 2. แนวคิดหลักที่ทำความเข้าใจ

### Azure Developer CLI (azd)
- `azd init` - เริ่มโปรเจกต์จากเทมเพลต
- `azd up` - เตรียมและติดตั้งด้วยคำสั่งเดียว
- `azd env` - จัดการตัวแปรสิ่งแวดล้อม
- `azd down` - ทำความสะอาดทรัพยากรอย่างปลอดภัย

### โครงสร้างเทมเพลต AZD
- `azure.yaml` - การกำหนดค่าและ deployment hooks
- `infra/` - โค้ดโครงสร้างพื้นฐาน Bicep
- `src/` - โค้ดแอปพลิเคชันต้นฉบับ
- `scripts/` - สคริปต์การทำงานอัตโนมัติและการตั้งค่า

### ความสามารถของ Microsoft Foundry
- บริการ AI Agent สำหรับผู้ช่วยอัจฉริยะ
- การค้นหาไฟล์และ Azure AI Search สำหรับการดึงข้อมูลความรู้
- ระบบติดตาม ตรวจสอบ และประเมินผลในตัว
- Red teaming สำหรับการตรวจสอบความปลอดภัย AI

---

## 3. ดำเนินการเรียนรู้ต่อไป

### ขั้นตอนถัดไปที่แนะนำ

| เส้นทาง | แหล่งข้อมูล | ระยะเวลา |
|:---|:---|:---|
| **คอร์สครบถ้วน** | [AZD for Beginners Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | เรียนตามสะดวก |
| **ลองเทมเพลตอื่น** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 ชั่วโมง |
| **ดำน้ำลึก** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | เรียนรู้อย่างต่อเนื่อง |
| **ชุมชน** | [Azure Discord](https://aka.ms/foundry/discord) | เข้าร่วมวันนี้! |

### เทมเพลตที่แนะนำให้ลองต่อไป

1. **[เริ่มต้นกับ AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - แชทพื้นฐานกับข้อมูลของคุณ
2. **[สาธิต Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - รูปแบบ RAG ขั้นสูง
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - สถานการณ์ค้าปลีกในองค์กร

---

## 4. ท้าทายเวิร์กช็อป

พร้อมทดสอบทักษะหรือยัง? ลองทำความท้าทายเหล่านี้:

| ความท้าทาย | คำอธิบาย | ระดับความยาก |
|:---|:---|:---|
| **1. สถานการณ์หลายเอเจนต์** | ติดตั้งและปรับแต่งสำหรับอุตสาหกรรมต่างๆ (เช่น สาธารณสุข การเงิน) | ⭐⭐ |
| **2. ฐานความรู้กำหนดเอง** | เพิ่มไฟล์ข้อมูลของคุณเองและสร้างดัชนีค้นหาที่กำหนดเอง | ⭐⭐⭐ |
| **3. ติดตั้งสำหรับโปรดักชัน** | ตั้งค่า CI/CD ด้วย GitHub Actions โดยใช้ `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. แบ่งปันความคิดเห็นของคุณ

ความคิดเห็นของคุณช่วยให้เราปรับปรุงเวิร์กช็อปนี้ได้ดีขึ้น!

- **GitHub Issues**: [ส่งความคิดเห็น](https://github.com/microsoft/azd-for-beginners/issues) - แท็กด้วย `Workshop`
- **Discord**: เข้าร่วม [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - โพสต์ใน `#get-help`
- **การมีส่วนร่วม**: ช่วยปรับปรุงเวิร์กช็อปด้วยการส่ง pull requests!

---

## ขอบคุณ! 🎉

ขอบคุณที่เข้าร่วมเวิร์กช็อป AZD for AI Developers หวังว่าประสบการณ์นี้จะช่วยให้คุณมีทักษะและความมั่นใจในการสร้างและติดตั้งแอปพลิเคชัน AI บน Azure

**สร้างต่อไป เรียนรู้ต่อไป และยินดีต้อนรับเข้าสู่ชุมชนนักพัฒนา Azure AI!**

---

| | |
|:---|:---|
| **📚 หน้าแรกคอร์ส** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 เอกสาร** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ เทมเพลต AI** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 ชุมชน** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->