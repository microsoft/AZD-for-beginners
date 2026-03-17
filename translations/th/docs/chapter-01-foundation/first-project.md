# โปรเจกต์แรกของคุณ - บทแนะนำแบบลงมือทำ

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐานและเริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [การติดตั้งและการตั้งค่า](installation.md)
- **➡️ ถัดไป**: [การกำหนดค่า](configuration.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนาแบบ AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

## บทนำ

ยินดีต้อนรับสู่โปรเจกต์ Azure Developer CLI แรกของคุณ! บทแนะนำแบบลงมือทำนี้ครอบคลุมขั้นตอนทั้งหมดของการสร้าง การปรับใช้ และการจัดการแอปแบบเต็มสแตกบน Azure โดยใช้ azd คุณจะได้ทำงานกับแอป todo จริงที่มีทั้งส่วนหน้า React ส่วนหลัง API Node.js และฐานข้อมูล MongoDB

## เป้าหมายการเรียนรู้

เมื่อทำบทแนะนำนี้เสร็จ คุณจะสามารถ:
- เชี่ยวชาญการเริ่มต้นโปรเจกต์ azd โดยใช้เทมเพลต
- เข้าใจโครงสร้างโปรเจกต์ Azure Developer CLI และไฟล์การตั้งค่า
- ปรับใช้แอปพลิเคชันแบบเต็มสแตกไปยัง Azure พร้อมการจัดเตรียมโครงสร้างพื้นฐาน
- นำกลยุทธ์การปรับปรุงแอปและการปรับใช้ซ้ำมาใช้
- จัดการสภาพแวดล้อมหลายแบบสำหรับการพัฒนาและสเตจจิง
- ใช้แนวทางการล้างทรัพยากรและจัดการต้นทุน

## ผลลัพธ์การเรียนรู้

เมื่อเสร็จสิ้น คุณจะสามารถ:
- เริ่มและกำหนดค่าโปรเจกต์ azd จากเทมเพลตได้อย่างอิสระ
- นำทางและแก้ไขโครงสร้างโปรเจกต์ azd ได้อย่างมีประสิทธิภาพ
- ปรับใช้แอปแบบเต็มสแตกไปยัง Azure ด้วยคำสั่งเดียว
- แก้ไขปัญหาการปรับใช้ทั่วไปและปัญหาการรับรองความถูกต้อง
- จัดการสภาพแวดล้อม Azure หลายแบบสำหรับขั้นตอนการปรับใช้ต่าง ๆ
- นำกระบวนการปรับใช้ต่อเนื่องมาใช้สำหรับการอัปเดตแอปพลิเคชัน

## เริ่มต้น

### รายการตรวจสอบความพร้อม
- ✅ ติดตั้ง Azure Developer CLI ([คู่มือการติดตั้ง](installation.md))
- ✅ ติดตั้งและรับรองความถูกต้อง Azure CLI เรียบร้อยแล้ว
- ✅ ติดตั้ง Git ในระบบของคุณ
- ✅ Node.js 16+ (สำหรับบทแนะนำนี้)
- ✅ Visual Studio Code (แนะนำ)

### ตรวจสอบการตั้งค่าของคุณ
```bash
# ตรวจสอบการติดตั้ง azd
azd version
```
### ยืนยันการรับรองความถูกต้องของ Azure

```bash
az account show
```

### ตรวจสอบเวอร์ชัน Node.js
```bash
node --version
```

## ขั้นตอนที่ 1: เลือกและเริ่มต้นเทมเพลต

เริ่มจากเทมเพลตแอป todo ที่ได้รับความนิยมซึ่งประกอบด้วยส่วนหน้า React และส่วนหลัง API Node.js

```bash
# เรียกดูแม่แบบที่มีอยู่
azd template list

# เริ่มต้นแม่แบบแอปงานที่ต้องทำ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ทำตามขั้นตอนคำแนะนำ:
# - กรอกชื่อสภาพแวดล้อม: "dev"
# - เลือกการสมัครใช้งาน (ถ้าคุณมีหลายรายการ)
# - เลือกภูมิภาค: "East US 2" (หรือภูมิภาคที่คุณต้องการ)
```

### เกิดอะไรขึ้นบ้าง?
- ดาวน์โหลดโค้ดเทมเพลตไปยังไดเรกทอรีในเครื่องของคุณ
- สร้างไฟล์ `azure.yaml` ที่มีคำจำกัดความบริการ
- ตั้งค่าโค้ดโครงสร้างพื้นฐานในไดเรกทอรี `infra/`
- สร้างการกำหนดค่าสภาพแวดล้อม

## ขั้นตอนที่ 2: สำรวจโครงสร้างโปรเจกต์

มาดูสิ่งที่ azd สร้างให้เรา:

```bash
# ดูโครงสร้างโปรเจกต์
tree /f   # วินโดวส์
# หรือ
find . -type f | head -20   # แมคโอเอส/ลินุกซ์
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

**azure.yaml** - หัวใจของโปรเจกต์ azd ของคุณ:
```bash
# ดูการกำหนดค่าของโครงการ
cat azure.yaml
```

**infra/main.bicep** - การกำหนดโครงสร้างพื้นฐาน:
```bash
# ดูโค้ดโครงสร้างพื้นฐาน
head -30 infra/main.bicep
```

## ขั้นตอนที่ 3: ปรับแต่งโปรเจกต์ของคุณ (ถ้าต้องการ)

ก่อนการปรับใช้ คุณสามารถปรับแต่งแอปพลิเคชันได้:

### แก้ไขส่วนหน้า
```bash
# เปิดคอมโพเนนต์แอป React
code src/web/src/App.tsx
```

ทำการเปลี่ยนแปลงอย่างง่าย:
```typescript
// ค้นหาชื่อเรื่องและเปลี่ยนมัน
<h1>My Awesome Todo App</h1>
```

### กำหนดค่าสภาพแวดล้อม
```bash
# ตั้งค่าตัวแปรสภาพแวดล้อมที่กำหนดเอง
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ดูตัวแปรสภาพแวดล้อมทั้งหมด
azd env get-values
```

## ขั้นตอนที่ 4: ปรับใช้ไปยัง Azure

ตอนนี้ถึงเวลาที่น่าตื่นเต้น - ปรับใช้ทุกอย่างไปยัง Azure!

```bash
# จัดเตรียมโครงสร้างพื้นฐานและแอปพลิเคชัน
azd up

# คำสั่งนี้จะ:
# 1. จัดเตรียมทรัพยากร Azure (App Service, Cosmos DB เป็นต้น)
# 2. สร้างแอปพลิเคชันของคุณ
# 3. นำไปใช้งานกับทรัพยากรที่จัดเตรียมไว้
# 4. แสดง URL ของแอปพลิเคชัน
```

### เกิดอะไรขึ้นระหว่างการปรับใช้?

คำสั่ง `azd up` ดำเนินการตามขั้นตอนเหล่านี้:
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

## ขั้นตอนที่ 5: ทดสอบแอปของคุณ

### เข้าถึงแอปของคุณ
คลิกลิงก์ URL ที่ปรากฏในผลลัพธ์การปรับใช้ หรือเรียกใช้งานตอนไหนก็ได้:
```bash
# รับจุดสิ้นสุดของแอปพลิเคชัน
azd show

# เปิดแอปพลิเคชันในเบราว์เซอร์ของคุณ
azd show --output json | jq -r '.services.web.endpoint'
```

### ทดสอบแอป Todo
1. **เพิ่มรายการ todo** - คลิก "Add Todo" และกรอกงาน
2. **ทำเครื่องหมายว่างานเสร็จแล้ว** - ทำเครื่องหมายรายการที่เสร็จ
3. **ลบรายการ** - ลบรายการ todos ที่ไม่ต้องการ

### ติดตามแอปของคุณ
```bash
# เปิดพอร์ทัล Azure สำหรับทรัพยากรของคุณ
azd monitor

# ดูบันทึกแอปพลิเคชัน
azd monitor --logs

# ดูเมตริกส์แบบสด
azd monitor --live
```

## ขั้นตอนที่ 6: แก้ไขและปรับใช้ซ้ำ

มาทำการเปลี่ยนแปลงและดูว่าการอัปเดตง่ายแค่ไหน:

### แก้ไข API
```bash
# แก้ไขโค้ด API
code src/api/src/routes/lists.js
```

เพิ่ม header ตอบกลับแบบกำหนดเอง:
```javascript
// ค้นหาตัวจัดการเส้นทางและเพิ่ม:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ปรับใช้เฉพาะโค้ดที่เปลี่ยนแปลง
```bash
# เฉพาะโค้ดแอปพลิเคชันเท่านั้นที่ถูกปรับใช้ (ข้ามโครงสร้างพื้นฐาน)
azd deploy

# นี่เร็วกว่ามากเมื่อเทียบกับ 'azd up' เนื่องจากโครงสร้างพื้นฐานมีอยู่แล้ว
```

## ขั้นตอนที่ 7: จัดการสภาพแวดล้อมหลายแบบ

สร้างสภาพแวดล้อมสเตจจิงเพื่อทดสอบการเปลี่ยนแปลงก่อนเข้าสู่ production:

```bash
# สร้างสภาพแวดล้อมการทดสอบใหม่
azd env new staging

# นำไปใช้กับการทดสอบ
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

# ดูสภาพแวดล้อมการเตรียมพร้อม
azd env select staging
azd show
```

## ขั้นตอนที่ 8: ล้างทรัพยากร

เมื่อทดลองเสร็จแล้ว ให้ล้างทรัพยากรเพื่อลดค่าใช้จ่าย:

```bash
# ลบทรัพยากร Azure ทั้งหมดสำหรับสภาพแวดล้อมปัจจุบัน
azd down

# บังคับลบโดยไม่ต้องยืนยันและลบทรัพยากรที่ถูกลบแบบชั่วคราวออกอย่างถาวร
azd down --force --purge

# ลบสภาพแวดล้อมเฉพาะเจาะจง
azd env select staging
azd down --force --purge
```

## แอปคลาสสิก vs. แอป AI: กระบวนการเดียวกัน

คุณเพิ่งปรับใช้แอปเว็บแบบดั้งเดิมไป แต่ถ้าคุณต้องการปรับใช้แอปที่ขับเคลื่อนด้วย AI อย่างแอปแชทที่ใช้ Microsoft Foundry Models ล่ะ?

ข่าวดี: **กระบวนการเหมือนกันทุกประการ**

| ขั้นตอน | แอป Todo คลาสสิก | แอปแชท AI |
|------|-----------------|-------------|
| เริ่มต้น | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| รับรองความถูกต้อง | `azd auth login` | `azd auth login` |
| ปรับใช้ | `azd up` | `azd up` |
| ติดตาม | `azd monitor` | `azd monitor` |
| ล้างข้อมูล | `azd down --force --purge` | `azd down --force --purge` |

ต่างกันเพียงแค่ **เทมเพลต** ที่คุณเริ่มต้นเท่านั้น เทมเพลต AI จะมีโครงสร้างพื้นฐานเพิ่มเติม (เช่น ทรัพยากร Microsoft Foundry Models หรือดัชนี AI Search) แต่ azd จะจัดการทั้งหมดให้คุณ คุณไม่จำเป็นต้องเรียนรู้คำสั่งใหม่ ใช้เครื่องมือแตกต่าง หรือเปลี่ยนความคิดเกี่ยวกับการปรับใช้

นี่คือหลักการสำคัญของ azd: **กระบวนการเดียว รองรับงานทุกประเภท** ทักษะที่คุณฝึกในบทแนะนำนี้—การเริ่มต้น การปรับใช้ การติดตาม การปรับใช้ซ้ำ และการล้างข้อมูล—สามารถนำไปใช้กับแอปและเอเจนต์ AI ได้เช่นกัน

---

## สิ่งที่คุณได้เรียนรู้

ยินดีด้วย! คุณได้:
- ✅ เริ่มต้นโปรเจกต์ azd จากเทมเพลต
- ✅ สำรวจโครงสร้างโปรเจกต์และไฟล์สำคัญ
- ✅ ปรับใช้แอปพลิเคชันแบบเต็มสแตกไปยัง Azure
- ✅ แก้ไขโค้ดและปรับใช้ซ้ำ
- ✅ จัดการสภาพแวดล้อมหลายแบบ
- ✅ ล้างทรัพยากร

## 🎯 แบบฝึกหัดทักษะ

### แบบฝึกหัด 1: ปรับใช้เทมเพลตอื่น (15 นาที)
**เป้าหมาย**: แสดงความเชี่ยวชาญใน azd init และ workflow การปรับใช้

```bash
# ลองใช้สแต็ค Python + MongoDB
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
- [ ] แอปพลิเคชันปรับใช้ได้โดยไม่มีข้อผิดพลาด
- [ ] เข้าถึง URL ของแอปผ่านเบราว์เซอร์ได้
- [ ] แอปทำงานถูกต้อง (เพิ่ม/ลบ todo)
- [ ] ล้างข้อมูลทรัพยากรทั้งหมดสำเร็จ

### แบบฝึกหัด 2: ปรับแต่งการกำหนดค่า (20 นาที)
**เป้าหมาย**: ฝึกการกำหนดค่าสภาพแวดล้อม

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

# ใช้การปรับแต่งคอนฟิกแบบกำหนดเอง
azd up
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างสภาพแวดล้อมกำหนดเองสำเร็จ
- [ ] กำหนดค่าสภาพแวดล้อมและตรวจสอบได้
- [ ] แอปปรับใช้ด้วยการตั้งค่ากำหนดเอง
- [ ] ตรวจสอบการตั้งค่าที่กำหนดเองในแอปที่ปรับใช้แล้วได้

### แบบฝึกหัด 3: Workflow หลายสภาพแวดล้อม (25 นาที)
**เป้าหมาย**: เชี่ยวชาญการจัดการสภาพแวดล้อมและกลยุทธ์ปรับใช้

```bash
# สร้างสภาพแวดล้อมการพัฒนา
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# บันทึก URL การพัฒนา
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# สร้างสภาพแวดล้อมการทดสอบ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# บันทึก URL การทดสอบ
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
- [ ] สร้างสภาพแวดล้อมสองแบบที่มีการกำหนดค่าต่างกัน
- [ ] ปรับใช้สภาพแวดล้อมทั้งสองสำเร็จ
- [ ] สลับระหว่างสภาพแวดล้อมโดยใช้ `azd env select` ได้
- [ ] ค่าสภาพแวดล้อมแตกต่างกันระหว่างสภาพแวดล้อม
- [ ] ล้างทั้งสองสภาพแวดล้อมสำเร็จ

## 📊 ความก้าวหน้าของคุณ

**เวลาที่ใช้:** ~60-90 นาที  
**ทักษะที่ได้รับ:**
- ✅ เริ่มโปรเจกต์โดยใช้เทมเพลต
- ✅ จัดเตรียมทรัพยากร Azure
- ✅ Workflow การปรับใช้แอปพลิเคชัน
- ✅ การจัดการสภาพแวดล้อม
- ✅ การจัดการการตั้งค่า
- ✅ การล้างทรัพยากรและการจัดการต้นทุน

**ระดับถัดไป:** คุณพร้อมแล้วสำหรับ [คู่มือการกำหนดค่า](configuration.md) เพื่อเรียนรู้รูปแบบการตั้งค่าขั้นสูง!

## การแก้ไขปัญหาที่พบบ่อย

### ปัญหาการรับรองความถูกต้อง
```bash
# การตรวจสอบสิทธิ์ใหม่กับ Azure
az login

# ตรวจสอบการเข้าถึงการสมัครสมาชิก
az account show
```

### ปัญหาการปรับใช้ล้มเหลว
```bash
# เปิดใช้งานการบันทึกข้อผิดพลาด
export AZD_DEBUG=true
azd up --debug

# ดูบันทึกแอปพลิเคชันใน Azure
azd monitor --logs

# สำหรับ Container Apps ใช้ Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ข้อขัดแย้งชื่อทรัพยากร
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

ตอนนี้ที่คุณทำโปรเจกต์แรกเสร็จแล้ว ให้สำรวจหัวข้อขั้นสูงเหล่านี้:

### 1. ปรับแต่งโครงสร้างพื้นฐาน
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [เพิ่มฐานข้อมูล, ที่เก็บข้อมูล และบริการอื่น ๆ](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. ตั้งค่า CI/CD
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - Workflow CI/CD ครบวงจร
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - การกำหนดค่าพายป์ไลน์

### 3. แนวทางที่ดีที่สุดสำหรับโปรดักชัน
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - ความปลอดภัย, ประสิทธิภาพ, และการติดตาม

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

### เอกสารการเรียนรู้
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [กรอบการทำงาน Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### ชุมชนและการสนับสนุน
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [ชุมชนนักพัฒนา Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### เทมเพลตและตัวอย่าง
- [แกลเลอรีเทมเพลตอย่างเป็นทางการ](https://azure.github.io/awesome-azd/)
- [เทมเพลตจากชุมชน](https://github.com/Azure-Samples/azd-templates)
- [แพทเทิร์นสำหรับองค์กร](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ยินดีด้วยที่ทำโปรเจกต์ azd แรกสำเร็จ!** ตอนนี้คุณพร้อมที่จะสร้างและปรับใช้แอปพลิเคชันที่น่าทึ่งบน Azure ด้วยความมั่นใจแล้ว

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐานและเริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [การติดตั้งและการตั้งค่า](installation.md)
- **➡️ ถัดไป**: [การกำหนดค่า](configuration.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนาแบบ AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **บทเรียนถัดไป**: [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อน เอกสารต้นฉบับในภาษาต้นทางควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลโดยมนุษย์มืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->