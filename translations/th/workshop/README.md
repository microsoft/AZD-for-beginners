<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T23:02:40+00:00",
  "source_file": "workshop/README.md",
  "language_code": "th"
}
-->
# AZD สำหรับเวิร์กช็อปนักพัฒนา AI

**การนำทางเวิร์กช็อป**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../README.md)
- **📖 บทที่เกี่ยวข้อง**: ครอบคลุม [บทที่ 1](../README.md#-chapter-1-foundation--quick-start), [บทที่ 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers), และ [บทที่ 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ ห้องปฏิบัติการ**: [AI Workshop Lab](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 ขั้นตอนถัดไป**: [โมดูลห้องปฏิบัติการเวิร์กช็อป](../../../workshop)

ยินดีต้อนรับสู่เวิร์กช็อปแบบลงมือปฏิบัติสำหรับการเรียนรู้ Azure Developer CLI (AZD) โดยเน้นการปรับใช้แอปพลิเคชัน AI เวิร์กช็อปนี้ออกแบบมาเพื่อพาคุณจากพื้นฐาน AZD ไปจนถึงการปรับใช้โซลูชัน AI ที่พร้อมใช้งานในระดับการผลิต

## ภาพรวมเวิร์กช็อป

**ระยะเวลา:** 2-3 ชั่วโมง  
**ระดับ:** ผู้เริ่มต้นถึงระดับกลาง  
**ข้อกำหนดเบื้องต้น:** ความรู้พื้นฐานเกี่ยวกับ Azure, เครื่องมือบรรทัดคำสั่ง และแนวคิด AI

### สิ่งที่คุณจะได้เรียนรู้

- **พื้นฐาน AZD**: ทำความเข้าใจ Infrastructure as Code ด้วย AZD
- 🤖 **การผสานบริการ AI**: การปรับใช้ Azure OpenAI, AI Search และบริการ AI อื่น ๆ
- **การปรับใช้คอนเทนเนอร์**: ใช้ Azure Container Apps สำหรับแอปพลิเคชัน AI
- **แนวทางปฏิบัติด้านความปลอดภัย**: การใช้ Managed Identity และการตั้งค่าคอนฟิกที่ปลอดภัย
- **การตรวจสอบและการสังเกตการณ์**: การตั้งค่า Application Insights สำหรับงาน AI
- **รูปแบบการผลิต**: กลยุทธ์การปรับใช้ที่พร้อมใช้งานในระดับองค์กร

## โครงสร้างเวิร์กช็อป

### โมดูล 1: พื้นฐาน AZD (30 นาที)
- การติดตั้งและตั้งค่า AZD
- ทำความเข้าใจโครงสร้างโปรเจกต์ AZD
- การปรับใช้ AZD ครั้งแรกของคุณ
- **ห้องปฏิบัติการ**: ปรับใช้แอปพลิเคชันเว็บง่าย ๆ

### โมดูล 2: การผสาน Azure OpenAI (45 นาที)
- การตั้งค่าทรัพยากร Azure OpenAI
- กลยุทธ์การปรับใช้โมเดล
- การตั้งค่าการเข้าถึง API และการตรวจสอบสิทธิ์
- **ห้องปฏิบัติการ**: ปรับใช้แอปพลิเคชันแชทด้วย GPT-4

### โมดูล 3: แอปพลิเคชัน RAG (45 นาที)
- การผสาน Azure AI Search
- การประมวลผลเอกสารด้วย Azure Document Intelligence
- การฝังเวกเตอร์และการค้นหาเชิงความหมาย
- **ห้องปฏิบัติการ**: สร้างระบบถามตอบเอกสาร

### โมดูล 4: การปรับใช้ในระดับการผลิต (30 นาที)
- การตั้งค่าคอนฟิก Container Apps
- การปรับขนาดและการเพิ่มประสิทธิภาพ
- การตรวจสอบและการบันทึก
- **ห้องปฏิบัติการ**: ปรับใช้ในระดับการผลิตพร้อมการสังเกตการณ์

### โมดูล 5: รูปแบบขั้นสูง (15 นาที)
- การปรับใช้หลายสภาพแวดล้อม
- การผสาน CI/CD
- กลยุทธ์การเพิ่มประสิทธิภาพต้นทุน
- **สรุป**: เช็คลิสต์ความพร้อมใช้งานในระดับการผลิต

## ข้อกำหนดเบื้องต้น

### เครื่องมือที่จำเป็น

โปรดติดตั้งเครื่องมือเหล่านี้ก่อนเริ่มเวิร์กช็อป:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### การตั้งค่าบัญชี Azure

1. **การสมัครใช้งาน Azure**: [สมัครใช้งานฟรี](https://azure.microsoft.com/free/)  
2. **การเข้าถึง Azure OpenAI**: [ขอการเข้าถึง](https://aka.ms/oai/access)  
3. **สิทธิ์ที่จำเป็น**:  
   - บทบาท Contributor ในการสมัครใช้งานหรือกลุ่มทรัพยากร  
   - User Access Administrator (สำหรับการกำหนด RBAC)

### ตรวจสอบข้อกำหนดเบื้องต้น

เรียกใช้สคริปต์นี้เพื่อตรวจสอบการตั้งค่าของคุณ:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## วัสดุเวิร์กช็อป

### การฝึกปฏิบัติในห้องปฏิบัติการ

แต่ละโมดูลมีห้องปฏิบัติการแบบลงมือปฏิบัติพร้อมโค้ดเริ่มต้นและคำแนะนำทีละขั้นตอน:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - การปรับใช้ AZD ครั้งแรกของคุณ  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - แอปพลิเคชันแชทด้วย Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - แอปพลิเคชัน RAG ด้วย AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - รูปแบบการปรับใช้ในระดับการผลิต  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - สถานการณ์การปรับใช้ขั้นสูง  

### วัสดุอ้างอิง

- **[AI Foundry Integration Guide](../docs/ai-foundry/azure-ai-foundry-integration.md)** - รูปแบบการผสานที่ครอบคลุม  
- **[AI Model Deployment Guide](../docs/ai-foundry/ai-model-deployment.md)** - แนวทางปฏิบัติที่ดีที่สุดในการปรับใช้โมเดล  
- **[Production AI Practices](../docs/ai-foundry/production-ai-practices.md)** - รูปแบบการปรับใช้ในระดับองค์กร  
- **[AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md)** - ปัญหาทั่วไปและวิธีแก้ไข  

### เทมเพลตตัวอย่าง

เทมเพลตเริ่มต้นอย่างรวดเร็วสำหรับสถานการณ์ AI ทั่วไป:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## เริ่มต้นใช้งาน

### ตัวเลือกที่ 1: GitHub Codespaces (แนะนำ)

วิธีที่เร็วที่สุดในการเริ่มต้นเวิร์กช็อป:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### ตัวเลือกที่ 2: การพัฒนาบนเครื่องของคุณ

1. **โคลนที่เก็บเวิร์กช็อป:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **เข้าสู่ระบบ Azure:**
```bash
az login
azd auth login
```

3. **เริ่มต้นด้วยห้องปฏิบัติการที่ 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### ตัวเลือกที่ 3: เวิร์กช็อปที่มีผู้สอนนำ

หากคุณเข้าร่วมเซสชันที่มีผู้สอนนำ:

- 🎥 **การบันทึกเวิร์กช็อป**: [พร้อมใช้งานตามคำขอ](https://aka.ms/azd-ai-workshop)  
- 💬 **ชุมชน Discord**: [เข้าร่วมเพื่อรับการสนับสนุนสด](https://aka.ms/foundry/discord)  
- **ความคิดเห็นเกี่ยวกับเวิร์กช็อป**: [แบ่งปันประสบการณ์ของคุณ](https://aka.ms/azd-workshop-feedback)  

## ไทม์ไลน์เวิร์กช็อป

### การเรียนรู้ด้วยตนเอง (3 ชั่วโมง)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### เซสชันที่มีผู้สอนนำ (2.5 ชั่วโมง)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## เกณฑ์ความสำเร็จ

เมื่อจบเวิร์กช็อปนี้ คุณจะสามารถ:

✅ **ปรับใช้แอปพลิเคชัน AI** โดยใช้เทมเพลต AZD  
✅ **ตั้งค่าบริการ Azure OpenAI** พร้อมการรักษาความปลอดภัยที่เหมาะสม  
✅ **สร้างแอปพลิเคชัน RAG** ด้วยการผสาน Azure AI Search  
✅ **ใช้รูปแบบการผลิต** สำหรับงาน AI ในระดับองค์กร  
✅ **ตรวจสอบและแก้ไขปัญหา** การปรับใช้แอปพลิเคชัน AI  
✅ **ใช้กลยุทธ์การเพิ่มประสิทธิภาพต้นทุน** สำหรับงาน AI  

## ชุมชนและการสนับสนุน

### ระหว่างเวิร์กช็อป

- 🙋 **คำถาม**: ใช้แชทเวิร์กช็อปหรือยกมือ  
- 🐛 **ปัญหา**: ตรวจสอบ [คู่มือการแก้ไขปัญหา](../docs/troubleshooting/ai-troubleshooting.md)  
- **เคล็ดลับ**: แบ่งปันสิ่งที่ค้นพบกับผู้เข้าร่วมคนอื่น ๆ  

### หลังเวิร์กช็อป

- 💬 **Discord**: [ชุมชน Azure AI Foundry](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [รายงานปัญหาเทมเพลต](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **ความคิดเห็น**: [แบบฟอร์มประเมินเวิร์กช็อป](https://aka.ms/azd-workshop-feedback)  

## ขั้นตอนถัดไป

### เรียนรู้เพิ่มเติม

1. **สถานการณ์ขั้นสูง**: สำรวจ [การปรับใช้หลายภูมิภาค](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **การผสาน CI/CD**: ตั้งค่า [เวิร์กโฟลว์ GitHub Actions](../docs/deployment/github-actions.md)  
3. **เทมเพลตที่กำหนดเอง**: สร้าง [เทมเพลต AZD ของคุณเอง](../docs/getting-started/custom-templates.md)  

### ใช้ในโปรเจกต์ของคุณ

1. **การประเมิน**: ใช้ [เช็คลิสต์ความพร้อมใช้งาน](./production-readiness-checklist.md)  
2. **เทมเพลต**: เริ่มต้นด้วย [เทมเพลตเฉพาะ AI](../../../workshop/templates)  
3. **การสนับสนุน**: เข้าร่วม [Discord Azure AI Foundry](https://aka.ms/foundry/discord)  

### แบ่งปันความสำเร็จของคุณ

- ⭐ **ให้ดาวที่เก็บข้อมูล** หากเวิร์กช็อปนี้ช่วยคุณ  
- 🐦 **แบ่งปันบนโซเชียลมีเดีย** ด้วย #AzureDeveloperCLI #AzureAI  
- 📝 **เขียนบล็อกโพสต์** เกี่ยวกับการเดินทางการปรับใช้ AI ของคุณ  

---

## ความคิดเห็นเกี่ยวกับเวิร์กช็อป

ความคิดเห็นของคุณช่วยให้เราปรับปรุงประสบการณ์เวิร์กช็อป:

| ด้าน | คะแนน (1-5) | ความคิดเห็น |
|------|--------------|-------------|
| คุณภาพเนื้อหา | ⭐⭐⭐⭐⭐ | |
| ห้องปฏิบัติการแบบลงมือปฏิบัติ | ⭐⭐⭐⭐⭐ | |
| เอกสารประกอบ | ⭐⭐⭐⭐⭐ | |
| ระดับความยาก | ⭐⭐⭐⭐⭐ | |
| ประสบการณ์โดยรวม | ⭐⭐⭐⭐⭐ | |

**ส่งความคิดเห็น**: [แบบฟอร์มประเมินเวิร์กช็อป](https://aka.ms/azd-workshop-feedback)

---

**ก่อนหน้า:** [AI Troubleshooting Guide](../docs/troubleshooting/ai-troubleshooting.md) | **ถัดไป:** เริ่มต้นด้วย [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**พร้อมที่จะเริ่มสร้างแอปพลิเคชัน AI ด้วย AZD แล้วหรือยัง?**

[เริ่มต้น Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้องมากที่สุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้