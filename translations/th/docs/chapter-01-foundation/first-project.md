# โปรเจกต์แรกของคุณ - แบบฝึกหัดใช้งานจริง

**การนำทางบทเรียน:**
- **📚 หน้าแรกของคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [การติดตั้ง & การตั้งค่า](installation.md)
- **➡️ ต่อไป**: [การกำหนดค่า](configuration.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนาด้วย AI เป็นหลัก](../chapter-02-ai-development/microsoft-foundry-integration.md)

## บทนำ

ยินดีต้อนรับสู่โปรเจกต์ Azure Developer CLI แรกของคุณ! แบบฝึกหัดใช้งานจริงนี้มีคำแนะนำครบถ้วนของการสร้าง, การปรับใช้, และการจัดการแอปเต็มรูปแบบบน Azure โดยใช้ azd คุณจะได้ทำงานกับแอป todo ที่แท้จริงซึ่งมีส่วนหน้าเป็น React, ส่วนหลัง API Node.js และฐานข้อมูล MongoDB

## เป้าหมายการเรียนรู้

เมื่อทำแบบฝึกหัดนี้เสร็จสิ้น คุณจะสามารถ:
- เชี่ยวชาญกระบวนการเริ่มต้นโปรเจกต์ azd โดยใช้เทมเพลต
- เข้าใจโครงสร้างโปรเจกต์ Azure Developer CLI และไฟล์การกำหนดค่า
- ดำเนินการปรับใช้แอปพลิเคชันครบวงจรไปยัง Azure พร้อมการจัดเตรียมโครงสร้างพื้นฐาน
- นำไปใช้กลยุทธ์อัปเดตแอปพลิเคชันและการปรับใช้ซ้ำ
- จัดการหลายสภาพแวดล้อมสำหรับการพัฒนาและการทดสอบ
- ใช้แนวทางการล้างข้อมูลทรัพยากรและการจัดการค่าใช้จ่าย

## ผลลัพธ์การเรียนรู้

เมื่อเสร็จสิ้นแล้ว คุณจะสามารถ:
- เริ่มต้นและกำหนดค่าโปรเจกต์ azd จากเทมเพลตได้ด้วยตนเอง
- นำทางและแก้ไขโครงสร้างโปรเจกต์ azd อย่างมีประสิทธิภาพ
- ปรับใช้แอปเต็มรูปแบบไปยัง Azure ด้วยคำสั่งเดียว
- แก้ไขปัญหาที่พบบ่อยในการปรับใช้และปัญหาการตรวจสอบสิทธิ์
- จัดการหลายสภาพแวดล้อม Azure สำหรับขั้นตอนการปรับใช้ต่างๆ
- นำไปใช้เวิร์กโฟลว์ปรับใช้ต่อเนื่องสำหรับการอัปเดตแอปพลิเคชัน

## การเริ่มต้น

### รายการตรวจสอบสิ่งที่ต้องมี
- ✅ ติดตั้ง Azure Developer CLI แล้ว ([คู่มือการติดตั้ง](installation.md))
- ✅ ทำการตรวจสอบสิทธิ์ AZD ด้วยคำสั่ง `azd auth login`
- ✅ ติดตั้ง Git ในระบบของคุณแล้ว
- ✅ Node.js 16+ (สำหรับแบบฝึกหัดนี้)
- ✅ Visual Studio Code (แนะนำ)

ก่อนดำเนินการต่อ ให้รันตัวตรวจสอบการตั้งค่าจากโฟลเดอร์หลักของที่เก็บโค้ด:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### ตรวจสอบการตั้งค่าของคุณ
```bash
# ตรวจสอบการติดตั้ง azd
azd version

# ตรวจสอบการพิสูจน์ตัวตน AZD
azd auth login --check-status
```

### ตรวจสอบการตรวจสอบสิทธิ์ Azure CLI แบบเลือกได้

```bash
az account show
```

### ตรวจสอบเวอร์ชัน Node.js
```bash
node --version
```

## ขั้นตอนที่ 1: เลือกและเริ่มต้นเทมเพลต

