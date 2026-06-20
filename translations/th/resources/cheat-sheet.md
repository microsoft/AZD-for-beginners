# Command Cheat Sheet - คำสั่ง AZD ที่จำเป็น

**เอกสารอ้างอิงด่วนสำหรับบททั้งหมด**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../README.md)
- **📖 เริ่มต้นอย่างรวดเร็ว**: [บทที่ 1: พื้นฐาน & เริ่มต้นอย่างรวดเร็ว](../README.md#-chapter-1-foundation--quick-start)
- **🤖 คำสั่ง AI**: [บทที่ 2: การพัฒนาโดยใช้ AI เป็นหลัก](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 ขั้นสูง**: [บทที่ 4: โครงสร้างพื้นฐานเป็นโค้ด](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## บทนำ

ชีทโกงฉบับครบถ้วนนี้ให้เอกสารอ้างอิงด่วนสำหรับคำสั่ง Azure Developer CLI ที่ใช้บ่อยที่สุด โดยจัดหมวดหมู่และตัวอย่างใช้งานจริง เหมาะสำหรับค้นหาอย่างรวดเร็วในระหว่างพัฒนา แก้ไขปัญหา และปฏิบัติงานประจำวันกับโปรเจกต์ azd

## เป้าหมายการเรียนรู้

โดยใช้ชีทโกงนี้ คุณจะได้:
- เข้าถึงคำสั่งและไวยากรณ์ Azure Developer CLI ที่จำเป็นทันที
- เข้าใจการจัดกลุ่มคำสั่งตามหมวดฟังก์ชันและกรณีใช้งาน
- อ้างอิงตัวอย่างใช้งานจริงสำหรับสถานการณ์พัฒนาและปรับใช้ทั่วไป
- เข้าถึงคำสั่งแก้ไขปัญหาอย่างรวดเร็วเพื่อแก้ปัญหา
- ค้นหาตัวเลือกการกำหนดค่าและปรับแต่งขั้นสูงได้อย่างมีประสิทธิภาพ
- ค้นหาคำสั่งจัดการสภาพแวดล้อมและการทำงานหลายสภาพแวดล้อม

## ผลลัพธ์การเรียนรู้

เมื่ออ้างอิงชีทโกงนี้เป็นประจำ คุณจะสามารถ:
- รันคำสั่ง azd ได้อย่างมั่นใจโดยไม่ต้องดูเอกสารเต็ม
- แก้ไขปัญหาทั่วไปได้รวดเร็วด้วยคำสั่งวินิจฉัยที่เหมาะสม
- จัดการหลายสภาพแวดล้อมและสถานการณ์การปรับใช้อย่างมีประสิทธิภาพ
- ใช้ฟีเจอร์ azd ขั้นสูงและตัวเลือกกำหนดค่าเมื่อจำเป็น
- แก้ไขปัญหาการปรับใช้โดยใช้ชุดคำสั่งอย่างเป็นระบบ
- ปรับเวิร์กโฟลว์ให้เหมาะสมผ่านการใช้ทางลัดและตัวเลือก azd อย่างมีประสิทธิภาพ

## คำสั่งเริ่มต้น

### การยืนยันตัวตน
```bash
# ลงชื่อเข้าใช้ Azure ผ่าน AZD
azd auth login

# ลงชื่อเข้าใช้ Azure CLI (AZD ใช้งานสิ่งนี้ภายใน)
az login

# ตรวจสอบบัญชีปัจจุบัน
az account show

# ตั้งค่าการสมัครสมาชิกรายการเริ่มต้น
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# ออกจากระบบจาก AZD
azd auth logout

# ออกจากระบบจาก Azure CLI
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

## คำสั่งปรับใช้หลัก

### เวิร์กโฟลว์ปรับใช้ครบวงจร
```bash
# ติดตั้งทุกอย่าง (จัดสรร + ติดตั้ง)
azd up

# ติดตั้งโดยไม่ต้องยืนยัน
azd up --confirm-with-no-prompt

# ติดตั้งไปยังสภาพแวดล้อมเฉพาะ
azd up --environment production

# ติดตั้งด้วยพารามิเตอร์ที่กำหนดเอง
azd up --parameter location=westus2
```

### เฉพาะโครงสร้างพื้นฐาน
```bash
# เตรียมทรัพยากร Azure
azd provision

# 🧪 ดูตัวอย่างการเปลี่ยนแปลงโครงสร้างพื้นฐาน
azd provision --preview
# แสดงภาพจำลองว่าจะมีการสร้าง/แก้ไข/ลบทรัพยากรอะไรบ้าง
# คล้ายกับ 'terraform plan' หรือ 'bicep what-if' - ปลอดภัยในการรัน ไม่มีการเปลี่ยนแปลงใดๆ ถูกนำไปใช้
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

### สร้างและแพ็กเกจ
```bash
# กู้คืน (ดาวน์โหลด) การพึ่งพาของแอปพลิเคชัน
azd restore

# กู้คืนบริการเฉพาะ
azd restore --service api

# สร้างอาร์ติแฟกต์สำหรับการปรับใช้โดยไม่ต้องปรับใช้
azd package

# สร้างบริการเฉพาะ
azd package --service api
```

> **`azd restore`** ดาวน์โหลด dependencies ของแอปคุณ (npm, pip, NuGet, Maven ฯลฯ) โดยจะรันอัตโนมัติในขั้นตอน `azd package` และ `azd deploy` ดังนั้นคุณจึงไม่ค่อยต้องเรียกใช้โดยตรง — รันด้วยตัวเองเมื่อต้องการดึง dependencies ล่วงหน้า (เช่น เพื่ออุ่นแคช CI หรืองานออฟไลน์ภายหลัง)

> **`azd package`** สร้าง artifacts สำหรับปรับใช้ (เช่น container image หรือ zip) **โดยไม่** ดันไปยัง Azure ใช้แยกตอนเพื่อยืนยันว่าการสร้างผ่าน ตรวจสอบผลลัพธ์ หรือสร้าง artifacts เพื่อให้กระบวนการอื่นมาปรับใช้ต่อทีหลัง `azd deploy` จะทำการแพ็กเกจให้อัตโนมัติ ดังนั้นคุณต้องใช้ `azd package` เฉพาะเวลาต้องการ artifacts โดยไม่ปรับใช้เท่านั้น


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

# รีเฟรชสถานะของสภาพแวดล้อม
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

## ⚙️ คำสั่งกำหนดค่า

### การตั้งค่าระดับระบบ
```bash
# แสดงรายการการกำหนดค่าทั้งหมด
azd config show

# ตั้งค่าค่าเริ่มต้นทั่วโลก
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# ลบการกำหนดค่า
azd config unset defaults.location

# รีเซ็ตการกำหนดค่าทั้งหมด
azd config reset
```

### การตั้งค่าโครงการ
```bash
# ตรวจสอบความถูกต้องของ azure.yaml
azd config validate

# แสดงข้อมูลโครงการ
azd show

# รับจุดเชื่อมต่อบริการ
azd show --output json
```

## 📊 การตรวจสอบและวินิจฉัย

### แดชบอร์ดตรวจสอบ
```bash
# เปิดแดชบอร์ดการตรวจสอบของพอร์ทัล Azure
azd monitor

# เปิดเมตริกสดของ Application Insights
azd monitor --live

# เปิดบล็อกบันทึกของ Application Insights
azd monitor --logs

# เปิดภาพรวมของ Application Insights
azd monitor --overview
```

### ดูบันทึกคอนเทนเนอร์
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
# เข้าถึงการวิเคราะห์บันทึกผ่านพอร์ทัล Azure
azd monitor --logs

# สืบค้นบันทึกโดยใช้ Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ คำสั่งบำรุงรักษา

### ทำความสะอาด
```bash
# ลบทรัพยากร Azure ทั้งหมด
azd down

# ลบโดยบังคับโดยไม่ต้องยืนยัน
azd down --force

# กำจัดทรัพยากรที่ถูกลบแบบนุ่มนวล
azd down --purge

# ทำความสะอาดให้เสร็จสมบูรณ์
azd down --force --purge
```

### อัปเดต
```bash
# ตรวจสอบการอัปเดต azd
azd version

# รับเวอร์ชันปัจจุบัน
azd version

# ดูการตั้งค่าปัจจุบัน
azd config show
```

## 🔧 คำสั่งขั้นสูง

### ไพพลายน์และ CI/CD
```bash
# กำหนดค่าการทำงานของ GitHub Actions
azd pipeline config

# กำหนดค่าการทำงานของ Azure DevOps
azd pipeline config --provider azdo

# แสดงการกำหนดค่า pipeline
azd pipeline show
```

### จัดการโครงสร้างพื้นฐาน
```bash
# สร้างเทมเพลตโครงสร้างพื้นฐาน
azd infra generate

# 🧪 ตัวอย่างโครงสร้างพื้นฐานและการวางแผน
azd provision --preview
# จำลองการจัดเตรียมโครงสร้างพื้นฐานโดยไม่ต้องปรับใช้
# วิเคราะห์เทมเพลต Bicep/Terraform และแสดง:
# - ทรัพยากรที่ต้องเพิ่ม (สีเขียว +)
# - ทรัพยากรที่ต้องแก้ไข (สีเหลือง ~)
# - ทรัพยากรที่ต้องลบ (สีแดง -)
# ปลอดภัยที่จะเรียกใช้ - ไม่มีการเปลี่ยนแปลงจริงในสภาพแวดล้อม Azure

# สังเคราะห์โครงสร้างพื้นฐานจาก azure.yaml
azd infra synth
```

### ข้อมูลโปรเจกต์
```bash
# แสดงสถานะโครงการและจุดเชื่อมต่อ
azd show

# แสดงข้อมูลโครงการโดยละเอียดในรูปแบบ JSON
azd show --output json

# ดึงจุดเชื่อมต่อบริการ
azd show --output json | jq '.services'
```

## 🤖 คำสั่ง AI & ส่วนขยาย

### ส่วนขยาย AZD
```bash
# แสดงรายการส่วนขยายทั้งหมดที่มี (รวมถึง AI)
azd extension list

# ติดตั้งส่วนขยายตัวแทน Foundry
azd extension install azure.ai.agents

# ติดตั้งส่วนขยายทักษะตัวแทน (ตัวอย่าง)
azd extension install azure.ai.skills

# ติดตั้งส่วนขยายการเชื่อมต่อ Foundry (ตัวอย่าง)
azd extension install azure.ai.connections

# ติดตั้งส่วนขยายการปรับจูนละเอียด
azd extension install azure.ai.finetune

# ติดตั้งส่วนขยายโมเดลที่กำหนดเอง
azd extension install azure.ai.models

# อัปเกรดส่วนขยายที่ติดตั้งทั้งหมด
azd extension upgrade --all
```

### คำสั่ง AI Agent
```bash
# เริ่มต้นโครงการตัวแทนจาก manifest
azd ai agent init -m <manifest-path-or-uri>

# เลือกเป้าหมายโครงการ Foundry เฉพาะ
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# กำหนดไดเรกทอรีแหล่งที่มาของตัวแทน
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# เลือกเป้าหมายการโฮสต์
azd ai agent init -m agent-manifest.yaml --host containerapp

# ทดสอบตัวแทนที่ปรับใช้แล้ว (แสดงความล่าช้า + เวลาในการรับไบต์แรก)
azd ai agent invoke

# แสดงการกำหนดค่าจุดสิ้นสุดสด
azd ai agent endpoint show

# สร้างชุดข้อมูลการประเมินผล แล้วปรับปรุงตัวแทน
azd ai agent eval generate
azd ai agent optimize

# ดาวน์โหลดซอร์สที่ปรับใช้ของตัวแทนที่โฮสต์ด้วยโค้ด
azd ai agent code download

# ลบตัวแทนที่โฮสต์และเวอร์ชันทั้งหมด (--force จะสิ้นสุดเซสชันที่ใช้งานอยู่)
azd ai agent delete --force
```

### MCP Server (อัลฟ่า)
```bash
# เริ่มเซิร์ฟเวอร์ MCP สำหรับโปรเจกต์ของคุณ
azd mcp start

# จัดการความยินยอมเครื่องมือสำหรับการดำเนินการ MCP
azd copilot consent list
```

### การสร้างโครงสร้างพื้นฐาน
```bash
# สร้างไฟล์ IaC จากคำจำกัดความโปรเจคของคุณ
azd infra generate

# สังเคราะห์โครงสร้างพื้นฐานจาก azure.yaml
azd infra synth
```

---

## 🎯 เวิร์กโฟลว์ด่วน

### เวิร์กโฟลว์การพัฒนา
```bash
# เริ่มโครงการใหม่
azd init --template todo-nodejs-mongo
cd my-project

# ปล่อยใช้งานสู่การพัฒนา
azd env new dev
azd up

# ทำการเปลี่ยนแปลงและปล่อยใช้งานใหม่
azd deploy

# เปิดแดชบอร์ดการติดตามผล
azd monitor --live
```

### เวิร์กโฟลว์หลายสภาพแวดล้อม
```bash
# ตั้งค่าสภาพแวดล้อม
azd env new dev
azd env new staging  
azd env new production

# ติดตั้งใช้งานในสภาพแวดล้อมพัฒนา
azd env select dev
azd up

# ทดสอบและเลื่อนระดับไปยังสเตจจิ้ง
azd env select staging
azd up

# ติดตั้งใช้งานในสภาพแวดล้อมการผลิต
azd env select production
azd up
```

### เวิร์กโฟลว์การแก้ปัญหา
```bash
# เปิดโหมดดีบัก
export AZD_DEBUG=true

# ตรวจสอบสถานะการปรับใช้
azd show

# ตรวจสอบความถูกต้องของการตั้งค่า
azd config show

# เปิดแดชบอร์ดเฝ้าระวังสำหรับบันทึก
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

# ปิดการส่งข้อมูล telemetry เพื่อผลลัพธ์ที่สะอาดขึ้น
export AZD_DISABLE_TELEMETRY=true

# ตรวจสอบการตั้งค่าปัจจุบัน
azd config show

# ตรวจสอบสถานะการยืนยันตัวตน
az account show
```

### ดีบักเทมเพลต
```bash
# แสดงรายการแม่แบบที่มีรายละเอียด
azd template list --output json

# แสดงข้อมูลแม่แบบ
azd template show <template-name>

# ตรวจสอบความถูกต้องของแม่แบบก่อนเริ่มต้น
azd template validate <template-name>
```

## 📁 คำสั่งไฟล์และไดเรกทอรี

### โครงสร้างโปรเจกต์
```bash
# แสดงโครงสร้างไดเรกทอรีปัจจุบัน
tree /f  # วินโดวส์
find . -type f  # ลินุกซ์/macOS

# ไปที่โฟลเดอร์หลักของโปรเจกต์ azd
cd $(azd root)

# แสดงโฟลเดอร์การตั้งค่า azd
echo $AZD_CONFIG_DIR  # ปกติจะอยู่ที่ ~/.azd
```

## 🎨 การฟอร์แมตผลลัพธ์

### ผลลัพธ์ JSON
```bash
# รับผลลัพธ์ JSON สำหรับการเขียนสคริปต์
azd show --output json
azd env list --output json
azd config show --output json

# แยกวิเคราะห์ด้วย jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### ผลลัพธ์ตาราง
```bash
# จัดรูปแบบเป็นตาราง
azd env list --output table

# ดูบริการที่ได้ปรับใช้แล้ว
azd show --output json | jq '.services | keys'
```

## 🔧 การรวมคำสั่งที่ใช้บ่อย

### สคริปต์ตรวจสุขภาพ
```bash
#!/bin/bash
# ตรวจสอบสุขภาพอย่างรวดเร็ว
azd show
azd env get-values
azd monitor --logs
```

### การตรวจสอบความถูกต้องก่อนปรับใช้
```bash
#!/bin/bash
# การตรวจสอบก่อนการปรับใช้งาน
azd show
azd provision --preview  # ตรวจสอบการเปลี่ยนแปลงก่อนทำการปรับใช้งาน
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

### ตัวแปรสภาพแวดล้อมที่ใช้บ่อย
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

### การแก้ไขปัญหาอย่างรวดเร็ว
```bash
# รีเซ็ตการยืนยันตัวตน
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

# จัดเตรียมโครงสร้างพื้นฐานใหม่เท่านั้น
azd provision

# ปรับใช้แอปพลิเคชันใหม่เท่านั้น
azd deploy
```

## 💡 เคล็ดลับมือโปร

### ชื่อย่อสำหรับเวิร์กโฟลว์ที่เร็วขึ้น
```bash
# เพิ่มเข้าไปในไฟล์ .bashrc หรือ .zshrc ของคุณ
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### ทางลัดฟังก์ชัน
```bash
# สลับสภาพแวดล้อมอย่างรวดเร็ว
azd-env() {
    azd env select $1 && azd show
}

# การปรับใช้ที่รวดเร็วพร้อมการตรวจสอบ
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

# แสดงเอกสารแม่แบบ
azd template show <template-name> --docs
```

---

**เคล็ดลับ**: บุ๊กมาร์กชีทโกงนี้ไว้และใช้ `Ctrl+F` เพื่อค้นหาคำสั่งที่ต้องการได้รวดเร็ว!

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [ตรวจสอบก่อนปรับใช้](../docs/pre-deployment/preflight-checks.md)
- **บทเรียนถัดไป**: [พจนานุกรม](glossary.md)

---

> **💡 ต้องการความช่วยเหลือคำสั่ง Azure ในโปรแกรมแก้ไขของคุณไหม?** ติดตั้ง [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) ด้วย `npx skills add microsoft/github-copilot-for-azure` — 37 ทักษะสำหรับ AI, Foundry, ปรับใช้, วินิจฉัย และอื่น ๆ อีกมากมาย.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->