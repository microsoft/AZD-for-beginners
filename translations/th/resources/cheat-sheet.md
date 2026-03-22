# Command Cheat Sheet - คำสั่ง AZD ที่จำเป็น

**เอกสารอ้างอิงด่วนสำหรับทุกบท**
- **📚 หน้าหลักคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../README.md)
- **📖 เริ่มต้นอย่างรวดเร็ว**: [บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว](../README.md#-chapter-1-foundation--quick-start)
- **🤖 คำสั่ง AI**: [บทที่ 2: การพัฒนา AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ขั้นสูง**: [บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ด](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## บทนำ

ชีตช่วยจำฉบับสมบูรณ์นี้มอบเอกสารอ้างอิงด่วนสำหรับคำสั่ง Azure Developer CLI ที่ใช้บ่อยที่สุด แบ่งเป็นหมวดหมู่พร้อมตัวอย่างใช้งานจริง เหมาะสำหรับการค้นหาอย่างรวดเร็วระหว่างการพัฒนา การแก้ปัญหา และการดำเนินงานประจำวันกับโครงการ azd

## เป้าหมายการเรียนรู้

โดยใช้ชีตช่วยจำนี้ คุณจะได้:
- เข้าถึงคำสั่งและไวยากรณ์ Azure Developer CLI ที่จำเป็นได้ทันที
- เข้าใจการจัดหมวดหมู่คำสั่งตามฟังก์ชันการใช้งานและกรณีใช้งาน
- อ้างอิงตัวอย่างใช้งานจริงสำหรับสถานการณ์การพัฒนาและการนำไปใช้งานทั่วไป
- เข้าถึงคำสั่งแก้ไขปัญหาเพื่อแก้ไขปัญหาอย่างรวดเร็ว
- ค้นหาตัวเลือกการกำหนดค่าและปรับแต่งขั้นสูงได้อย่างมีประสิทธิภาพ
- หาคำสั่งจัดการสภาพแวดล้อมและกระบวนการทำงานหลายสภาพแวดล้อม

## ผลลัพธ์การเรียนรู้

เมื่ออ้างอิงชีตช่วยจำนี้เป็นประจำ คุณจะสามารถ:
- รันคำสั่ง azd ด้วยความมั่นใจโดยไม่ต้องอ้างอิงเอกสารเต็มรูปแบบ
- แก้ไขปัญหาทั่วไปได้อย่างรวดเร็วด้วยคำสั่งวิเคราะห์ที่เหมาะสม
- จัดการหลายสภาพแวดล้อมและสถานการณ์การนำไปใช้ได้อย่างมีประสิทธิภาพ
- ใช้คุณสมบัติและตัวเลือกการกำหนดค่า azd ขั้นสูงตามต้องการ
- แก้ไขปัญหาการนำไปใช้ด้วยลำดับคำสั่งอย่างเป็นระบบ
- ปรับปรุงกระบวนการทำงานด้วยการใช้ทางลัดและตัวเลือกของ azd อย่างมีประสิทธิภาพ

## คำสั่งเริ่มต้นใช้งาน

### การตรวจสอบสิทธิ์
```bash
# เข้าสู่ระบบ Azure ผ่าน AZD
azd auth login

# เข้าสู่ระบบ Azure CLI (AZD ใช้สิ่งนี้อยู่เบื้องหลัง)
az login

# ตรวจสอบบัญชีปัจจุบัน
az account show

# กำหนดการสมัครสมาชิกรูปแบบเริ่มต้น
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# ออกจากระบบ AZD
azd auth logout

# ออกจากระบบ Azure CLI
az logout
```

### การเริ่มต้นโครงการ
```bash
# เรียกดูแม่แบบที่มีอยู่
azd template list

# เริ่มต้นจากแม่แบบ
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# เริ่มต้นในไดเรกทอรีปัจจุบัน
azd init .

# เริ่มต้นด้วยชื่อที่กำหนดเอง
azd init --template todo-nodejs-mongo my-awesome-app
```

## คำสั่งการนำไปใช้หลัก

### กระบวนการนำไปใช้ครบถ้วน
```bash
# ติดตั้งทุกอย่าง (จัดเตรียม + ติดตั้ง)
azd up

# ติดตั้งโดยปิดการยืนยันคำสั่ง
azd up --confirm-with-no-prompt

# ติดตั้งในสภาพแวดล้อมเฉพาะ
azd up --environment production

# ติดตั้งด้วยพารามิเตอร์ที่กำหนดเอง
azd up --parameter location=westus2
```

### เฉพาะโครงสร้างพื้นฐาน
```bash
# จัดสรรทรัพยากร Azure
azd provision

# 🧪 ตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐาน
azd provision --preview
# แสดงมุมมองจำลองของทรัพยากรที่จะถูกสร้าง/แก้ไข/ลบ
# คล้ายกับ 'terraform plan' หรือ 'bicep what-if' - ปลอดภัยในการรัน ไม่มีการเปลี่ยนแปลงใดๆ ถูกนำไปใช้
```

### เฉพาะแอปพลิเคชัน
```bash
# นำโค้ดแอปพลิเคชันขึ้นใช้งาน
azd deploy

# นำบริการเฉพาะขึ้นใช้งาน
azd deploy --service web
azd deploy --service api

# นำบริการทั้งหมดขึ้นใช้งาน
azd deploy --all
```

### การสร้างและแพ็กเกจ
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
# ตั้งค่าตัวแปรแวดล้อม
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ดึงค่าตัวแปรแวดล้อม
azd env get API_KEY

# แสดงรายการตัวแปรแวดล้อมทั้งหมด
azd env get-values

# ลบตัวแปรแวดล้อม
azd env unset DEBUG
```

## ⚙️ คำสั่งการกำหนดค่า

### การกำหนดค่าทั่วโลก
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

### การกำหนดค่าโครงการ
```bash
# ตรวจสอบความถูกต้องของ azure.yaml
azd config validate

# แสดงข้อมูลโปรเจกต์
azd show

# ดึงข้อมูลปลายทางของบริการ
azd show --output json
```

## 📊 การตรวจสอบและวิเคราะห์

### แดชบอร์ดการตรวจสอบ
```bash
# เปิดแผงควบคุมการตรวจสอบ Azure portal
azd monitor

# เปิดสถิติสดของ Application Insights
azd monitor --live

# เปิดบานหน้าต่างบันทึกของ Application Insights
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

### คิวรี Log Analytics
```bash
# เข้าถึงการวิเคราะห์บันทึกผ่าน Azure Portal
azd monitor --logs

# สืบค้นบันทึกโดยใช้ Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ คำสั่งบำรุงรักษา

### การทำความสะอาด
```bash
# ลบทรัพยากร Azure ทั้งหมด
azd down

# ลบโดยไม่ต้องยืนยัน
azd down --force

# ลบทรัพยากรที่ถูกลบชั่วคราวออกอย่างถาวร
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

### ท่อส่งงานและ CI/CD
```bash
# กำหนดการตั้งค่า GitHub Actions
azd pipeline config

# กำหนดการตั้งค่า Azure DevOps
azd pipeline config --provider azdo

# แสดงการกำหนดค่าท่อส่งงาน
azd pipeline show
```

### การจัดการโครงสร้างพื้นฐาน
```bash
# สร้างเทมเพลตโครงสร้างพื้นฐาน
azd infra generate

# 🧪 การดูตัวอย่าง & วางแผนโครงสร้างพื้นฐาน
azd provision --preview
# จำลองการจัดเตรียมโครงสร้างพื้นฐานโดยไม่ทำการปรับใช้
# วิเคราะห์เทมเพลต Bicep/Terraform และแสดง:
# - แหล่งข้อมูลที่จะเพิ่ม (สีเขียว +)
# - แหล่งข้อมูลที่จะถูกแก้ไข (สีเหลือง ~)
# - แหล่งข้อมูลที่จะถูกลบ (สีแดง -)
# ปลอดภัยที่จะรัน - ไม่มีการเปลี่ยนแปลงจริงในสภาพแวดล้อม Azure

# สังเคราะห์โครงสร้างพื้นฐานจาก azure.yaml
azd infra synth
```

### ข้อมูลโครงการ
```bash
# แสดงสถานะโครงการและจุดเชื่อมต่อ
azd show

# แสดงข้อมูลโครงการรายละเอียดในรูปแบบ JSON
azd show --output json

# รับจุดเชื่อมต่อบริการ
azd show --output json | jq '.services'
```

## 🤖 คำสั่ง AI & ส่วนขยาย

### ส่วนขยาย AZD
```bash
# แสดงรายการส่วนขยายทั้งหมดที่มี (รวมถึง AI)
azd extension list

# ติดตั้งส่วนขยายตัวแทน Foundry
azd extension install azure.ai.agents

# ติดตั้งส่วนขยายการปรับจูนละเอียด
azd extension install azure.ai.finetune

# ติดตั้งส่วนขยายโมเดลกำหนดเอง
azd extension install azure.ai.models

# อัปเกรดส่วนขยายที่ติดตั้งทั้งหมด
azd extension upgrade --all
```

### คำสั่งตัวแทน AI
```bash
# เริ่มโครงการเอเย่นต์จากไฟล์แสดงรายการ
azd ai agent init -m <manifest-path-or-uri>

# กำหนดเป้าหมายโครงการ Foundry เฉพาะ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ระบุไดเรกทอรีต้นทางของเอเย่นต์
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# เลือกเป้าหมายการโฮสต์
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# เริ่มเซิร์ฟเวอร์ MCP สำหรับโปรเจกต์ของคุณ
azd mcp start

# จัดการความยินยอมของเครื่องมือสำหรับการดำเนินการ MCP
azd mcp consent
```

### การสร้างโครงสร้างพื้นฐาน
```bash
# สร้างไฟล์ IaC จากคำนิยามโครงการของคุณ
azd infra generate

# สังเคราะห์โครงสร้างพื้นฐานจาก azure.yaml
azd infra synth
```

---

## 🎯 กระบวนการทำงานด่วน

### กระบวนการพัฒนา
```bash
# เริ่มโครงการใหม่
azd init --template todo-nodejs-mongo
cd my-project

# ปล่อยใช้งานในสภาพแวดล้อมการพัฒนา
azd env new dev
azd up

# แก้ไขและปล่อยใช้งานใหม่
azd deploy

# เปิดแผงควบคุมการตรวจสอบ
azd monitor --live
```

### กระบวนการทำงานหลายสภาพแวดล้อม
```bash
# ตั้งค่าสภาพแวดล้อม
azd env new dev
azd env new staging  
azd env new production

# ปล่อยใช้งานสู่ dev
azd env select dev
azd up

# ทดสอบและเลื่อนไปยัง staging
azd env select staging
azd up

# ปล่อยใช้งานสู่ production
azd env select production
azd up
```

### กระบวนการแก้ไขปัญหา
```bash
# เปิดใช้งานโหมดดีบัก
export AZD_DEBUG=true

# ตรวจสอบสถานะการปรับใช้
azd show

# ตรวจสอบความถูกต้องของการตั้งค่า
azd config list

# เปิดแดชบอร์ดการตรวจสอบสำหรับบันทึก
azd monitor --logs

# ตรวจสอบสถานะทรัพยากร
azd show --output json
```

## 🔍 คำสั่งดีบัก

### ข้อมูลดีบัก
```bash
# เปิดใช้งานการแสดงผลดีบัก
export AZD_DEBUG=true
azd <command> --debug

# ปิดใช้งานเทเลเมทรีเพื่อผลลัพธ์ที่สะอาดขึ้น
export AZD_DISABLE_TELEMETRY=true

# ตรวจสอบการตั้งค่าปัจจุบัน
azd config list

# ตรวจสอบสถานะการยืนยันตัวตน
az account show
```

### ดีบักแม่แบบ
```bash
# แสดงรายการแม่แบบที่มีพร้อมรายละเอียด
azd template list --output json

# แสดงข้อมูลแม่แบบ
azd template show <template-name>

# ตรวจสอบความถูกต้องของแม่แบบก่อนเริ่มต้น
azd template validate <template-name>
```

## 📁 คำสั่งไฟล์และไดเรกทอรี

### โครงสร้างโครงการ
```bash
# แสดงโครงสร้างไดเรกทอรีปัจจุบัน
tree /f  # วินโดวส์
find . -type f  # ลินุกซ์/แมคโอเอส

# ไปที่รูทโฟลเดอร์โปรเจกต์ azd
cd $(azd root)

# แสดงไดเรกทอรีการกำหนดค่า azd
echo $AZD_CONFIG_DIR  # โดยปกติ ~/.azd
```

## 🎨 การจัดรูปแบบผลลัพธ์

### ผลลัพธ์แบบ JSON
```bash
# รับผลลัพธ์ JSON สำหรับสคริปต์
azd show --output json
azd env list --output json
azd config list --output json

# แยกวิเคราะห์ด้วย jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ผลลัพธ์แบบตาราง
```bash
# จัดรูปแบบเป็นตาราง
azd env list --output table

# ดูบริการที่ติดตั้งแล้ว
azd show --output json | jq '.services | keys'
```

## 🔧 การผสมคำสั่งทั่วไป

### สคริปต์ตรวจสุขภาพ
```bash
#!/bin/bash
# ตรวจสอบสุขภาพอย่างรวดเร็ว
azd show
azd env show
azd monitor --logs
```

### การตรวจสอบความถูกต้องการนำไปใช้
```bash
#!/bin/bash
# การตรวจสอบล่วงหน้าก่อนการปรับใช้
azd show
azd provision --preview  # ดูตัวอย่างการเปลี่ยนแปลงก่อนการปรับใช้
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

# การกำหนดค่าแอปพลิเคชัน
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 คำสั่งฉุกเฉิน

### แก้ไขด่วน
```bash
# รีเซ็ตการตรวจสอบสิทธิ์
az account clear
az login

# บังคับรีเฟรชสภาพแวดล้อม
azd env refresh

# ติดตั้งบริการทั้งหมดใหม่
azd deploy

# ตรวจสอบสถานะการติดตั้ง
azd show --output json
```

### คำสั่งกู้คืน
```bash
# กู้คืนจากการปรับใช้ที่ล้มเหลว - ทำความสะอาดและปรับใช้ใหม่
azd down --force --purge
azd up

# ให้โครงสร้างพื้นฐานใหม่เท่านั้น
azd provision

# ปรับใช้แอปพลิเคชันใหม่เท่านั้น
azd deploy
```

## 💡 เคล็ดลับมือโปร

### ชื่อย่อเพื่อเร่งกระบวนการทำงาน
```bash
# เพิ่มลงในไฟล์ .bashrc หรือ .zshrc ของคุณ
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

### การขอความช่วยเหลือ
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
# เปิดเอกสารในเว็บเบราว์เซอร์
azd docs

# แสดงเอกสารเทมเพลต
azd template show <template-name> --docs
```

---

**เคล็ดลับ**: บุ๊กมาร์กชีตช่วยจำนี้และใช้ `Ctrl+F` เพื่อค้นหาคำสั่งที่คุณต้องการอย่างรวดเร็ว!

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [ตรวจสอบก่อนนำไปใช้](../docs/pre-deployment/preflight-checks.md)
- **บทเรียนถัดไป**: [พจนานุกรมศัพท์](glossary.md)

---

> **💡 ต้องการความช่วยเหลือคำสั่ง Azure ในตัวแก้ไขของคุณไหม?** ติดตั้ง [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ด้วยคำสั่ง `npx skills add microsoft/github-copilot-for-azure` — 37 ทักษะสำหรับ AI, Foundry, การนำไปใช้, การวินิจฉัย และอื่นๆ อีกมากมาย.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้มีความถูกต้องสูงสุด โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่แม่นยำ เอกสารต้นฉบับในภาษาดั้งเดิมถือเป็นแหล่งข้อมูลที่ถูกต้องและน่าเชื่อถือ สำหรับข้อมูลที่มีความสำคัญ ขอแนะนำให้ใช้บริการแปลโดยนักแปลมืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->