เริ่มต้นด้วยเทมเพลตแอป todo ที่ได้รับความนิยมซึ่งประกอบด้วยส่วนหน้า React และส่วนหลัง API Node.js

```bash
# เรียกดูเทมเพลตที่มีอยู่
azd template list

# เริ่มต้นเทมเพลตแอปงานที่ต้องทำ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ทำตามข้อแนะนำ:
# - ป้อนชื่อสิ่งแวดล้อม: "dev"
# - เลือกการสมัครสมาชิก (หากคุณมีหลายรายการ)
# - เลือกภูมิภาค: "East US 2" (หรือตามภูมิภาคที่คุณต้องการ)
```

### เกิดอะไรขึ้นบ้าง?
- ดาวน์โหลดโค้ดเทมเพลตไปยังไดเรกทอรีในเครื่องของคุณ
- สร้างไฟล์ `azure.yaml` พร้อมคำจำกัดความของบริการ
- ตั้งค่าโค้ดโครงสร้างพื้นฐานในไดเรกทอรี `infra/`
- สร้างการกำหนดค่าสภาพแวดล้อม

## ขั้นตอนที่ 2: สำรวจโครงสร้างโปรเจกต์

ลองดูว่า azd สร้างอะไรให้เรา:

```bash
# ดูโครงสร้างโปรเจกต์
tree /f   # วินโดวส์
# หรือ
find . -type f | head -20   # แมคโอเอส/ลินุกซ์
```

คุณควรเห็น:
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

**azure.yaml** - ใจกลางของโปรเจกต์ azd ของคุณ:
```bash
# ดูการกำหนดค่าของโครงการ
cat azure.yaml
```

**infra/main.bicep** - คำจำกัดความโครงสร้างพื้นฐาน:
```bash
# ดูโค้ดโครงสร้างพื้นฐาน
head -30 infra/main.bicep
```

## ขั้นตอนที่ 3: ปรับแต่งโปรเจกต์ของคุณ (ถ้าต้องการ)

ก่อนปรับใช้ คุณสามารถปรับแต่งแอปพลิเคชันได้:

### แก้ไขส่วนหน้า
```bash
# เปิดคอมโพเนนต์แอป React
code src/web/src/App.tsx
```

ทำการเปลี่ยนแปลงง่ายๆ:
```typescript
// ค้นหาชื่อเรื่องและเปลี่ยนแปลงมัน
<h1>My Awesome Todo App</h1>
```

### กำหนดค่าตัวแปรสภาพแวดล้อม
```bash
# ตั้งค่าตัวแปรสภาพแวดล้อมแบบกำหนดเอง
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ดูตัวแปรสภาพแวดล้อมทั้งหมด
azd env get-values
```

## ขั้นตอนที่ 4: ปรับใช้สู่ Azure

ตอนนี้ถึงเวลาที่น่าตื่นเต้น - ปรับใช้ทุกอย่างไปยัง Azure!

```bash
# ติดตั้งโครงสร้างพื้นฐานและแอปพลิเคชัน
azd up

# คำสั่งนี้จะ:
# 1. จัดเตรียมทรัพยากร Azure (App Service, Cosmos DB, เป็นต้น)
# 2. สร้างแอปพลิเคชันของคุณ
# 3. ติดตั้งไปยังทรัพยากรที่จัดเตรียมไว้
# 4. แสดง URL ของแอปพลิเคชัน
```

### กำลังเกิดอะไรขึ้นในระหว่างการปรับใช้?

คำสั่ง `azd up` ดำเนินการดังนี้:
1. **Provision** (`azd provision`) - สร้างทรัพยากร Azure
2. **Package** - สร้างโค้ดแอปพลิเคชันของคุณ
3. **Deploy** (`azd deploy`) - ปรับใช้โค้ดสู่ทรัพยากร Azure

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

### เข้าถึงแอปพลิเคชันของคุณ
คลิกที่ URL ที่ให้ไว้ในผลลัพธ์การปรับใช้ หรือรับ URL นี้ได้ทุกเวลาที่ต้องการ:
```bash
# รับจุดสิ้นสุดของแอปพลิเคชัน
azd show

# เปิดแอปพลิเคชันในเบราว์เซอร์ของคุณ
azd show --output json | jq -r '.services.web.endpoint'
```

