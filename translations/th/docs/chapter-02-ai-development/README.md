# Chapter 2: การพัฒนา AI-First

**📚 คอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md) | **⏱️ ระยะเวลา**: 1-2 ชั่วโมง | **⭐ ความซับซ้อน**: ระดับกลาง

---

## ภาพรวม

บทนี้เน้นการปรับใช้แอปพลิเคชันที่ขับเคลื่อนด้วย AI โดยใช้ Azure Developer CLI และบริการ Microsoft Foundry ตั้งแต่แอปแชท AI แบบง่าย ไปจนถึงเอเจนต์อัจฉริยะที่มาพร้อมเครื่องมือ

> **หมายเหตุตรวจสอบ (2026-06-15):** ลำดับคำสั่งและคำแนะนำส่วนขยายในบทนี้ถูกตรวจสอบกับ `azd` `1.25.6` และรุ่นพรีวิวส่วนขยาย AI agent ปัจจุบัน `azure.ai.agents` `0.1.40-preview` หากคุณใช้ AZD รุ่นเก่า กรุณาอัปเดตก่อนและดำเนินการตามแบบฝึกหัดต่อไป

## วัตถุประสงค์การเรียนรู้

เมื่อเสร็จสิ้นบทนี้ คุณจะสามารถ:
- ปรับใช้แอป AI โดยใช้เทมเพลต AZD ที่สร้างไว้ล่วงหน้า
- เข้าใจการรวม Microsoft Foundry กับ AZD
- กำหนดค่าและปรับแต่งเอเจนต์ AI พร้อมเครื่องมือ
- ปรับใช้แอป RAG (Retrieval-Augmented Generation)

---

## 📚 บทเรียน

| # | บทเรียน | คำอธิบาย | เวลา |
|---|--------|-------------|------|
| 1 | [การรวม Microsoft Foundry](microsoft-foundry-integration.md) | เชื่อมต่อ AZD กับบริการ Foundry | 30 นาที |
| 2 | [คู่มือ AI Agents](agents.md) | ปรับใช้เอเจนต์อัจฉริยะพร้อมเครื่องมือ | 45 นาที |
| 3 | [การปรับใช้โมเดล AI](ai-model-deployment.md) | ปรับใช้และกำหนดค่าโมเดล AI | 30 นาที |
| 4 | [ห้องปฏิบัติการเวิร์กช็อป AI](ai-workshop-lab.md) | ฝึกปฏิบัติ: ทำให้โซลูชัน AI ของคุณพร้อมใช้งานกับ AZD | 60 นาที |

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
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | การแชท RAG พร้อมการอ้างอิง | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | เอเจนต์ AI พร้อมเครื่องมือ | บริการ AI Agent |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | แชท AI พื้นฐาน | OpenAI + Container Apps |

---

## 💰 การรับรู้ค่าใช้จ่าย

| สภาพแวดล้อม | ค่าใช้จ่ายรายเดือนโดยประมาณ |
|-------------|----------------------|
| การพัฒนา | $80-150 |
| การทดสอบ | $150-300 |
| การผลิต | $300-3,500+ |

**เคล็ดลับ:** รันคำสั่ง `azd down` หลังทดสอบเพื่อหลีกเลี่ยงค่าบริการ

---

## 🔗 การนำทาง

| ทิศทาง | บท |
|-----------|---------|
| **ก่อนหน้า** | [Chapter 1: พื้นฐาน](../chapter-01-foundation/README.md) |
| **ถัดไป** | [Chapter 3: การกำหนดค่า](../chapter-03-configuration/README.md) |
| **ข้ามไป** | [Chapter 8: รูปแบบการผลิต](../chapter-08-production/README.md) |

---

## 📖 แหล่งข้อมูลที่เกี่ยวข้อง

- [การแก้ปัญหา AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [แนวทางปฏิบัติ AI ในการผลิต](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->