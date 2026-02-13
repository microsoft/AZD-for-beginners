# บทที่ 2: การพัฒนาแบบ AI-First

**📚 หลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md) | **⏱️ ระยะเวลา**: 1-2 hours | **⭐ ความซับซ้อน**: Intermediate

---

## ภาพรวม

บทนี้มุ่งเน้นการปรับใช้แอปพลิเคชันที่ขับเคลื่อนด้วย AI โดยใช้ Azure Developer CLI และบริการ Microsoft Foundry ตั้งแต่แอปแชท AI ที่เรียบง่ายไปจนถึงเอเยนต์อัจฉริยะที่มีเครื่องมือ

## วัตถุประสงค์การเรียนรู้

เมื่อทำบทนี้เสร็จ คุณจะสามารถ:
- ปรับใช้แอป AI โดยใช้เทมเพลต AZD ที่เตรียมไว้แล้ว
- เข้าใจการผสาน Microsoft Foundry กับ AZD
- กำหนดค่าและปรับแต่งเอเยนต์ AI พร้อมเครื่องมือ
- ปรับใช้แอป RAG (Retrieval-Augmented Generation)

---

## 📚 บทเรียน

| # | บทเรียน | คำอธิบาย | เวลา |
|---|--------|-------------|------|
| 1 | [การผสาน Microsoft Foundry](microsoft-foundry-integration.md) | เชื่อม AZD กับบริการ Foundry | 30 min |
| 2 | [คู่มือเอเจนต์ AI](agents.md) | ปรับใช้เอเยนต์อัจฉริยะพร้อมเครื่องมือ | 45 min |
| 3 | [การปรับใช้โมเดล AI](ai-model-deployment.md) | ปรับใช้และกำหนดค่ารุ่น AI | 30 min |
| 4 | [แลปเวิร์กช็อป AI](ai-workshop-lab.md) | ลงมือปฏิบัติ: ทำให้โซลูชัน AI ของคุณพร้อมกับ AZD | 60 min |

---

## 🚀 เริ่มต้นอย่างรวดเร็ว

```bash
# ตัวเลือก 1: แอปพลิเคชันแชท RAG
azd init --template azure-search-openai-demo
azd up

# ตัวเลือก 2: เอเจนต์ AI
azd init --template get-started-with-ai-agents
azd up

# ตัวเลือก 3: แอปแชทด่วน
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 เทมเพลต AI เด่น

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | แชท RAG พร้อมการอ้างอิง | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | เอเยนต์ AI พร้อมเครื่องมือ | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | แชท AI พื้นฐาน | OpenAI + Container Apps |

---

## 💰 การรับรู้ค่าใช้จ่าย

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**คำแนะนำ:** เรียกใช้ `azd down` หลังจากทดสอบเพื่อหลีกเลี่ยงการเรียกเก็บเงิน

---

## 🔗 การนำทาง

| Direction | Chapter |
|-----------|---------|
| **ก่อนหน้า** | [บทที่ 1: พื้นฐาน](../chapter-01-foundation/README.md) |
| **ถัดไป** | [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/README.md) |
| **ข้ามไปที่** | [บทที่ 8: รูปแบบการใช้งานจริง](../chapter-08-production/README.md) |

---

## 📖 ทรัพยากรที่เกี่ยวข้อง

- [การแก้ปัญหา AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [แนวปฏิบัติ AI สำหรับการใช้งานจริง](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิดชอบ:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อนได้ เอกสารต้นฉบับในภาษาต้นฉบับควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่มีความสำคัญ แนะนำให้ใช้การแปลโดยนักแปลมืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->