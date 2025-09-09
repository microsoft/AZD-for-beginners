<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-09T21:34:22+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "th"
}
-->
# AZD Basics - ทำความเข้าใจ Azure Developer CLI

## บทนำ

บทเรียนนี้จะแนะนำคุณให้รู้จักกับ Azure Developer CLI (azd) ซึ่งเป็นเครื่องมือบรรทัดคำสั่งที่ทรงพลังที่ช่วยเร่งการเดินทางของคุณจากการพัฒนาท้องถิ่นไปจนถึงการปรับใช้บน Azure คุณจะได้เรียนรู้แนวคิดพื้นฐาน ฟีเจอร์หลัก และเข้าใจว่า azd ช่วยให้การปรับใช้แอปพลิเคชันแบบคลาวด์เนทีฟง่ายขึ้นอย่างไร

## เป้าหมายการเรียนรู้

เมื่อจบบทเรียนนี้ คุณจะสามารถ:
- เข้าใจว่า Azure Developer CLI คืออะไรและมีวัตถุประสงค์หลักอย่างไร
- เรียนรู้แนวคิดหลักเกี่ยวกับเทมเพลต สภาพแวดล้อม และบริการ
- สำรวจฟีเจอร์สำคัญ เช่น การพัฒนาที่ขับเคลื่อนด้วยเทมเพลตและ Infrastructure as Code
- เข้าใจโครงสร้างและเวิร์กโฟลว์ของโปรเจกต์ azd
- เตรียมพร้อมสำหรับการติดตั้งและกำหนดค่า azd ในสภาพแวดล้อมการพัฒนาของคุณ

## ผลลัพธ์การเรียนรู้

หลังจากจบบทเรียนนี้ คุณจะสามารถ:
- อธิบายบทบาทของ azd ในเวิร์กโฟลว์การพัฒนาบนคลาวด์ยุคใหม่
- ระบุส่วนประกอบของโครงสร้างโปรเจกต์ azd
- อธิบายว่าเทมเพลต สภาพแวดล้อม และบริการทำงานร่วมกันอย่างไร
- เข้าใจประโยชน์ของ Infrastructure as Code ด้วย azd
- รู้จักคำสั่งต่างๆ ของ azd และวัตถุประสงค์ของแต่ละคำสั่ง

## Azure Developer CLI (azd) คืออะไร?

Azure Developer CLI (azd) เป็นเครื่องมือบรรทัดคำสั่งที่ออกแบบมาเพื่อเร่งการเดินทางของคุณจากการพัฒนาท้องถิ่นไปจนถึงการปรับใช้บน Azure มันช่วยให้กระบวนการสร้าง ปรับใช้ และจัดการแอปพลิเคชันแบบคลาวด์เนทีฟบน Azure ง่ายขึ้น

## แนวคิดหลัก

### เทมเพลต
เทมเพลตเป็นพื้นฐานของ azd ซึ่งประกอบด้วย:
- **โค้ดแอปพลิเคชัน** - โค้ดต้นฉบับและการพึ่งพา
- **การกำหนดโครงสร้างพื้นฐาน** - ทรัพยากร Azure ที่กำหนดใน Bicep หรือ Terraform
- **ไฟล์การกำหนดค่า** - การตั้งค่าและตัวแปรสภาพแวดล้อม
- **สคริปต์การปรับใช้** - เวิร์กโฟลว์การปรับใช้อัตโนมัติ

### สภาพแวดล้อม
สภาพแวดล้อมแสดงถึงเป้าหมายการปรับใช้ที่แตกต่างกัน:
- **Development** - สำหรับการทดสอบและพัฒนา
- **Staging** - สภาพแวดล้อมก่อนการผลิต
- **Production** - สภาพแวดล้อมการผลิตจริง

แต่ละสภาพแวดล้อมมี:
- กลุ่มทรัพยากร Azure ของตัวเอง
- การตั้งค่าการกำหนดค่าของตัวเอง
- สถานะการปรับใช้ของตัวเอง

