# บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ดและการปรับใช้

**📚 หลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md) | **⏱️ ระยะเวลา**: อ่าน 2-3 ชั่วโมง; ให้เวลาพิเศษสำหรับแบบฝึกหัดการปรับใช้ | **⭐ ความซับซ้อน**: ระดับกลาง

---

## ภาพรวม

บทนี้ ครอบคลุมรูปแบบโครงสร้างพื้นฐานเป็นโค้ด (IaC) ด้วยเทมเพลต Bicep การจัดหาทรัพยากร และกลยุทธ์การปรับใช้โดยใช้ Azure Developer CLI

> รีวิวเป้าหมายคำสั่งและการกำหนดค่า: `azd 1.37.2` (พฤศจิกายน 2026) ไม่ได้มีการเรียกใช้งานการจัดหา Azure จริงในระหว่างการตรวจสอบ

## วัตถุประสงค์การเรียนรู้

เมื่อทำบทนี้เสร็จ คุณจะ:
- เข้าใจโครงสร้างและไวยากรณ์ของเทมเพลต Bicep
- จัดหาทรัพยากร Azure ด้วย `azd provision`
- ปรับใช้แอปพลิเคชันด้วย `azd deploy`
- นำกลยุทธ์การปรับใช้แบบ blue-green และแบบ rolling ไปใช้

---

## 📚 บทเรียน

| # | บทเรียน | คำอธิบาย | เวลา |
|---|--------|-------------|------|
| 1 | [การจัดหาทรัพยากร](provisioning.md) | การจัดการทรัพยากร Azure ด้วย AZD | 45 นาที |
| 2 | [คู่มือการปรับใช้](deployment-guide.md) | กลยุทธ์การปรับใช้แอปพลิเคชัน | 45 นาที |
| 3 | [การเขียนเทมเพลตของคุณเอง](custom-templates.md) | สร้างและเผยแพร่เทมเพลต azd ที่ใช้ซ้ำได้ | 30 นาที |

---

## 🚀 เริ่มต้นอย่างรวดเร็ว

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 โครงสร้างโปรเจกต์ AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 คำสั่งสำคัญ

| คำสั่ง | คำอธิบาย |
|---------|-------------|
| `azd init` | เริ่มต้นโปรเจกต์ |
| `azd provision` | สร้างทรัพยากร Azure |
| `azd deploy` | ปรับใช้รหัสแอปพลิเคชัน |
| `azd up` | provision + deploy |
| `azd down` | ลบทรัพยากรทั้งหมด |

---

## 🔗 การนำทาง

| ทิศทาง | บทที่ |
|-----------|---------|
| **ก่อนหน้า** | [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/README.md) |
| **ถัดไป** | [บทที่ 5: โซลูชันหลายตัวแทน](../chapter-05-multi-agent/README.md) |

---

## 📖 แหล่งข้อมูลที่เกี่ยวข้อง

- [การตรวจสอบก่อนปรับใช้](../chapter-06-pre-deployment/README.md)
- [ตัวอย่างแอปรูปแบบ Container App](../../examples/container-app/README.md)
- [ตัวอย่างแอปฐานข้อมูล](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->