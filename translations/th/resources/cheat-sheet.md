# Command Cheat Sheet - คำสั่ง AZD ที่จำเป็น

**ข้อมูลอ้างอิงด่วนสำหรับทุกบท**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../README.md)
- **📖 เริ่มต้นอย่างรวดเร็ว**: [บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว](../README.md#-chapter-1-foundation--quick-start)
- **🤖 คำสั่ง AI**: [บทที่ 2: การพัฒนา AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ขั้นสูง**: [บทที่ 4: โครงสร้างพื้นฐานในรูปแบบโค้ด](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## บทนำ

ชีทสรุปนี้ให้ข้อมูลอ้างอิงด่วนสำหรับคำสั่ง Azure Developer CLI ที่ใช้งานบ่อยที่สุด จัดเรียงตามหมวดหมู่พร้อมตัวอย่างใช้งานจริง เหมาะสำหรับการค้นหาอย่างรวดเร็วระหว่างการพัฒนา แก้ไขปัญหา และการดำเนินงานประจำวันกับโปรเจกต์ azd

## เป้าหมายการเรียนรู้

โดยการใช้ชีทสรุปนี้ คุณจะได้:
- เข้าถึงคำสั่งและไวยากรณ์ Azure Developer CLI ที่สำคัญทันที
- เข้าใจการจัดประเภทคำสั่งตามหน้าที่และกรณีการใช้งาน
- อ้างอิงตัวอย่างการใช้งานจริงสำหรับสถานการณ์พัฒนาและดีพลอยทั่วไป
- เข้าถึงคำสั่งแก้ไขปัญหาเพื่อการแก้ไขข้อผิดพลาดอย่างรวดเร็ว
- ค้นหาตัวเลือกการตั้งค่าและปรับแต่งขั้นสูงอย่างมีประสิทธิภาพ
- ค้นหาคำสั่งจัดการสภาพแวดล้อมและเวิร์กโฟลว์หลายสภาพแวดล้อม

## ผลลัพธ์การเรียนรู้

เมื่อใช้อ้างอิงชีทนี้อย่างสม่ำเสมอ คุณจะสามารถ:
- รันคำสั่ง azd ได้อย่างมั่นใจโดยไม่ต้องเปิดเอกสารฉบับเต็ม
- แก้ไขปัญหาที่พบบ่อยอย่างรวดเร็วด้วยคำสั่งวินิจฉัยที่เหมาะสม
- จัดการหลายสภาพแวดล้อมและสถานการณ์การดีพลอยอย่างมีประสิทธิภาพ
- ใช้ฟีเจอร์และตัวเลือกการตั้งค่า azd ขั้นสูงตามต้องการ
- แก้ไขปัญหาการดีพลอยโดยใช้ลำดับคำสั่งอย่างเป็นระบบ
- ปรับปรุงเวิร์กโฟลว์ด้วยการใช้งานทางลัดและตัวเลือก azd อย่างมีประสิทธิภาพ

## คำสั่งเริ่มต้น

### การรับรองความถูกต้อง
```bash
# เข้าสู่ระบบ Azure ผ่าน AZD
azd auth login

# เข้าสู่ระบบ Azure CLI (AZD ใช้สิ่งนี้ในพื้นหลัง)
az login

# ตรวจสอบบัญชีปัจจุบัน
az account show

# ตั้งค่าการสมัครใช้งานเริ่มต้น
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# ออกจากระบบ AZD
azd auth logout

# ออกจากระบบ Azure CLI
az logout
```

### การเริ่มต้นโปรเจกต์
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

## คำสั่งดีพลอยหลัก

### เวิร์กโฟลว์ดีพลอยครบวงจร
```bash
# ปรับใช้ทุกอย่าง (จัดเตรียม + ปรับใช้)
azd up

# ปรับใช้โดยปิดการยืนยัน
azd up --confirm-with-no-prompt

# ปรับใช้ไปยังสภาพแวดล้อมเฉพาะ
azd up --environment production

# ปรับใช้ด้วยพารามิเตอร์ที่กำหนดเอง
azd up --parameter location=westus2
```

### เฉพาะโครงสร้างพื้นฐาน
```bash
# จัดเตรียมทรัพยากร Azure
azd provision

# 🧪 ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐาน
azd provision --preview
# แสดงมุมมองการทดลองทำก่อนจริงว่าทรัพยากรใดจะถูกสร้าง/แก้ไข/ลบ
# คล้ายกับ 'terraform plan' หรือ 'bicep what-if' - ปลอดภัยในการรัน ไม่มีการเปลี่ยนแปลงถูกนำไปใช้จริง
```

### เฉพาะแอปพลิเคชัน
```bash
# ติดตั้งโค้ดแอปพลิเคชัน
azd deploy

# ติดตั้งบริการเฉพาะ
azd deploy --service web
azd deploy --service api

# ติดตั้งบริการทั้งหมด
azd deploy --all
```

### การสร้างและบรรจุแพ็กเกจ
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

# แสดงสภาพแวดล้อมที่มีอยู่
azd env list

# รีเฟรชสถานะสภาพแวดล้อม
azd env refresh
```

### ตัวแปรสภาพแวดล้อม
```bash
# ตั้งค่าตัวแปรสภาพแวดล้อม
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# ดึงค่าตัวแปรสภาพแวดล้อม
azd env get API_KEY

# แสดงรายการตัวแปรสภาพแวดล้อมทั้งหมด
azd env get-values

# ลบตัวแปรสภาพแวดล้อม
azd env unset DEBUG
```

## ⚙️ คำสั่งตั้งค่า

### การตั้งค่าระดับโลก
```bash
# แสดงรายการการตั้งค่าทั้งหมด
azd config show

# ตั้งค่าค่าปริยายทั่วโลก
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ลบการตั้งค่า
azd config unset defaults.location

# รีเซ็ตการตั้งค่าทั้งหมด
azd config reset
```

### การตั้งค่าโปรเจกต์
```bash
# ตรวจสอบความถูกต้องของ azure.yaml
azd config validate

# แสดงข้อมูลโครงการ
azd show

# ดึงข้อมูลปลายทางบริการ
azd show --output json
```

## 📊 การตรวจสอบและวินิจฉัย

### แดชบอร์ดการตรวจสอบ
```bash
# เปิดแดชบอร์ดการตรวจสอบพอร์ทัล Azure
azd monitor

# เปิดเมตริกสดของ Application Insights
azd monitor --live

# เปิดบล็อกบันทึกของ Application Insights
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

### คำสั่ง Log Analytics
```bash
# เข้าถึงการวิเคราะห์บันทึกผ่าน Azure Portal
azd monitor --logs

# ค้นหาบันทึกโดยใช้ Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ คำสั่งบำรุงรักษา

### การทำความสะอาด
```bash
# ลบทรัพยากร Azure ทั้งหมด
azd down

# ลบอย่างแรงโดยไม่ต้องยืนยัน
azd down --force

# กำจัดทรัพยากรที่ถูกลบแบบนุ่มนวล
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
azd config show
```

## 🔧 คำสั่งขั้นสูง

### พายป์ไลน์และ CI/CD
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
# สร้างแม่แบบโครงสร้างพื้นฐาน
azd infra generate

# 🧪 การดูตัวอย่างและวางแผนโครงสร้างพื้นฐาน
azd provision --preview
# จำลองการจัดเตรียมโครงสร้างพื้นฐานโดยไม่ทำการปรับใช้
# วิเคราะห์แม่แบบ Bicep/Terraform และแสดง:
# - ทรัพยากรที่จะเพิ่ม (สีเขียว +)
# - ทรัพยากรที่จะปรับเปลี่ยน (สีเหลือง ~)
# - ทรัพยากรที่จะลบ (สีแดง -)
# ปลอดภัยที่จะรัน - ไม่มีการเปลี่ยนแปลงจริงกับสภาพแวดล้อม Azure

# สังเคราะห์โครงสร้างพื้นฐานจาก azure.yaml
azd infra synth
```

### ข้อมูลโปรเจกต์
```bash
# แสดงสถานะโครงการและจุดสิ้นสุด
azd show

# แสดงข้อมูลโครงการโดยละเอียดในรูปแบบ JSON
azd show --output json

# ดึงจุดสิ้นสุดของบริการ
azd show --output json | jq '.services'
```

## 🤖 คำสั่ง AI & ส่วนขยาย

### ส่วนขยาย AZD
```bash
# แสดงรายการส่วนขยายทั้งหมดที่มี (รวมถึง AI)
azd extension list

# ติดตั้งส่วนขยายตัวแทน Foundry
azd extension install azure.ai.agents

# ติดตั้งส่วนขยายการปรับแต่งอย่างละเอียด
azd extension install azure.ai.finetune

# ติดตั้งส่วนขยายโมเดลที่กำหนดเอง
azd extension install azure.ai.models

# อัปเกรดส่วนขยายที่ติดตั้งทั้งหมด
azd extension upgrade --all
```

### คำสั่งตัวแทน AI
```bash
# เริ่มต้นโครงการตัวแทนจากไฟล์แมนิเฟสต์
azd ai agent init -m <manifest-path-or-uri>

# เลือกเป้าหมายเป็นโครงการ Foundry เฉพาะ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# ระบุไดเรกทอรีต้นทางของตัวแทน
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# เลือกเป้าหมายสำหรับการโฮสต์
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### เซิร์ฟเวอร์ MCP (Alpha)
```bash
# เริ่มต้นเซิร์ฟเวอร์ MCP สำหรับโครงการของคุณ
azd mcp start

# จัดการการยินยอมเครื่องมือสำหรับการดำเนินการ MCP
azd copilot consent list
```

### การสร้างโครงสร้างพื้นฐาน
```bash
# สร้างไฟล์ IaC จากคำจำกัดความโครงการของคุณ
azd infra generate

# สังเคราะห์โครงสร้างพื้นฐานจาก azure.yaml
azd infra synth
```

---

## 🎯 เวิร์กโฟลว์ด่วน

### เวิร์กโฟลว์การพัฒนา
```bash
# เริ่มโปรเจกต์ใหม่
azd init --template todo-nodejs-mongo
cd my-project

# ติดตั้งในสภาพแวดล้อมการพัฒนา
azd env new dev
azd up

# ทำการเปลี่ยนแปลงและติดตั้งใหม่
azd deploy

# เปิดแผงควบคุมการตรวจสอบ
azd monitor --live
```

### เวิร์กโฟลว์หลายสภาพแวดล้อม
```bash
# ตั้งค่าสภาพแวดล้อม
azd env new dev
azd env new staging  
azd env new production

# นำส่งไปยัง dev
azd env select dev
azd up

# ทดสอบและโปรโมทไปยัง staging
azd env select staging
azd up

# นำส่งไปยัง production
azd env select production
azd up
```

### เวิร์กโฟลว์แก้ไขปัญหา
```bash
# เปิดใช้งานโหมดดีบัก
export AZD_DEBUG=true

# ตรวจสอบสถานะการปรับใช้
azd show

# ตรวจสอบความถูกต้องของการตั้งค่า
azd config show

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

# ปิดการส่งข้อมูลโทรเมทริกส์เพื่อผลลัพธ์ที่สะอาดขึ้น
export AZD_DISABLE_TELEMETRY=true

# ตรวจสอบการตั้งค่าปัจจุบัน
azd config show

# ตรวจสอบสถานะการตรวจสอบสิทธิ์
az account show
```

### ดีบักเทมเพลต
```bash
# แสดงรายการแม่แบบที่มีพร้อมรายละเอียด
azd template list --output json

# แสดงข้อมูลแม่แบบ
azd template show <template-name>

# ตรวจสอบความถูกต้องของแม่แบบก่อนการเริ่มต้น
azd template validate <template-name>
```

## 📁 คำสั่งไฟล์และไดเรกทอรี

### โครงสร้างโปรเจกต์
```bash
# แสดงโครงสร้างไดเรกทอรีปัจจุบัน
tree /f  # วินโดวส์
find . -type f  # ลินุกซ์/แมคโอเอส

# ไปที่รากโครงการ azd
cd $(azd root)

# แสดงไดเรกทอรีการกำหนดค่า azd
echo $AZD_CONFIG_DIR  # ปกติจะอยู่ที่ ~/.azd
```

## 🎨 การจัดรูปแบบเอาต์พุต

### เอาต์พุต JSON
```bash
# รับผลลัพธ์ JSON สำหรับการเขียนสคริปต์
azd show --output json
azd env list --output json
azd config show --output json

# แยกวิเคราะห์ด้วย jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ตารางเอาต์พุต
```bash
# จัดรูปแบบเป็นตาราง
azd env list --output table

# ดูบริการที่ถูกปรับใช้แล้ว
azd show --output json | jq '.services | keys'
```

## 🔧 รวมคำสั่งทั่วไป

### สคริปต์ตรวจสอบสุขภาพ
```bash
#!/bin/bash
# ตรวจสอบสุขภาพอย่างรวดเร็ว
azd show
azd env get-values
azd monitor --logs
```

### การยืนยันการดีพลอย
```bash
#!/bin/bash
# การตรวจสอบก่อนการปรับใช้งาน
azd show
azd provision --preview  # ดูตัวอย่างการเปลี่ยนแปลงก่อนปรับใช้งาน
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
# ทำความสะอาดสภาพแวดล้อมเก่า ๆ
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

### การแก้ไขด่วน
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
# กู้คืนจากการปรับใช้ล้มเหลว - ทำความสะอาดและปรับใช้ใหม่
azd down --force --purge
azd up

# จัดเตรียมโครงสร้างพื้นฐานใหม่เท่านั้น
azd provision

# ปรับใช้แอปพลิเคชันใหม่เท่านั้น
azd deploy
```

## 💡 เคล็ดลับระดับโปร

### อาลิอาสสำหรับเวิร์กโฟลว์ที่เร็วขึ้น
```bash
# เพิ่มเข้าไปใน .bashrc หรือ .zshrc ของคุณ
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
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 ช่วยเหลือและเอกสาร

### การขอความช่วยเหลือ
```bash
# ความช่วยเหลือทั่วไป
azd --help
azd help

# ความช่วยเหลือเฉพาะคำสั่ง
azd up --help
azd env --help
azd config --help

# แสดงข้อมูลเวอร์ชันและบิลด์
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

**เคล็ดลับ**: บุ๊กมาร์กชีทสรุปนี้ไว้และใช้ `Ctrl+F` เพื่อค้นหาคำสั่งที่คุณต้องการได้อย่างรวดเร็ว!

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [ตรวจสอบก่อนดีพลอย](../docs/pre-deployment/preflight-checks.md)
- **บทเรียนถัดไป**: [พจนานุกรมศัพท์](glossary.md)

---

> **💡 ต้องการความช่วยเหลือคำสั่ง Azure ในโปรแกรมแก้ไขของคุณไหม?** ติดตั้ง [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ด้วย `npx skills add microsoft/github-copilot-for-azure` — 37 ทักษะสำหรับ AI, Foundry, ดีพลอย, วินิจฉัย และอื่น ๆ อีกมากมาย.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามเพื่อความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถือเป็นแหล่งข้อมูลที่ถูกต้อง สำหรับข้อมูลที่มีความสำคัญสูง ขอแนะนำให้ใช้การแปลโดยนักแปลมืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดขึ้นจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->