### ทดสอบแอป Todo
1. **เพิ่มรายการ todo** - คลิก "Add Todo" และป้อนงาน
2. **ทำเครื่องหมายว่าเสร็จ** - ติ๊กถูกในรายการที่ทำเสร็จแล้ว
3. **ลบรายการ** - ลบรายการ todo ที่คุณไม่ต้องการแล้ว

### ตรวจสอบแอปพลิเคชันของคุณ
```bash
# เปิดพอร์ทัล Azure สำหรับทรัพยากรของคุณ
azd monitor

# ดูบันทึกแอปพลิเคชัน
azd monitor --logs

# ดูเมตริกแบบสด
azd monitor --live
```

## ขั้นตอนที่ 6: แก้ไขและปรับใช้ซ้ำ

มาทำการเปลี่ยนแปลงและดูว่าการอัปเดตง่ายแค่ไหน:

### แก้ไข API
```bash
# แก้ไขโค้ด API
code src/api/src/routes/lists.js
```

เพิ่มหัวข้อการตอบกลับที่ปรับแต่งเอง:
```javascript
// ค้นหาตัวจัดการเส้นทางและเพิ่ม:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ปรับใช้เฉพาะการเปลี่ยนแปลงโค้ด
```bash
# เผยแพร่เฉพาะโค้ดแอปพลิเคชันเท่านั้น (ข้ามส่วนโครงสร้างพื้นฐาน)
azd deploy

# นี่เร็วกว่ามากเมื่อเทียบกับ 'azd up' เนื่องจากโครงสร้างพื้นฐานมีอยู่แล้ว
```

## ขั้นตอนที่ 7: จัดการหลายสภาพแวดล้อม

สร้างสภาพแวดล้อมทดสอบ (staging) เพื่อทดสอบการเปลี่ยนแปลงก่อนสู่การผลิต:

```bash
# สร้างสภาพแวดล้อมสำหรับการทดสอบใหม่
azd env new staging

# ติดตั้งสู่สภาพแวดล้อมการทดสอบ
azd up

# สลับกลับไปยังสภาพแวดล้อมการพัฒนา
azd env select dev

# แสดงรายการสภาพแวดล้อมทั้งหมด
azd env list
```

### เปรียบเทียบสภาพแวดล้อม
```bash
# ดูสภาพแวดล้อมการพัฒนา
azd env select dev
azd show

# ดูสภาพแวดล้อมการทดสอบ
azd env select staging
azd show
```

## ขั้นตอนที่ 8: ทำความสะอาดทรัพยากร

เมื่อทดลองเสร็จแล้ว ให้ทำความสะอาดเพื่อหลีกเลี่ยงค่าใช้จ่ายต่อเนื่อง:

```bash
# ลบทรัพยากร Azure ทั้งหมดสำหรับสภาพแวดล้อมปัจจุบัน
azd down

# บังคับลบโดยไม่ต้องยืนยันและลบทรัพยากรที่ถูกลบแบบนุ่มนวลออกอย่างถาวร
azd down --force --purge