### บริการ
บริการเป็นส่วนประกอบของแอปพลิเคชันของคุณ:
- **Frontend** - แอปพลิเคชันเว็บ, SPAs
- **Backend** - APIs, ไมโครเซอร์วิส
- **Database** - โซลูชันการจัดเก็บข้อมูล
- **Storage** - การจัดเก็บไฟล์และ blob

## ฟีเจอร์สำคัญ

### 1. การพัฒนาที่ขับเคลื่อนด้วยเทมเพลต
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - ภาษาที่เฉพาะเจาะจงของ Azure
- **Terraform** - เครื่องมือโครงสร้างพื้นฐานแบบมัลติคลาวด์
- **ARM Templates** - เทมเพลต Azure Resource Manager

### 3. เวิร์กโฟลว์แบบบูรณาการ
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. การจัดการสภาพแวดล้อม
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 โครงสร้างโปรเจกต์

โครงสร้างโปรเจกต์ azd ทั่วไป:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 ไฟล์การกำหนดค่า

### azure.yaml
ไฟล์การกำหนดค่าโปรเจกต์หลัก:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
การกำหนดค่าที่เฉพาะเจาะจงสำหรับสภาพแวดล้อม:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 เวิร์กโฟลว์ทั่วไป

### การเริ่มต้นโปรเจกต์ใหม่
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### วงจรการพัฒนา
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### การจัดการหลายสภาพแวดล้อม
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 คำสั่งนำทาง

### การค้นหา
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### การจัดการโปรเจกต์
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### การตรวจสอบ
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## แนวทางปฏิบัติที่ดีที่สุด

### 1. ใช้ชื่อที่มีความหมาย
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. ใช้เทมเพลตให้เกิดประโยชน์
- เริ่มต้นด้วยเทมเพลตที่มีอยู่
- ปรับแต่งให้เหมาะกับความต้องการของคุณ
- สร้างเทมเพลตที่นำกลับมาใช้ใหม่ได้สำหรับองค์กรของคุณ

### 3. การแยกสภาพแวดล้อม
- ใช้สภาพแวดล้อมแยกกันสำหรับ dev/staging/prod
- อย่าปรับใช้โดยตรงไปยัง production จากเครื่องท้องถิ่น
- ใช้ CI/CD pipelines สำหรับการปรับใช้ production

### 4. การจัดการการกำหนดค่า
- ใช้ตัวแปรสภาพแวดล้อมสำหรับข้อมูลที่ละเอียดอ่อน
- เก็บการกำหนดค่าไว้ในระบบควบคุมเวอร์ชัน
- เอกสารการตั้งค่าที่เฉพาะเจาะจงสำหรับแต่ละสภาพแวดล้อม

## ความก้าวหน้าในการเรียนรู้

### ระดับเริ่มต้น (สัปดาห์ที่ 1-2)
1. ติดตั้ง azd และยืนยันตัวตน
2. ปรับใช้เทมเพลตง่ายๆ
3. เข้าใจโครงสร้างโปรเจกต์
4. เรียนรู้คำสั่งพื้นฐาน (up, down, deploy)

### ระดับกลาง (สัปดาห์ที่ 3-4)
1. ปรับแต่งเทมเพลต
2. จัดการหลายสภาพแวดล้อม
3. เข้าใจโค้ดโครงสร้างพื้นฐาน
4. ตั้งค่า CI/CD pipelines

### ระดับสูง (สัปดาห์ที่ 5+)
1. สร้างเทมเพลตที่กำหนดเอง
2. รูปแบบโครงสร้างพื้นฐานขั้นสูง
3. การปรับใช้หลายภูมิภาค
4. การกำหนดค่าระดับองค์กร

## ขั้นตอนถัดไป

- [Installation & Setup](installation.md) - ติดตั้งและกำหนดค่า azd
- [Your First Project](first-project.md) - บทเรียนแบบลงมือปฏิบัติ
- [Configuration Guide](configuration.md) - ตัวเลือกการกำหนดค่าขั้นสูง

## แหล่งข้อมูลเพิ่มเติม

- [Azure Developer CLI Overview](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Samples](https://github.com/Azure-Samples)

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [README](../../README.md)
- **บทเรียนถัดไป**: [Installation & Setup](installation.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้องมากที่สุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดซึ่งเกิดจากการใช้การแปลนี้