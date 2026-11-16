# บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว

**📚 คอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md) | **⏱️ ระยะเวลา**: 75-120 นาที รวมการดีพลอยครั้งแรก; แบบฝึกหัดเพิ่มเติมใช้เวลานานกว่า | **⭐ ความซับซ้อน**: ระดับผู้เริ่มต้น

---

## ภาพรวม

บทนี้จะแนะนำพื้นฐานของ Azure Developer CLI (azd) คุณจะได้เรียนรู้แนวคิดหลัก ติดตั้งเครื่องมือ และดีพลอยแอปพลิเคชันแรกของคุณไปยัง Azure

> เป้าหมายการทบทวนคำสั่งและการกำหนดค่า: `azd 1.37.2` (พฤศจิกายน 2026) ไม่มีการดำเนินการ provisioning จริงบน Azure ในระหว่างการทบทวน

## วัตถุประสงค์การเรียนรู้

เมื่อคุณทำบทนี้เสร็จ คุณจะสามารถ:
- เข้าใจว่า Azure Developer CLI คืออะไรและแตกต่างจาก Azure CLI อย่างไร
- ติดตั้งและกำหนดค่า AZD บนแพลตฟอร์มของคุณ
- ดีพลอยแอปพลิเคชันแรกของคุณไปยัง Azure ด้วย `azd up`
- ทำความสะอาดทรัพยากรด้วย `azd down`

---

## 📚 บทเรียน

| # | บทเรียน | รายละเอียด | เวลา |
|---|--------|-------------|------|
| 1 | [พื้นฐาน AZD](azd-basics.md) | แนวคิดหลัก คำศัพท์ และโครงสร้างโปรเจกต์ | 15 นาที |
| 2 | [การติดตั้ง & ตั้งค่า](installation.md) | คู่มือการติดตั้งเฉพาะแพลตฟอร์ม | 10 นาที |
| 3 | [โปรเจกต์แรกของคุณ](first-project.md) | ฝึกปฏิบัติ: ดีพลอยเว็บแอปไปยัง Azure | 20 นาที |
| 4 | [นำแอปของคุณมาใช้](bring-your-own-app.md) | เพิ่ม azd ให้โปรเจกต์ที่มีอยู่ของคุณ | 15 นาที |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | สภาพแวดล้อม azd ที่นำกลับมาใช้ใหม่ได้ด้วย dev containers | 15 นาที |

---

## ✅ เริ่มที่นี่: ตรวจสอบการตั้งค่าของคุณ

ก่อนเริ่ม ให้ยืนยันว่าเครื่องของคุณพร้อมสำหรับเทมเพลตบทที่ 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

หากสคริปต์แจ้งว่าเครื่องมือขาดหาย ให้แก้ไขก่อนแล้วค่อยดำเนินการต่อในบทนี้

---

## 🚀 เริ่มต้นอย่างรวดเร็ว

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ เกณฑ์ความสำเร็จ

หลังจากทำบทนี้เสร็จ คุณควรจะสามารถ:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 การนำทาง

| ทิศทาง | บทที่ |
|-----------|---------|
| **ถัดไป** | [บทที่ 2: การพัฒนาด้วย AI เป็นศูนย์กลาง](../chapter-02-ai-development/README.md) |
| **ข้ามไปที่** | [บทที่ 3: การกำหนดค่า](../chapter-03-configuration/README.md) |

---

## 📖 แหล่งข้อมูลที่เกี่ยวข้อง

- [แผ่นโกงคำสั่ง](../../resources/cheat-sheet.md)
- [คำถามที่พบบ่อย](../../resources/faq.md)
- [พจนานุกรมคำศัพท์](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->