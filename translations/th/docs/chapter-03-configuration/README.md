# บทที่ 3: การกำหนดค่าและการตรวจสอบสิทธิ์

**📚 คอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md) | **⏱️ ระยะเวลา**: 90-150 นาที รวมการฝึกปฏิบัติการรวมระบบ | **⭐ ความซับซ้อน**: ระดับกลาง

---

## ภาพรวม

บทนี้ครอบคลุมการกำหนดค่าสภาพแวดล้อม รูปแบบการตรวจสอบสิทธิ์ และแนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัยสำหรับการปรับใช้ Azure Developer CLI

> เป้าหมายการตรวจสอบคำสั่งและการกำหนดค่า: `azd 1.37.2` (พฤศจิกายน 2026) ไม่มีการดำเนินการ provisioning Azure จริงในระหว่างการตรวจสอบ

## วัตถุประสงค์การเรียนรู้

เมื่อทำบทนี้จบ คุณจะสามารถ:
- เชี่ยวชาญลำดับชั้นการกำหนดค่า AZD
- จัดการสภาพแวดล้อมหลายแบบ (dev, staging, prod)
- นำรูปแบบการตรวจสอบสิทธิ์แบบจัดการอัตลักษณ์มาใช้
- กำหนดค่าการตั้งค่าสำหรับแต่ละสภาพแวดล้อมเฉพาะ

---

## 📚 บทเรียน

| # | บทเรียน | คำอธิบาย | เวลา |
|---|--------|-------------|------|
| 1 | [คู่มือการกำหนดค่า](configuration.md) | การตั้งค่าและการจัดการสภาพแวดล้อม | 30 นาที |
| 2 | [การตรวจสอบสิทธิ์ & ความปลอดภัย](authsecurity.md) | รูปแบบอัตลักษณ์ที่จัดการและ RBAC | 30 นาที |

---

## 🚀 เริ่มต้นอย่างรวดเร็ว

รันจากโฟลเดอร์รากของ **แอปพลิเคชัน azd ที่ถูกกำหนดค่าแล้ว** ไม่ใช่ที่เก็บคอร์ส ใช้ชื่อสภาพแวดล้อมที่ยังไม่ได้ใช้ถ้ามีอยู่แล้ว

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` เป็นตัวอย่าง: มีผลต่อโครงสร้างพื้นฐานเฉพาะเมื่อเทมเพลตของคุณใช้มันอย่างชัดเจน ค่าธรรมดาของ `azd env set` จะถูกบันทึกในเครื่องในรูปแบบข้อความธรรมดา; ไม่ใช่การเก็บความลับอย่างปลอดภัย

---

## 🔧 ลำดับชั้นการกำหนดค่า

แยกสามพื้นผิวการกำหนดค่าที่แตกต่างกัน: ค่ากำหนดทั่วไป (`azd config`), โครงสร้างโปรเจกต์ (`azure.yaml`), และค่าต่อสภาพแวดล้อม (`azd env`) ธงสั่งงานจะเขียนทับเฉพาะการตั้งค่าที่สนับสนุนเท่านั้น; ไม่มีการทับค่าตัวแปรสภาพแวดล้อมใด ๆ กับ `azure.yaml` หรือ Bicep อย่างกว้างขวาง

---

## 🔐 แนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 การนำทาง

| ทิศทาง | บทที่ |
|-----------|---------|
| **ก่อนหน้า** | [บทที่ 2: การพัฒนา AI](../chapter-02-ai-development/README.md) |
| **ถัดไป** | [บทที่ 4: โครงสร้างพื้นฐาน](../chapter-04-infrastructure/README.md) |

---

## 📖 ทรัพยากรที่เกี่ยวข้อง

- [การตรวจสอบก่อนปรับใช้](../chapter-06-pre-deployment/README.md)
- [การแก้ไขปัญหา](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->