# ลบสภาพแวดล้อมเฉพาะเจาะจง
azd env select staging
azd down --force --purge
```

## แอปคลาสสิก vs. แอป AI: กระบวนการเหมือนกัน

คุณเพิ่งปรับใช้แอปเว็บแบบดั้งเดิม แต่ถ้าคุณต้องการปรับใช้แอปที่ใช้ AI เช่น แอปแชทที่ขับเคลื่อนด้วย Microsoft Foundry Models ล่ะ?

ข่าวดีคือ: **กระบวนการเหมือนกันทุกประการ**

| ขั้นตอน | แอป Todo แบบคลาสสิก | แอปแชท AI |
|------|-----------------|-------------|
| เริ่มต้น | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| ตรวจสอบสิทธิ์ | `azd auth login` | `azd auth login` |
| ปรับใช้ | `azd up` | `azd up` |
| ตรวจสอบ | `azd monitor` | `azd monitor` |
| ทำความสะอาด | `azd down --force --purge` | `azd down --force --purge` |

ความแตกต่างเพียงอย่างเดียวคือ **เทมเพลต** ที่คุณเริ่มต้น เทมเพลต AI มีโครงสร้างพื้นฐานเพิ่มเติม (เช่น ทรัพยากร Microsoft Foundry Models หรือดัชนี AI Search) แต่ azd จะจัดการทั้งหมดนั้นให้คุณ คุณไม่จำเป็นต้องเรียนรู้คำสั่งใหม่ ใช้เครื่องมืออื่น หรือเปลี่ยนวิธีคิดเกี่ยวกับการปรับใช้

นี่คือหลักการสำคัญของ azd: **เวิร์กโฟลว์เดียว ทุกงาน** ทักษะที่คุณฝึกในแบบฝึกหัดนี้—การเริ่มต้น ปรับใช้ ตรวจสอบ ปรับใช้ซ้ำ และทำความสะอาด—ใช้ได้กับแอป AI และเอเย่นต์เช่นกัน

---

## สิ่งที่คุณได้เรียนรู้

ขอแสดงความยินดี! คุณได้ทำสำเร็จ:
- ✅ เริ่มต้นโปรเจกต์ azd จากเทมเพลต
- ✅ สำรวจโครงสร้างโปรเจกต์และไฟล์สำคัญ
- ✅ ปรับใช้แอปเต็มรูปแบบสู่ Azure
- ✅ ทำการเปลี่ยนแปลงโค้ดและปรับใช้ซ้ำ
- ✅ จัดการหลายสภาพแวดล้อม
- ✅ ทำความสะอาดทรัพยากร

## 🎯 แบบฝึกหัดทดสอบทักษะ

### แบบฝึกหัด 1: ปรับใช้เทมเพลตอื่น (15 นาที)
**เป้าหมาย**: แสดงความชำนาญในการเริ่มต้นและเวิร์กโฟลว์ปรับใช้ azd

```bash
# ทดลองใช้สแตก Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# ตรวจสอบการติดตั้ง
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# ทำความสะอาด
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] ปรับใช้แอปพลิเคชันได้โดยไม่มีข้อผิดพลาด
- [ ] สามารถเข้าถึง URL แอปพลิเคชันผ่านเบราว์เซอร์
- [ ] แอปพลิเคชันทำงานถูกต้อง (เพิ่ม/ลบ todos)
- [ ] ทำความสะอาดทรัพยากรทั้งหมดสำเร็จ

### แบบฝึกหัด 2: ปรับแต่งการกำหนดค่า (20 นาที)
**เป้าหมาย**: ฝึกการกำหนดค่าตัวแปรสภาพแวดล้อม

```bash
cd my-first-azd-app

# สร้างสภาพแวดล้อมที่กำหนดเอง
azd env new custom-config

# ตั้งค่าตัวแปรที่กำหนดเอง
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# ตรวจสอบตัวแปร
azd env get-values | grep APP_TITLE

# ปล่อยใช้งานด้วยการตั้งค่าที่กำหนดเอง
azd up
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างสภาพแวดล้อมที่ปรับแต่งได้สำเร็จ
- [ ] ตั้งค่าตัวแปรสภาพแวดล้อมและสามารถดึงข้อมูลได้
- [ ] ปรับใช้แอปพร้อมการกำหนดค่าส่วนบุคคล
- [ ] สามารถตรวจสอบการตั้งค่าที่ปรับแต่งในแอปที่ปรับใช้แล้ว

### แบบฝึกหัด 3: เวิร์กโฟลว์หลายสภาพแวดล้อม (25 นาที)
**เป้าหมาย**: เชี่ยวชาญการจัดการสภาพแวดล้อมและกลยุทธ์การปรับใช้

```bash
# สร้างสภาพแวดล้อมการพัฒนา
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# จดบันทึก URL การพัฒนา
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# สร้างสภาพแวดล้อมสเตจจิ้ง
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# จดบันทึก URL สเตจจิ้ง
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
- [ ] สร้างสองสภาพแวดล้อมที่มีการกำหนดค่าแตกต่างกัน
- [ ] ปรับใช้ทั้งสองสภาพแวดล้อมสำเร็จ
- [ ] สามารถสลับสภาพแวดล้อมโดยใช้ `azd env select`
- [ ] ตัวแปรสภาพแวดล้อมแตกต่างกันระหว่างสภาพแวดล้อม
- [ ] ทำความสะอาดทั้งสองสภาพแวดล้อมสำเร็จ

