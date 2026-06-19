# Chapter 1: Foundation & Quick Start

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 30-45 minutes | **⭐ Complexity**: Beginner

---

## Overview

บทนี้แนะนำพื้นฐานของ Azure Developer CLI (azd) คุณจะได้เรียนรู้แนวคิดหลัก, การติดตั้งเครื่องมือ และการปรับใช้แอปพลิเคชันแรกของคุณไปยัง Azure

> ตรวจสอบกับ `azd 1.25.6` ในเดือนมิถุนายน 2026

## Learning Objectives

เมื่อคุณทำบทนี้สำเร็จ คุณจะ:
- เข้าใจว่า Azure Developer CLI คืออะไรและแตกต่างจาก Azure CLI อย่างไร
- ติดตั้งและกำหนดค่า AZD บนแพลตฟอร์มของคุณ
- ปรับใช้แอปพลิเคชันแรกของคุณไปยัง Azure ด้วย `azd up`
- ทำความสะอาดทรัพยากรด้วย `azd down`

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | แนวคิดหลัก, คำศัพท์, และโครงสร้างโปรเจกต์ | 15 min |
| 2 | [Installation & Setup](installation.md) | คู่มือการติดตั้งเฉพาะแพลตฟอร์ม | 10 min |
| 3 | [Your First Project](first-project.md) | ลงมือทำ: ปรับใช้เว็บแอปไปยัง Azure | 20 min |
| 4 | [Bring Your Own App](bring-your-own-app.md) | เพิ่ม azd เข้าไปยังโปรเจกต์ที่คุณมีอยู่แล้ว | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | สภาพแวดล้อม azd ที่ทำซ้ำได้ด้วย dev containers | 15 min |

---

## ✅ Start Here: Validate Your Setup

ก่อนเริ่ม ให้ตรวจสอบว่าคอมพิวเตอร์ของคุณพร้อมสำหรับแม่แบบบทที่ 1 หรือไม่:

**Windows:**  
```powershell
.\validate-setup.ps1
```
  
**macOS / Linux:**  
```bash
bash ./validate-setup.sh
```
  
หากสคริปต์แจ้งว่าเครื่องมือขาดหาย ให้แก้ไขก่อนแล้วจึงดำเนินการในบทนี้ต่อ

---

## 🚀 Quick Start

```bash
# ตรวจสอบการติดตั้ง
azd version

# ยืนยันตัวตนสำหรับ AZD
# ตัวเลือก: az login หากคุณวางแผนที่จะรันคำสั่ง Azure CLI โดยตรง
azd auth login

# เปิดตัวแอปแรกของคุณ
azd init --template todo-nodejs-mongo
azd up

# ล้างข้อมูลเมื่อเสร็จสิ้น
azd down --force --purge
```
  
---

## ✅ Success Criteria

หลังจากทำบทนี้เสร็จ คุณควรจะสามารถ:

```bash
azd version              # แสดงเวอร์ชันที่ติดตั้ง
azd init --template todo-nodejs-mongo  # เริ่มต้นโครงการ
azd up                   # จัดการปรับใช้ไปยัง Azure
azd show                 # แสดง URL ของแอปที่กำลังทำงาน
azd down --force --purge # ทำความสะอาดทรัพยากร
```
  
---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Next** | [Chapter 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Skip to** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |

---

## 📖 Related Resources

- [Command Cheat Sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossary](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->