# โครงการแรกของคุณ - แบบฝึกปฏิบัติจริง

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทเรียนปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [การติดตั้งและการตั้งค่า](installation.md)
- **➡️ ถัดไป**: [การตั้งค่า](configuration.md)
- **🚀 บทต่อไป**: [บทที่ 2: การพัฒนา AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## บทนำ

ยินดีต้อนรับสู่โครงการแรกของคุณกับ Azure Developer CLI! แบบฝึกปฏิบัติแบบลงมือทำนี้จะพาคุณผ่านการสร้าง การปรับใช้ และการจัดการแอปพลิเคชันเต็มรูปแบบบน Azure ด้วย azd คุณจะได้ทำงานกับแอป todo จริงที่ประกอบด้วยส่วนหน้า React, ส่วนหลัง API Node.js และฐานข้อมูล MongoDB

## เป้าหมายการเรียนรู้

เมื่อทำแบบฝึกปฏิบัตินี้เสร็จสิ้น คุณจะสามารถ:
- เชี่ยวชาญกระบวนการเริ่มต้นโครงการ azd โดยใช้เทมเพลต
- เข้าใจโครงสร้างโครงการ Azure Developer CLI และไฟล์การตั้งค่า
- ดำเนินการปรับใช้แอปพลิเคชันเต็มรูปแบบไปยัง Azure พร้อมจัดเตรียมโครงสร้างพื้นฐาน
- นำกลยุทธ์การอัปเดตและปรับใช้แอปพลิเคชันใหม่มาใช้
- จัดการหลายสภาพแวดล้อมสำหรับการพัฒนาและการสเตจ
- ใช้แนวทางทำความสะอาดทรัพยากรและการบริหารต้นทุน

## ผลลัพธ์การเรียนรู้

หลังจากเสร็จสิ้น คุณจะสามารถ:
- เริ่มต้นและตั้งค่าโครงการ azd จากเทมเพลตได้อย่างอิสระ
- นำทางและแก้ไขโครงสร้างโครงการ azd ได้อย่างมีประสิทธิภาพ
- ปรับใช้แอปพลิเคชันแบบเต็มสแตกบน Azure ด้วยคำสั่งเดียว
- แก้ไขปัญหาการปรับใช้และการตรวจสอบสิทธิ์ที่พบบ่อย
- จัดการหลายสภาพแวดล้อม Azure สำหรับขั้นตอนการปรับใช้ต่าง ๆ
- นำกระบวนการปรับใช้ต่อเนื่องสำหรับการอัปเดตแอปพลิเคชันมาใช้

## เริ่มต้นใช้งาน

### รายการตรวจสอบข้อกำหนดเบื้องต้น
- ✅ ติดตั้ง Azure Developer CLI แล้ว ([คู่มือการติดตั้ง](installation.md))
- ✅ ทำการยืนยันตัวตน AZD ด้วย `azd auth login`
- ✅ ติดตั้ง Git บนระบบของคุณ
- ✅ ติดตั้ง Node.js 16+ (สำหรับแบบฝึกหัดนี้)
- ✅ Visual Studio Code (แนะนำ)

ก่อนดำเนินการต่อ ให้เรียกใช้ตัวตรวจสอบการตั้งค่าจากโฟลเดอร์รากของคลังเก็บนี้:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### ตรวจสอบการตั้งค่าของคุณ
```bash
# ตรวจสอบการติดตั้ง azd
azd version

# ตรวจสอบการรับรองความถูกต้องของ AZD
azd auth login --check-status
```

### ตรวจสอบการยืนยันตัวตน Azure CLI ตัวเลือก

```bash
az account show
```

### ตรวจสอบเวอร์ชัน Node.js
```bash
node --version
```

## ขั้นตอนที่ 1: เลือกและเริ่มต้นเทมเพลต

เริ่มต้นด้วยเทมเพลตแอป todo ยอดนิยมที่มีส่วนหน้า React และส่วนหลัง API Node.js

```bash
# เรียกดูเทมเพลตที่มีอยู่
azd template list

# เริ่มต้นเทมเพลตแอป todo
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ทำตามคำแนะนำ:
# - ป้อนชื่อสภาพแวดล้อม: "dev"
# - เลือกการสมัครสมาชิก (หากคุณมีหลายรายการ)
# - เลือกภูมิภาค: "East US 2" (หรือภูมิภาคที่คุณต้องการ)
```

### เกิดอะไรขึ้นบ้าง?
- ดาวน์โหลดโค้ดเทมเพลตไปยังไดเรกทอรีในเครื่องของคุณ
- สร้างไฟล์ `azure.yaml` พร้อมคำนิยามบริการ
- ตั้งค่าโค้ดโครงสร้างพื้นฐานในไดเรกทอรี `infra/`
- สร้างการตั้งค่าสภาพแวดล้อม

## ขั้นตอนที่ 2: สำรวจโครงสร้างโครงการ

มาดูว่า azd สร้างอะไรให้เราบ้าง:

```bash
# ดูโครงสร้างโปรเจกต์
tree /f   # วินโดวส์
# หรือ
find . -type f | head -20   # macOS/Linux
```

คุณจะเห็น:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### ไฟล์สำคัญที่ควรเข้าใจ

**azure.yaml** - หัวใจของโครงการ azd ของคุณ:
```bash
# ดูการกำหนดค่าของโครงการ
cat azure.yaml
```

**infra/main.bicep** - คำนิยามโครงสร้างพื้นฐาน:
```bash
# ดูโค้ดโครงสร้างพื้นฐาน
head -30 infra/main.bicep
```

## ขั้นตอนที่ 3: ปรับแต่งโครงการของคุณ (ไม่บังคับ)

ก่อนปรับใช้ คุณสามารถปรับแต่งแอปพลิเคชันได้:

### แก้ไขส่วนหน้า
```bash
# เปิดคอมโพเนนต์แอป React
code src/web/src/App.tsx
```

ทำการเปลี่ยนแปลงง่าย ๆ:
```typescript
// ค้นหาชื่อเรื่องและเปลี่ยนแปลงมัน
<h1>My Awesome Todo App</h1>
```

### ตั้งค่าสิ่งแวดล้อมตัวแปร
```bash
# ตั้งค่าตัวแปรแวดล้อมแบบกำหนดเอง
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ดูตัวแปรแวดล้อมทั้งหมด
azd env get-values
```

## ขั้นตอนที่ 4: ปรับใช้ไปยัง Azure

ตอนนี้เป็นส่วนที่น่าตื่นเต้น - ปรับใช้ทุกอย่างไปยัง Azure!

```bash
# ปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน
azd up

# คำสั่งนี้จะ:
# 1. จัดเตรียมทรัพยากร Azure (App Service, Cosmos DB, เป็นต้น)
# 2. สร้างแอปพลิเคชันของคุณ
# 3. ปรับใช้ไปยังทรัพยากรที่จัดเตรียมไว้
# 4. แสดง URL ของแอปพลิเคชัน
```

### เกิดอะไรขึ้นในระหว่างการปรับใช้?

คำสั่ง `azd up` ทำงานตามขั้นตอนเหล่านี้:
1. **Provision** (`azd provision`) - สร้างทรัพยากร Azure
2. **Package** - สร้างโค้ดแอปพลิเคชันของคุณ
3. **Deploy** (`azd deploy`) - ปรับใช้โค้ดไปยังทรัพยากร Azure

### ผลลัพธ์ที่คาดหวัง
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## ขั้นตอนที่ 5: ทดสอบแอปพลิเคชันของคุณ

### เข้าถึงแอปของคุณ
คลิกที่ URL ที่แสดงในผลลัพธ์การปรับใช้ หรือดูได้ทุกเมื่อ:
```bash
# รับจุดสิ้นสุดของแอปพลิเคชัน
azd show

# เปิดแอปพลิเคชันในเว็บเบราว์เซอร์ของคุณ
azd show --output json | jq -r '.services.web.endpoint'
```

### ทดสอบแอป Todo
1. **เพิ่มงาน todo** - คลิก “Add Todo” และกรอกงาน
2. **ทำเครื่องหมายว่าสำเร็จ** - ทำเครื่องหมายชิ้นงานที่เสร็จแล้ว
3. **ลบชิ้นงาน** - ลบรายการ todo ที่ไม่ต้องการแล้ว

### ติดตามแอปของคุณ
```bash
# เปิดพอร์ทัล Azure สำหรับทรัพยากรของคุณ
azd monitor

# ดูบันทึกแอปพลิเคชัน
azd monitor --logs

# ดูเมตริกสด
azd monitor --live
```

### ✅ ยืนยันการปรับใช้ของคุณ

ก่อนจะดำเนินการต่อ ให้ตรวจสอบอย่างรวดเร็วว่าใช้งานได้จริง — อย่าสันนิษฐานว่า “ปรับใช้สำเร็จ” หมายถึง “แอปใช้งานได้”:

```bash
# 1. ยืนยันว่า endpoint มีอยู่และสามารถเข้าถึงได้
azd show

# 2. ทดสอบเบื้องต้นที่ endpoint (คาดหวัง HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. ตรวจสอบ health endpoint หากแอปของคุณมีการเปิดเผย
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**การปรับใช้ได้รับการยืนยันเมื่อ:**
- ✅ `azd show` แสดง URL จุดจบที่เข้าใช้งานได้
- ✅ URL เปิดในเบราว์เซอร์ของคุณโดยไม่มีข้อผิดพลาด
- ✅ ฟีเจอร์หลักทำงานได้ (เพิ่ม/เสร็จ/ลบ todo)
- ✅ `azd monitor --logs` แสดงคำขอที่เข้ามาโดยไม่มีข้อผิดพลาดที่ไม่คาดคิด

หากตรวจสอบข้อใดล้มเหลว ให้ไปที่ [บทที่ 7: การแก้ไขปัญหา](../chapter-07-troubleshooting/README.md)

## ขั้นตอนที่ 6: ทำการเปลี่ยนแปลงและปรับใช้ใหม่

มาทำการเปลี่ยนแปลงและดูง่ายแค่ไหนในการอัปเดต:

### แก้ไข API
```bash
# แก้ไขโค้ด API
code src/api/src/routes/lists.js
```

เพิ่มหัวตอบกลับแบบกำหนดเอง:
```javascript
// ค้นหาตัวจัดการเส้นทางและเพิ่ม:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ปรับใช้เฉพาะการเปลี่ยนแปลงโค้ด
```bash
# เปิดใช้งานเฉพาะโค้ดแอปพลิเคชัน (ข้ามโครงสร้างพื้นฐาน)
azd deploy

# นี่เร็วกว่ามากเมื่อเทียบกับ 'azd up' เนื่องจากโครงสร้างพื้นฐานมีอยู่แล้ว
```

## ขั้นตอนที่ 7: จัดการหลายสภาพแวดล้อม

สร้างสภาพแวดล้อมสเตจเพื่อทดสอบการเปลี่ยนแปลงก่อนใช้งานจริง:

```bash
# สร้างสภาพแวดล้อมสำหรับการทดสอบใหม่
azd env new staging

# ปล่อยเวอร์ชันลงในสภาพแวดล้อมสำหรับการทดสอบ
azd up

# สลับกลับไปยังสภาพแวดล้อมการพัฒนา
azd env select dev

# แสดงรายชื่อสภาพแวดล้อมทั้งหมด
azd env list
```

### การเปรียบเทียบสภาพแวดล้อม
```bash
# ดูสภาพแวดล้อมการพัฒนา
azd env select dev
azd show

# ดูสภาพแวดล้อมการวางจำหน่ายชั่วคราว
azd env select staging
azd show
```

## ขั้นตอนที่ 8: ล้างข้อมูลทรัพยากร

เมื่อเสร็จสิ้นการทดลอง ให้ล้างเพื่อหลีกเลี่ยงการคิดค่าใช้จ่ายต่อเนื่อง:

```bash
# ลบทรัพยากร Azure ทั้งหมดสำหรับสภาพแวดล้อมปัจจุบัน
azd down

# บังคับลบโดยไม่ต้องยืนยันและล้างทรัพยากรที่ถูกลบแบบนุ่มนวล
azd down --force --purge

# ลบสภาพแวดล้อมเฉพาะเจาะจง
azd env select staging
azd down --force --purge
```

## แอปคลาสสิก vs แอปขับเคลื่อนด้วย AI: กระบวนการเดียวกัน

คุณเพิ่งปรับใช้แอปเว็บแบบดั้งเดิม แต่ถ้าคุณต้องการปรับใช้แอปที่ขับเคลื่อนด้วย AI เช่น แอปแชทที่ใช้ Microsoft Foundry Models จะเป็นอย่างไร?

ข่าวดีคือ: **กระบวนการเหมือนกันทุกประการ**

| ขั้นตอน | แอป Todo คลาสสิก | แอป AI แชท |
|------|-----------------|-------------|
| เริ่มต้น | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| ยืนยันตัวตน | `azd auth login` | `azd auth login` |
| ปรับใช้ | `azd up` | `azd up` |
| ติดตาม | `azd monitor` | `azd monitor` |
| ล้างข้อมูล | `azd down --force --purge` | `azd down --force --purge` |

ความแตกต่างเพียงอย่างเดียวคือ **เทมเพลต** ที่คุณเริ่มต้นจาก เทมเพลต AI จะรวมโครงสร้างพื้นฐานเพิ่มเติม (เช่น ทรัพยากร Microsoft Foundry Models หรือดัชนี AI Search) แต่ azd จะดูแลทั้งหมดให้คุณ คุณไม่จำเป็นต้องเรียนรู้คำสั่งใหม่ ใช้เครื่องมืออื่น หรือเปลี่ยนวิธีคิดเกี่ยวกับการปรับใช้

นี่คือหลักการสำคัญของ azd: **กระบวนการเดียว งานใดก็ได้** ทักษะที่คุณฝึกในแบบฝึกหัดนี้ — เริ่มต้น ปรับใช้ ติดตาม ปรับใช้ใหม่ และล้างข้อมูล — ใช้ได้เท่าเทียมกันกับแอป AI และตัวแทน AI

---

## สิ่งที่คุณได้เรียนรู้

ขอแสดงความยินดี! คุณได้ทำสำเร็จแล้ว:
- ✅ เริ่มต้นโครงการ azd จากเทมเพลต
- ✅ สำรวจโครงสร้างโครงการและไฟล์สำคัญ
- ✅ ปรับใช้แอปพลิเคชันเต็มรูปแบบบน Azure
- ✅ ทำการเปลี่ยนแปลงโค้ด และปรับใช้ใหม่
- ✅ จัดการหลายสภาพแวดล้อม
- ✅ ล้างข้อมูลทรัพยากร

## 🎯 แบบฝึกหัดตรวจสอบทักษะ

### แบบฝึกหัด 1: ปรับใช้เทมเพลตอื่น (15 นาที)
**เป้าหมาย**: แสดงความชำนาญในการเริ่มต้น azd และกระบวนการปรับใช้

```bash
# ลองสแตก Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ตรวจสอบการปรับใช้
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ทำความสะอาด
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] ปรับใช้แอปได้โดยไม่มีข้อผิดพลาด
- [ ] สามารถเข้าถึง URL แอปในเบราว์เซอร์
- [ ] แอปทำงานได้ถูกต้อง (เพิ่ม/ลบ todo)
- [ ] ล้างข้อมูลทรัพยากรทั้งหมดได้สำเร็จ

### แบบฝึกหัด 2: ปรับแต่งการตั้งค่า (20 นาที)
**เป้าหมาย**: ฝึกตั้งค่าสภาพแวดล้อมตัวแปร

```bash
cd my-first-azd-app

# สร้างสภาพแวดล้อมที่กำหนดเอง
azd env new custom-config

# กำหนดค่าตัวแปรที่กำหนดเอง
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ตรวจสอบตัวแปร
azd env get-values | grep APP_TITLE

# ติดตั้งด้วยการกำหนดค่าที่กำหนดเอง
azd up
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างสภาพแวดล้อมกำหนดเองสำเร็จ
- [ ] ตั้งค่าสภาพแวดล้อมตัวแปรและเรียกดูได้
- [ ] แอปปรับใช้ด้วยการตั้งค่าแบบกำหนดเอง
- [ ] ตรวจสอบการตั้งค่าแบบกำหนดเองในแอปที่ปรับใช้ได้

### แบบฝึกหัด 3: กระบวนการทำงานหลายสภาพแวดล้อม (25 นาที)
**เป้าหมาย**: ชำนาญการจัดการสภาพแวดล้อมและกลยุทธ์การปรับใช้

```bash
# สร้างสภาพแวดล้อมการพัฒนา
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# จดบันทึก URL การพัฒนา
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# สร้างสภาพแวดล้อมการทดสอบ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# จดบันทึก URL การทดสอบ
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# เปรียบเทียบสภาพแวดล้อม
azd env list

# ทดสอบทั้งสองสภาพแวดล้อม
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# ทำความสะอาดทั้งสอง
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างสองสภาพแวดล้อมที่มีการตั้งค่าต่างกัน
- [ ] ปรับใช้ทั้งสองสภาพแวดล้อมสำเร็จ
- [ ] สามารถสลับระหว่างสภาพแวดล้อมด้วย `azd env select`
- [ ] ตัวแปรสภาพแวดล้อมแตกต่างกันระหว่างสภาพแวดล้อม
- [ ] ล้างข้อมูลทั้งสองสภาพแวดล้อมได้สำเร็จ

## 📊 ความคืบหน้าของคุณ

**เวลาที่ใช้**: ~60-90 นาที  
**ทักษะที่ได้รับ**:
- ✅ เริ่มต้นโครงการด้วยเทมเพลต
- ✅ การจัดเตรียมทรัพยากรใน Azure
- ✅ กระบวนการปรับใช้แอปพลิเคชัน
- ✅ การจัดการสภาพแวดล้อม
- ✅ การจัดการการตั้งค่า
- ✅ การล้างข้อมูลทรัพยากรและการบริหารต้นทุน

**ระดับถัดไป**: คุณพร้อมสำหรับ [คู่มือการตั้งค่า](configuration.md) เพื่อเรียนรู้รูปแบบการตั้งค่าขั้นสูง!

## การแก้ไขปัญหาที่พบบ่อย

### ข้อผิดพลาดการตรวจสอบสิทธิ์
```bash
# ยืนยันตัวตนใหม่กับ Azure
az login

# ตรวจสอบการเข้าถึงการสมัครสมาชิก
az account show
```

### การปรับใช้ล้มเหลว
```bash
# เปิดใช้งานการบันทึกการดีบัก
export AZD_DEBUG=true
azd up --debug

# ดูบันทึกแอปพลิเคชันใน Azure
azd monitor --logs

# สำหรับ Container Apps ให้ใช้ Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ความขัดแย้งชื่อทรัพยากร
```bash
# ใช้ชื่อสภาพแวดล้อมที่ไม่ซ้ำกัน
azd env new dev-$(whoami)-$(date +%s)
```

### ปัญหาพอร์ต/เครือข่าย
```bash
# ตรวจสอบว่าพอร์ตว่างหรือไม่
netstat -an | grep :3000
netstat -an | grep :3100
```

## ขั้นตอนถัดไป

ตอนนี้คุณได้ทำโครงการแรกเสร็จแล้ว ให้สำรวจหัวข้อขั้นสูงเหล่านี้:

### 1. ปรับแต่งโครงสร้างพื้นฐาน
- [โครงสร้างพื้นฐานเป็นโค้ด](../chapter-04-infrastructure/provisioning.md)
- [เพิ่มฐานข้อมูล, ที่เก็บข้อมูล, และบริการอื่น ๆ](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. ตั้งค่า CI/CD
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - กระบวนการ CI/CD ครบวงจร
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - การตั้งค่าพายป์ไลน์

### 3. แนวปฏิบัติที่ดีที่สุดในการผลิต
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - ความปลอดภัย, ประสิทธิภาพ และการติดตาม

### 4. สำรวจเทมเพลตเพิ่มเติม
```bash
# เรียกดูเทมเพลตตามหมวดหมู่
azd template list --filter web
azd template list --filter api
azd template list --filter database

# ลองใช้สแตกเทคโนโลยีที่แตกต่างกัน
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## แหล่งข้อมูลเพิ่มเติม

### วัสดุการเรียนรู้
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [กรอบการออกแบบ Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### ชุมชน & การสนับสนุน
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [ชุมชนนักพัฒนา Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### เทมเพลต & ตัวอย่าง
- [แกลเลอรีเทมเพลตอย่างเป็นทางการ](https://azure.github.io/awesome-azd/)
- [เทมเพลตชุมชน](https://github.com/Azure-Samples/azd-templates)
- [รูปแบบองค์กร](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ยินดีด้วยที่คุณทำโครงการ azd แรกเสร็จเรียบร้อย!** ตอนนี้คุณพร้อมที่จะสร้างและปรับใช้แอปที่น่าทึ่งบน Azure ด้วยความมั่นใจแล้ว

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทเรียนปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [การติดตั้งและการตั้งค่า](installation.md)
- **➡️ ถัดไป**: [นำแอปของคุณเข้าใช้](bring-your-own-app.md)
- **🚀 บทต่อไป**: [บทที่ 2: การพัฒนา AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->