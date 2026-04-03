# Chapter 4: Infrastructure as Code & Deployment

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## Overview

บทนี้ครอบคลุมรูปแบบ Infrastructure as Code (IaC) ด้วยเทมเพลต Bicep, การจัดสรรทรัพยากร และกลยุทธ์การปรับใช้โดยใช้ Azure Developer CLI

> ตรวจสอบความถูกต้องกับ `azd 1.23.12` ในเดือนมีนาคม 2026

## Learning Objectives

เมื่อผ่านบทนี้แล้ว คุณจะ:
- เข้าใจโครงสร้างและไวยากรณ์ของเทมเพลต Bicep
- จัดสรรทรัพยากร Azure ด้วย `azd provision`
- ปรับใช้แอปพลิเคชันด้วย `azd deploy`
- นำกลยุทธ์การปรับใช้แบบ blue-green และ rolling มาใช้งาน

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | การจัดการทรัพยากร Azure ด้วย AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | กลยุทธ์การปรับใช้แอปพลิเคชัน | 45 min |

---

## 🚀 Quick Start

```bash
# เริ่มต้นจากแม่แบบ
azd init --template azure-functions-python-v2-http

# แสดงตัวอย่างสิ่งที่จะถูกสร้าง
azd provision --preview

# จัดเตรียมโครงสร้างพื้นฐานเท่านั้น
azd provision

# นำรหัสขึ้นใช้งานเท่านั้น
azd deploy

# หรือทั้งสองอย่างพร้อมกัน
azd up
```

---

## 📁 AZD Project Structure

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

## 🔧 Essential Commands

| Command | Description |
|---------|-------------|
| `azd init` | เริ่มต้นโปรเจกต์ |
| `azd provision` | สร้างทรัพยากร Azure |
| `azd deploy` | ปรับใช้โค้ดแอปพลิเคชัน |
| `azd up` | provision + deploy |
| `azd down` | ลบทรัพยากรทั้งหมด |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Next** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 Related Resources

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ความถูกต้อง แต่กรุณาทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่มีความสำคัญ ควรใช้บริการแปลโดยมืออาชีพทางภาษา เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใด ๆ ที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->