## 📊 ความคืบหน้าของคุณ

**เวลาที่ใช้**: ~60-90 นาที  
**ทักษะที่ได้รับ**:
- ✅ การเริ่มต้นโปรเจกต์จากเทมเพลต
- ✅ การจัดเตรียมทรัพยากร Azure
- ✅ เวิร์กโฟลว์การปรับใช้แอปพลิเคชัน
- ✅ การจัดการสภาพแวดล้อม
- ✅ การจัดการการกำหนดค่า
- ✅ การทำความสะอาดทรัพยากรและการบริหารค่าใช้จ่าย

**ขั้นตอนถัดไป**: คุณพร้อมสำหรับ [คู่มือการกำหนดค่า](configuration.md) เพื่อเรียนรู้รูปแบบการกำหนดค่าขั้นสูง!

## การแก้ไขปัญหาที่พบบ่อย

### ข้อผิดพลาดการตรวจสอบสิทธิ์
```bash
# ยืนยันตัวตนใหม่กับ Azure
az login

# ตรวจสอบการเข้าถึงการสมัครสมาชิก
az account show
```

### ความล้มเหลวในการปรับใช้
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
# ตรวจสอบว่าพอร์ตว่างไหม
netstat -an | grep :3000
netstat -an | grep :3100
```

## ขั้นตอนถัดไป

ตอนนี้คุณทำโปรเจกต์แรกเสร็จแล้ว ให้สำรวจหัวข้อขั้นสูงเหล่านี้:

### 1. ปรับแต่งโครงสร้างพื้นฐาน
- [โครงสร้างพื้นฐานเป็นโค้ด](../chapter-04-infrastructure/provisioning.md)
- [เพิ่มฐานข้อมูล, ที่เก็บข้อมูล และบริการอื่นๆ](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. ตั้งค่า CI/CD
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - เวิร์กโฟลว์ CI/CD ครบถ้วน
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - การกำหนดพายไลน์

### 3. แนวทางปฏิบัติที่ดีที่สุดสำหรับการผลิต
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - ความปลอดภัย, ประสิทธิภาพ และการตรวจสอบ

### 4. สำรวจเทมเพลตเพิ่มเติม
```bash
# เรียกดูเทมเพลตตามหมวดหมู่
azd template list --filter web
azd template list --filter api
azd template list --filter database

# ลองใช้เทคโนโลยีสแตกที่แตกต่างกัน
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## แหล่งข้อมูลเพิ่มเติม

### เอกสารการเรียนรู้
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [กรอบงาน Well-Architected ของ Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### ชุมชน & การสนับสนุน
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [ชุมชนนักพัฒนา Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### เทมเพลต & ตัวอย่าง
- [แกลเลอรีเทมเพลตอย่างเป็นทางการ](https://azure.github.io/awesome-azd/)
- [เทมเพลตชุมชน](https://github.com/Azure-Samples/azd-templates)
- [รูปแบบองค์กร](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ขอแสดงความยินดีกับการทำโปรเจกต์ azd แรกของคุณสำเร็จ!** ตอนนี้คุณพร้อมที่จะสร้างและปรับใช้แอปพลิเคชันที่น่าทึ่งบน Azure ด้วยความมั่นใจแล้ว

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกของคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [การติดตั้ง & การตั้งค่า](installation.md)
- **➡️ ต่อไป**: [การกำหนดค่า](configuration.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนาด้วย AI เป็นหลัก](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **บทเรียนถัดไป**: [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้ความแม่นยำสูงสุด โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญควรใช้บริการแปลโดยมนุษย์ผู้เชี่ยวชาญเป็นครั้งคราว เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->