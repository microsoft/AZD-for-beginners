# Chapter 2: การพัฒนาแบบ AI-First

**📚 คอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md) | **⏱️ ระยะเวลา**: 1-2 ชั่วโมง | **⭐ ความซับซ้อน**: ระดับกลาง

---

## ภาพรวม

บทนี้มุ่งเน้นการปรับใช้แอปพลิเคชันที่ขับเคลื่อนด้วย AI โดยใช้ Azure Developer CLI และบริการ Microsoft Foundry ตั้งแต่แอปแชท AI ง่ายๆ ไปจนถึงเอเจนท์อัจฉริยะที่มีเครื่องมือ

> **บันทึกการตรวจสอบ (2026-03-25):** โฟลว์คำสั่งและคำแนะนำส่วนขยายในบทนี้ได้รับการตรวจสอบเทียบกับ `azd` `1.23.12` และการเผยแพร่ตัวอย่าง AI agent extension `azure.ai.agents` `0.1.18-preview` รุ่นปัจจุบัน หากคุณใช้ AZD รุ่นเก่า กรุณาอัปเดตก่อนแล้วจึงดำเนินการทำแบบฝึกหัดต่อไป

## วัตถุประสงค์การเรียนรู้

หลังจากทำบทนี้จบ คุณจะสามารถ:
- ปรับใช้แอป AI โดยใช้เทมเพลต AZD ที่สร้างไว้ล่วงหน้า
- เข้าใจการรวม Microsoft Foundry กับ AZD
- กำหนดค่าและปรับแต่งเอเจนท์ AI พร้อมเครื่องมือ
- ปรับใช้แอป RAG (การสร้างข้อความโดยเสริมข้อมูล)

---

## 📚 บทเรียน

| # | บทเรียน | คำอธิบาย | เวลา |
|---|--------|-------------|------|
| 1 | [การรวม Microsoft Foundry](microsoft-foundry-integration.md) | เชื่อมต่อ AZD กับบริการ Foundry | 30 นาที |
| 2 | [คู่มือ AI Agents](agents.md) | ปรับใช้เอเจนท์อัจฉริยะพร้อมเครื่องมือ | 45 นาที |
| 3 | [การปรับใช้โมเดล AI](ai-model-deployment.md) | ปรับใช้และกำหนดค่าโมเดล AI | 30 นาที |
| 4 | [ห้องปฏิบัติการ AI Workshop](ai-workshop-lab.md) | ฝึกปฏิบัติ: ทำให้โซลูชัน AI ของคุณพร้อมใช้กับ AZD | 60 นาที |

---

## 🚀 เริ่มต้นอย่างรวดเร็ว

```bash
# ตัวเลือกที่ 1: แอปแชท RAG
azd init --template azure-search-openai-demo
azd up

# ตัวเลือกที่ 2: ตัวแทน AI
azd init --template get-started-with-ai-agents
azd up

# ตัวเลือกที่ 3: แอปแชทด่วน
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 เทมเพลต AI แนะนำ

| เทมเพลต | คำอธิบาย | บริการ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | แชท RAG พร้อมอ้างอิง | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | เอเจนท์ AI พร้อมเครื่องมือ | บริการ AI Agent |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | แชท AI เบื้องต้น | OpenAI + Container Apps |

---

## 💰 ความตระหนักเรื่องค่าใช้จ่าย

| สภาพแวดล้อม | ต้นทุนรายเดือนโดยประมาณ |
|-------------|----------------------|
| การพัฒนา | 80-150 ดอลลาร์ |
| ทดสอบ | 150-300 ดอลลาร์ |
| การผลิต | 300-3,500+ ดอลลาร์ |

**เคล็ดลับ:** รันคำสั่ง `azd down` หลังทดสอบเพื่อหลีกเลี่ยงค่าใช้จ่าย

---

## 🔗 การนำทาง

| ทิศทาง | บท |
|-----------|---------|
| **ก่อนหน้า** | [บทที่ 1: พื้นฐาน](../chapter-01-foundation/README.md) |
| **ถัดไป** | [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/README.md) |
| **ข้ามไปที่** | [บทที่ 8: รูปแบบการผลิต](../chapter-08-production/README.md) |

---

## 📖 แหล่งข้อมูลที่เกี่ยวข้อง

- [แก้ไขปัญหา AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [แนวปฏิบัติ AI สำหรับการผลิต](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความถูกต้องสูงสุด แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นฉบับควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญ แนะนำให้ใช้การแปลโดยผู้เชี่ยวชาญด้านมนุษย์ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->