# บทที่ 2: การพัฒนาแบบ AI-First

**📚 คอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md) | **⏱️ ระยะเวลา**: 1-2 ชั่วโมง | **⭐ ความซับซ้อน**: ระดับกลาง

---

## ภาพรวม

บทนี้มุ่งเน้นที่การปรับใช้แอปพลิเคชันที่ขับเคลื่อนด้วย AI โดยใช้ Azure Developer CLI และบริการ Microsoft Foundry ตั้งแต่แอปแชท AI ง่าย ๆ ไปจนถึงเอเจนต์อัจฉริยะที่มีเครื่องมือ

> **หมายเหตุการตรวจสอบ (2026-07-13):** ลำดับคำสั่งและคำแนะนำส่วนขยายในบทนี้ได้รับการตรวจสอบกับ `azd` `1.27.1` และรุ่นพรีวิวปัจจุบันของส่วนขยายเอเจนต์ AI `azure.ai.agents` `1.0.0-beta.5` หากคุณใช้ AZD รุ่นเก่าโปรดอัปเดตก่อนแล้วจึงดำเนินการตามแบบฝึกหัด

## วัตถุประสงค์การเรียนรู้

โดยการเรียนจบบทนี้ คุณจะได้:
- ปรับใช้แอป AI โดยใช้เทมเพลต AZD ที่สร้างไว้ล่วงหน้า
- เข้าใจการผสานการทำงานของ Microsoft Foundry กับ AZD
- กำหนดค่าและปรับแต่งเอเจนต์ AI ด้วยเครื่องมือ
- ปรับใช้แอป RAG (Retrieval-Augmented Generation)

---

## 📚 บทเรียน

| # | บทเรียน | คำอธิบาย | เวลา |
|---|--------|-------------|------|
| 1 | [การผสาน Microsoft Foundry](microsoft-foundry-integration.md) | เชื่อมต่อ AZD กับบริการ Foundry | 30 นาที |
| 2 | [คู่มือเอเจนต์ AI](agents.md) | ปรับใช้เอเจนต์อัจฉริยะพร้อมเครื่องมือ | 45 นาที |
| 3 | [การปรับใช้โมเดล AI](ai-model-deployment.md) | ปรับใช้และกำหนดค่าโมเดล AI | 30 นาที |
| 4 | [ห้องปฏิบัติการเวิร์กช็อป AI](ai-workshop-lab.md) | ลงมือทำ: ทำให้โซลูชัน AI ของคุณพร้อมใช้กับ AZD | 60 นาที |

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

## 🤖 เทมเพลต AI ที่โดดเด่น

| เทมเพลต | คำอธิบาย | บริการ |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | การแชท RAG พร้อมการอ้างอิง | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | เอเจนต์ AI พร้อมเครื่องมือ | บริการเอเจนต์ AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | แชท AI พื้นฐาน | OpenAI + Container Apps |

---

## 💰 การรับรู้ค่าใช้จ่าย

| สภาพแวดล้อม | ค่าใช้จ่ายรายเดือนโดยประมาณ |
|-------------|----------------------|
| การพัฒนา | $80-150 |
| สเตจจิ้ง | $150-300 |
| การผลิต | $300-3,500+ |

**เคล็ดลับ:** รันคำสั่ง `azd down` หลังการทดสอบเพื่อหลีกเลี่ยงค่าใช้จ่าย

---

## 🔗 การนำทาง

| ทิศทาง | บทที่ |
|-----------|---------|
| **ก่อนหน้า** | [บทที่ 1: รากฐาน](../chapter-01-foundation/README.md) |
| **ถัดไป** | [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/README.md) |
| **ข้ามไป** | [บทที่ 8: รูปแบบการผลิต](../chapter-08-production/README.md) |

---

## 📖 ทรัพยากรที่เกี่ยวข้อง

- [การแก้ไขปัญหา AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [แนวทางปฏิบัติ AI ในการผลิต](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->