# Command Cheat Sheet - คำสั่ง AZD ที่จำเป็น

**คู่มือด่วนสำหรับทุกบท**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../README.md)
- **📖 เริ่มต้นอย่างรวดเร็ว**: [บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว](../README.md#-chapter-1-foundation--quick-start)
- **🤖 คำสั่ง AI**: [บทที่ 2: การพัฒนา AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ขั้นสูง**: [บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ด](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## บทนำ

ชีทช่วยจำนี้ครอบคลุมและให้การอ้างอิงอย่างรวดเร็วสำหรับคำสั่ง Azure Developer CLI ที่ใช้บ่อยที่สุด โดยจัดหมวดหมู่และตัวอย่างใช้งานจริง เหมาะสำหรับดูเร็วระหว่างการพัฒนา การแก้ปัญหา และการปฏิบัติงานประจำวันกับโปรเจค azd

## เป้าหมายการเรียนรู้

โดยใช้ชีทช่วยจำนี้ คุณจะได้:
- เข้าถึงคำสั่งและไวยากรณ์ Azure Developer CLI ที่จำเป็นได้ทันที
- เข้าใจการจัดคำสั่งตามหมวดหมู่ฟังก์ชันและกรณีการใช้งาน
- อ้างอิงตัวอย่างใช้งานจริงสำหรับสถานการณ์พัฒนาและดีพลอยทั่วไป
- เข้าถึงคำสั่งแก้ไขปัญหาเพื่อแก้ไขปัญหาได้เร็วขึ้น
- ค้นหาตัวเลือกการตั้งค่าและปรับแต่งขั้นสูงได้อย่างมีประสิทธิภาพ
- หาและบริหารจัดการสภาพแวดล้อมและคำสั่ง workflow หลายสภาพแวดล้อม

## ผลลัพธ์การเรียนรู้

เมื่อใช้อ้างอิงชีทช่วยจำนี้อย่างสม่ำเสมอ คุณจะสามารถ:
- รันคำสั่ง azd ได้อย่างมั่นใจโดยไม่ต้องค้นหาเอกสารเต็มรูปแบบ
- แก้ไขปัญหาทั่วไปได้เร็วด้วยคำสั่งวินิจฉัยที่เหมาะสม
- บริหารจัดการหลายสภาพแวดล้อมและกรณีดีพลอยได้อย่างมีประสิทธิภาพ
- ใช้คุณสมบัติและตัวเลือกการตั้งค่าขั้นสูงของ azd ตามต้องการ
- แก้ไขปัญหาการดีพลอยด้วยชุดคำสั่งอย่างเป็นระบบ
- ปรับปรุง workflow ผ่านการใช้ทางลัดและตัวเลือก azd อย่างมีประสิทธิภาพ

## คำสั่งเริ่มต้น

### การยืนยันตัวตน
```bash
# เข้าสู่ระบบ Azure ผ่าน AZD
azd auth login

# เข้าสู่ระบบ Azure CLI (AZD ใช้สิ่งนี้ภายใต้ระบบ)
az login

# ตรวจสอบบัญชีปัจจุบัน
az account show

# ตั้งค่าสมัครสมาชิกเริ่มต้น
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# ออกจากระบบจาก AZD
azd auth logout

# ออกจากระบบจาก Azure CLI
az logout
```

### การเริ่มโปรเจค
```bash
# เรียกดูแม่แบบที่มีอยู่
azd template list

# เริ่มต้นจากแม่แบบ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# เริ่มต้นในไดเรกทอรีปัจจุบัน
azd init .

# เริ่มต้นด้วยชื่อตามต้องการ
azd init --template todo-nodejs-mongo my-awesome-app
```

## คำสั่งดีพลอยหลัก

### กระบวนการดีพลอยครบวงจร
```bash
# ติดตั้งทุกอย่าง (เตรียมพร้อม + ติดตั้ง)
azd up

# ติดตั้งโดยปิดใช้งานการยืนยัน
azd up --confirm-with-no-prompt

# ติดตั้งไปยังสภาพแวดล้อมที่เฉพาะเจาะจง
azd up --environment production

# ติดตั้งด้วยพารามิเตอร์ที่กำหนดเอง
azd up --parameter location=westus2
```

### เฉพาะโครงสร้างพื้นฐาน
```bash
# จัดหาแหล่งข้อมูล Azure
azd provision

# 🧪 แสดงตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐาน
azd provision --preview
# แสดงมุมมองการจำลองการทำงานว่าทรัพยากรใดจะถูกสร้าง/แก้ไข/ลบ
# คล้ายกับ 'terraform plan' หรือ 'bicep what-if' - ปลอดภัยที่จะรัน ไม่ได้เปลี่ยนแปลงใดๆ
```

### เฉพาะแอปพลิเคชัน
```bash
# นำโค้ดแอปพลิเคชันไปใช้งาน
azd deploy

# นำบริการเฉพาะไปใช้งาน
azd deploy --service web
azd deploy --service api

# นำบริการทั้งหมดไปใช้งาน
azd deploy --all
```

### สร้างและแพ็กเกจ
```bash
# สร้างแอปพลิเคชัน
azd package

# สร้างบริการเฉพาะทาง
azd package --service api
```

## 🌍 การจัดการสภาพแวดล้อม

### การดำเนินการกับสภาพแวดล้อม
```bash
# แสดงรายการสภาพแวดล้อมทั้งหมด
azd env list

# สร้างสภาพแวดล้อมใหม่
azd env new development
azd env new staging --location westus2

# เลือกสภาพแวดล้อม
azd env select production

# แสดงสภาพแวดล้อมปัจจุบัน
azd env show

# รีเฟรชสถานะสภาพแวดล้อม
azd env refresh
```

### ตัวแปรสภาพแวดล้อม
```bash
# ตั้งค่าตัวแปรสิ่งแวดล้อม
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# รับค่าตัวแปรสิ่งแวดล้อม
azd env get API_KEY

# แสดงรายการตัวแปรสิ่งแวดล้อมทั้งหมด
azd env get-values

# ลบตัวแปรสิ่งแวดล้อม
azd env unset DEBUG
```

## ⚙️ คำสั่งตั้งค่า

### การตั้งค่าระดับโลก
```bash
# แสดงรายการการตั้งค่าทั้งหมด
azd config list

# ตั้งค่าค่าพื้นฐานทั่วโลก
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ลบการตั้งค่า
azd config unset defaults.location

# รีเซ็ตการตั้งค่าทั้งหมด
azd config reset
```

### การตั้งค่าโปรเจค
```bash
# ตรวจสอบความถูกต้องของ azure.yaml
azd config validate

# แสดงข้อมูลโครงการ
azd show

# ดึงข้อมูลจุดเชื่อมต่อบริการ
azd show --output json
```

## 📊 การตรวจสอบและวินิจฉัย

### แดชบอร์ดการตรวจสอบ
```bash
# เปิดแดชบอร์ดการตรวจสอบบนพอร์ทัล Azure
azd monitor

# เปิดเมทริกซ์แบบสดของ Application Insights
azd monitor --live

# เปิดหน้าบันทึกของ Application Insights
azd monitor --logs

# เปิดภาพรวมของ Application Insights
azd monitor --overview
```

### การดูบันทึกคอนเทนเนอร์
```bash
# ดูบันทึกผ่าน Azure CLI (สำหรับ Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# ติดตามบันทึกแบบเรียลไทม์
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# ดูบันทึกจาก Azure Portal
azd monitor --logs
```

### คำสั่งค้นหาบันทึก Log Analytics
```bash
# เข้าถึงการวิเคราะห์ล็อกผ่าน Azure Portal
azd monitor --logs

# สืบค้นล็อกโดยใช้ Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ คำสั่งดูแลรักษา

### ทำความสะอาด
```bash
# ลบทรัพยากร Azure ทั้งหมด
azd down

# ลบโดยไม่ต้องยืนยัน
azd down --force

# ลบทรัพยากรที่ลบแบบอ่อนออกอย่างถาวร
azd down --purge

# ทำความสะอาดให้สมบูรณ์
azd down --force --purge
```

### การอัปเดต
```bash
# ตรวจสอบการอัปเดต azd
azd version

# รับเวอร์ชันปัจจุบัน
azd version

# ดูการกำหนดค่าปัจจุบัน
azd config list
```

## 🔧 คำสั่งขั้นสูง

### Pipeline และ CI/CD
```bash
# กำหนดค่า GitHub Actions
azd pipeline config

# กำหนดค่า Azure DevOps
azd pipeline config --provider azdo

# แสดงการกำหนดค่า pipeline
azd pipeline show
```

### การจัดการโครงสร้างพื้นฐาน
```bash
# สร้างเทมเพลตโครงสร้างพื้นฐาน
azd infra generate

# 🧪 การดูตัวอย่างและวางแผนโครงสร้างพื้นฐาน
azd provision --preview
# จำลองการจัดเตรียมโครงสร้างพื้นฐานโดยไม่ต้องปรับใช้จริง
# วิเคราะห์เทมเพลต Bicep/Terraform และแสดง:
# - ทรัพยากรที่จะเพิ่ม (สีเขียว +)
# - ทรัพยากรที่จะปรับเปลี่ยน (สีเหลือง ~)
# - ทรัพยากรที่จะลบ (สีแดง -)
# ปลอดภัยในการรัน - ไม่มีการเปลี่ยนแปลงจริงใดๆ กับสภาพแวดล้อม Azure

# สังเคราะห์โครงสร้างพื้นฐานจากไฟล์ azure.yaml
azd infra synth
```

### ข้อมูลโปรเจค
```bash
# แสดงสถานะโครงการและจุดเชื่อมต่อ
azd show

# แสดงข้อมูลโครงการโดยละเอียดในรูปแบบ JSON
azd show --output json

# รับจุดเชื่อมต่อของบริการ
azd show --output json | jq '.services'
```

## 🎯 Workflow ด่วน

### Workflow การพัฒนา
```bash
# เริ่มโครงการใหม่
azd init --template todo-nodejs-mongo
cd my-project

# นำไปใช้กับสภาพแวดล้อมพัฒนา
azd env new dev
azd up

# ทำการเปลี่ยนแปลงและนำไปใช้ใหม่
azd deploy

# เปิดแผงควบคุมการติดตามผล
azd monitor --live
```

### Workflow หลายสภาพแวดล้อม
```bash
# ตั้งค่าสภาพแวดล้อม
azd env new dev
azd env new staging  
azd env new production

# นำไปใช้กับ dev
azd env select dev
azd up

# ทดสอบและโปรโมทไปยัง staging
azd env select staging
azd up

# นำไปใช้กับโปรดักชัน
azd env select production
azd up
```

### Workflow การแก้ไขปัญหา
```bash
# เปิดโหมดดีบัก
export AZD_DEBUG=true

# ตรวจสอบสถานะการติดตั้ง
azd show

# ตรวจสอบความถูกต้องของการตั้งค่า
azd config list

# เปิดแผงควบคุมการตรวจสอบสำหรับบันทึก
azd monitor --logs

# ตรวจสอบสถานะทรัพยากร
azd show --output json
```

## 🔍 คำสั่งดีบัก

### ข้อมูลดีบัก
```bash
# เปิดใช้งานการแสดงผลแบบดีบัก
export AZD_DEBUG=true
azd <command> --debug

# ปิดการใช้งานเทเลเมทรีเพื่อให้ผลลัพธ์สะอาดขึ้น
export AZD_DISABLE_TELEMETRY=true

# ตรวจสอบการกำหนดค่าปัจจุบัน
azd config list

# ตรวจสอบสถานะการตรวจสอบสิทธิ์
az account show
```

### การดีบักเทมเพลต
```bash
# แสดงรายการเทมเพลตที่มีพร้อมรายละเอียด
azd template list --output json

# แสดงข้อมูลของเทมเพลต
azd template show <template-name>

# ตรวจสอบความถูกต้องของเทมเพลตก่อนเริ่มต้นใช้งาน
azd template validate <template-name>
```

## 📁 คำสั่งไฟล์และไดเรกทอรี

### โครงสร้างโปรเจค
```bash
# แสดงโครงสร้างไดเร็กทอรีปัจจุบัน
tree /f  # วินโดวส์
find . -type f  # ลินุกซ์/แมคโอเอส

# ไปที่รากโปรเจกต์ azd
cd $(azd root)

# แสดงไดเร็กทอรีการตั้งค่า azd
echo $AZD_CONFIG_DIR  # โดยปกติที่ ~/.azd
```

## 🎨 การจัดรูปแบบผลลัพธ์

### ผลลัพธ์ JSON
```bash
# รับผลลัพธ์ JSON สำหรับการเขียนสคริปต์
azd show --output json
azd env list --output json
azd config list --output json

# วิเคราะห์ด้วย jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ผลลัพธ์ตาราง
```bash
# จัดรูปแบบเป็นตาราง
azd env list --output table

# แสดงบริการที่ถูกติดตั้ง
azd show --output json | jq '.services | keys'
```

## 🔧 การรวมคำสั่งทั่วไป

### สคริปต์ตรวจสอบสุขภาพ
```bash
#!/bin/bash
# ตรวจสอบสุขภาพอย่างรวดเร็ว
azd show
azd env show
azd monitor --logs
```

### การตรวจสอบความถูกต้องของดีพลอย
```bash
#!/bin/bash
# การตรวจสอบก่อนการปรับใช้
azd show
azd provision --preview  # แสดงตัวอย่างการเปลี่ยนแปลงก่อนการปรับใช้
az account show
```

### การเปรียบเทียบสภาพแวดล้อม
```bash
#!/bin/bash
# เปรียบเทียบสภาพแวดล้อม
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### สคริปต์ทำความสะอาดทรัพยากร
```bash
#!/bin/bash
# ทำความสะอาดสภาพแวดล้อมเก่า
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 ตัวแปรสภาพแวดล้อม

### ตัวแปรสภาพแวดล้อมทั่วไป
```bash
# การกำหนดค่า Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# การกำหนดค่า AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# การกำหนดค่าของแอปพลิเคชัน
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 คำสั่งฉุกเฉิน

### การแก้ไขด่วน
```bash
# รีเซ็ตการรับรองความถูกต้อง
az account clear
az login

# บังคับรีเฟรชสภาพแวดล้อม
azd env refresh

# นำส่งบริการทั้งหมดใหม่
azd deploy

# ตรวจสอบสถานะการนำส่ง
azd show --output json
```

### คำสั่งกู้คืน
```bash
# กู้คืนจากการปรับใช้ที่ล้มเหลว - ทำความสะอาดและปรับใช้ใหม่
azd down --force --purge
azd up

# จัดเตรียมโครงสร้างพื้นฐานใหม่เท่านั้น
azd provision

# ปรับใช้แอปพลิเคชันใหม่เท่านั้น
azd deploy
```

## 💡 เคล็ดลับมือโปร

### ชื่อย่อเพื่อ workflow เร็วขึ้น
```bash
# เพิ่มเข้าไปในไฟล์ .bashrc หรือ .zshrc ของคุณ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ทางลัดฟังก์ชัน
```bash
# การสลับสภาพแวดล้อมอย่างรวดเร็ว
azd-env() {
    azd env select $1 && azd show
}

# การปรับใช้อย่างรวดเร็วพร้อมการตรวจสอบ
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# สถานะสภาพแวดล้อม
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 ความช่วยเหลือและเอกสาร

### ขอความช่วยเหลือ
```bash
# ความช่วยเหลือทั่วไป
azd --help
azd help

# ความช่วยเหลือเฉพาะคำสั่ง
azd up --help
azd env --help
azd config --help

# แสดงเวอร์ชันและข้อมูลการสร้าง
azd version
azd version --output json
```

### ลิงก์เอกสาร
```bash
# เปิดเอกสารในเบราว์เซอร์
azd docs

# แสดงเอกสารเทมเพลต
azd template show <template-name> --docs
```

---

**คำแนะนำ**: ตั้งบุ๊กมาร์กชีทช่วยจำนี้และใช้ `Ctrl+F` เพื่อค้นหาคำสั่งที่คุณต้องการอย่างรวดเร็ว!

---

**เมนูนำทาง**
- **บทเรียนก่อนหน้า**: [ตรวจสอบก่อนดีพลอย](../docs/pre-deployment/preflight-checks.md)
- **บทเรียนถัดไป**: [อภิธานศัพท์](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้มีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่แม่นยำ เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญแนะนำให้ใช้บริการแปลโดยผู้เชี่ยวชาญด้านมนุษย์ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใด ๆ ที่เกิดขึ้นจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->