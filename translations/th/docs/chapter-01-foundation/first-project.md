# โครงการแรกของคุณ - แบบฝึกหัดเชิงปฏิบัติ

**การนำทางบท:**  
- **📚 หน้าหลักคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)  
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐานและเริ่มต้นอย่างรวดเร็ว  
- **⬅️ ก่อนหน้า**: [การติดตั้งและการตั้งค่า](installation.md)  
- **➡️ ถัดไป**: [การกำหนดค่า](configuration.md)  
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนาแบบมุ่งเน้น AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## บทนำ

ยินดีต้อนรับสู่โครงการ Azure Developer CLI แรกของคุณ! แบบฝึกหัดเชิงปฏิบัตินี้มีการแนะนำแบบครบถ้วนสำหรับการสร้าง ปรับใช้ และจัดการแอปแบบเต็มสแต็กบน Azure โดยใช้ azd คุณจะทำงานกับแอป todo จริงที่ประกอบด้วย frontend แบบ React, backend API ด้วย Node.js และฐานข้อมูล MongoDB

## เป้าหมายการเรียนรู้

เมื่อจบแบบฝึกหัดนี้ คุณจะสามารถ:
- เชี่ยวชาญกระบวนการเริ่มต้นโปรเจกต์ azd โดยใช้เทมเพลต
- เข้าใจโครงสร้างโปรเจกต์ Azure Developer CLI และไฟล์การกำหนดค่า
- ดำเนินการปรับใช้แอปพลิเคชันทั้งหมดไปยัง Azure พร้อมการจัดเตรียมโครงสร้างพื้นฐาน
- นำกลยุทธ์การอัปเดตแอปและการปรับใช้ซ้ำไปใช้
- จัดการหลายสภาพแวดล้อมสำหรับการพัฒนาและ staging
- ประยุกต์ใช้แนวทางการลบทรัพยากรและการจัดการค่าใช้จ่าย

## ผลลัพธ์การเรียนรู้

เมื่อเสร็จสิ้น คุณจะสามารถ:
- เริ่มต้นและกำหนดค่าโปรเจกต์ azd จากเทมเพลตได้ด้วยตนเอง
- นำทางและแก้ไขโครงสร้างโปรเจกต์ azd ได้อย่างมีประสิทธิภาพ
- ปรับใช้แอปพลิเคชันแบบเต็มสแต็กไปยัง Azure ด้วยคำสั่งเดียว
- แก้ไขปัญหาการปรับใช้และปัญหาการรับรองความถูกต้องทั่วไป
- จัดการหลายสภาพแวดล้อม Azure สำหรับขั้นตอนการปรับใช้ต่างๆ
- นำเวิร์กโฟลว์การปรับใช้ต่อเนื่องสำหรับการอัปเดตแอปไปใช้

## เริ่มต้น

### รายการตรวจสอบความต้องการล่วงหน้า
- ✅ ติดตั้ง Azure Developer CLI แล้ว ([คู่มือการติดตั้ง](installation.md))  
- ✅ ติดตั้งและเข้าสู่ระบบ Azure CLI แล้ว  
- ✅ ติดตั้ง Git บนระบบของคุณ  
- ✅ Node.js 16+ (สำหรับแบบฝึกหัดนี้)  
- ✅ Visual Studio Code (แนะนำ)  

### ตรวจสอบการตั้งค่าของคุณ
```bash
# ตรวจสอบการติดตั้ง azd
azd version
```
### ยืนยันการตรวจสอบสิทธิ์ของ Azure

```bash
az account show
```

### ตรวจสอบเวอร์ชันของ Node.js
```bash
node --version
```

## ขั้นตอนที่ 1: เลือกและเริ่มต้นเทมเพลต

มาเริ่มด้วยเทมเพลตแอป todo ยอดนิยมที่มี frontend เป็น React และ backend API เป็น Node.js

```bash
# เรียกดูเทมเพลตที่มีอยู่
azd template list

# เริ่มต้นเทมเพลตแอปงานที่ต้องทำ
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# ทำตามคำแนะนำ:
# - ป้อนชื่อสภาพแวดล้อม: "dev"
# - เลือกการสมัครใช้งาน (หากคุณมีหลายรายการ)
# - เลือกภูมิภาค: "East US 2" (หรือภูมิภาคที่คุณต้องการ)
```

### เกิดอะไรขึ้น?
- ดาวน์โหลดโค้ดเทมเพลตลงในไดเรกทอรีท้องถิ่นของคุณ
- สร้างไฟล์ `azure.yaml` พร้อมคำจำกัดความของบริการ
- ตั้งค่าโค้ดโครงสร้างพื้นฐานในไดเรกทอรี `infra/`
- สร้างการกำหนดค่าสภาพแวดล้อม

## ขั้นตอนที่ 2: สำรวจโครงสร้างโครงการ

มาดูสิ่งที่ azd สร้างให้เรา:

```bash
# ดูโครงสร้างโปรเจ็กต์
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

**azure.yaml** - แกนหลักของโปรเจกต์ azd ของคุณ:
```bash
# ดูการกำหนดค่าโครงการ
cat azure.yaml
```

**infra/main.bicep** - คำจำกัดความของโครงสร้างพื้นฐาน:
```bash
# ดูโค้ดโครงสร้างพื้นฐาน
head -30 infra/main.bicep
```

## ขั้นตอนที่ 3: ปรับแต่งโครงการของคุณ (ไม่บังคับ)

ก่อนการปรับใช้ คุณสามารถปรับแต่งแอปได้:

### แก้ไขส่วนหน้าของโปรเจกต์
```bash
# เปิดคอมโพเนนต์ของแอป React
code src/web/src/App.tsx
```

ทำการเปลี่ยนแปลงเล็กน้อย:
```typescript
// ค้นหาชื่อเรื่องแล้วเปลี่ยนมัน
<h1>My Awesome Todo App</h1>
```

### กำหนดค่าตัวแปรสภาพแวดล้อม
```bash
# ตั้งค่าตัวแปรแวดล้อมแบบกำหนดเอง
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# ดูตัวแปรแวดล้อมทั้งหมด
azd env get-values
```

## ขั้นตอนที่ 4: ปรับใช้ไปยัง Azure

ถึงเวลาส่วนที่น่าตื่นเต้น - ปรับใช้ทุกอย่างไปยัง Azure!

```bash
# ปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน
azd up

# คำสั่งนี้จะ:
# 1. จัดเตรียมทรัพยากร Azure (App Service, Cosmos DB เป็นต้น)
# 2. สร้างแอปพลิเคชันของคุณ
# 3. ปรับใช้ไปยังทรัพยากรที่จัดเตรียมไว้
# 4. แสดง URL ของแอปพลิเคชัน
```

### เกิดอะไรขึ้นระหว่างการปรับใช้?

คำสั่ง `azd up` จะทำขั้นตอนเหล่านี้:
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
คลิกที่ URL ที่ให้ไว้ในผลลัพธ์การปรับใช้ หรือเรียกดูได้ตลอดเวลา:
```bash
# รับ endpoints ของแอปพลิเคชัน
azd show

# เปิดแอปพลิเคชันในเบราว์เซอร์ของคุณ
azd show --output json | jq -r '.services.web.endpoint'
```

### ทดสอบแอป Todo
1. **เพิ่มรายการ todo** - คลิก "Add Todo" และป้อนงาน  
2. **ทำเครื่องหมายว่าทำเสร็จแล้ว** - ติ๊กเลือกรายการที่เสร็จสิ้น (Mark as complete)  
3. **ลบรายการ** - ลบ todos ที่คุณไม่ต้องการอีกต่อไป (Delete items)  

### ตรวจสอบแอปของคุณ
```bash
# เปิดพอร์ทัล Azure สำหรับทรัพยากรของคุณ
azd monitor

# ดูบันทึกของแอปพลิเคชัน
azd monitor --logs

# ดูเมตริกแบบเรียลไทม์
azd monitor --live
```

## ขั้นตอนที่ 6: ทำการเปลี่ยนแปลงและปรับใช้ใหม่

มาทำการเปลี่ยนแปลงและดูว่าอัปเดตง่ายเพียงใด:

### แก้ไข API
```bash
# แก้ไขโค้ด API
code src/api/src/routes/lists.js
```

เพิ่ม header ตอบกลับที่กำหนดเอง:
```javascript
// ค้นหาตัวจัดการเส้นทางแล้วเพิ่ม:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ปรับใช้เฉพาะการเปลี่ยนแปลงโค้ด
```bash
# ปรับใช้เฉพาะโค้ดของแอปพลิเคชัน (ข้ามโครงสร้างพื้นฐาน)
azd deploy

# วิธีนี้เร็วกว่าการใช้ 'azd up' มาก เนื่องจากโครงสร้างพื้นฐานมีอยู่แล้ว
```

## ขั้นตอนที่ 7: จัดการหลายสภาพแวดล้อม

สร้างสภาพแวดล้อม staging เพื่อทดสอบการเปลี่ยนแปลงก่อนขึ้น production:

```bash
# สร้างสภาพแวดล้อมสเตจใหม่
azd env new staging

# ปรับใช้ไปยังสเตจ
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

# ดูสภาพแวดล้อมสเตจ
azd env select staging
azd show
```

## ขั้นตอนที่ 8: ทำความสะอาดทรัพยากร

เมื่อคุณทดลองเสร็จ ให้ทำความสะอาดทรัพยากรเพื่อหลีกเลี่ยงค่าใช้จ่ายที่เกิดขึ้นต่อเนื่อง:

```bash
# ลบทรัพยากร Azure ทั้งหมดสำหรับสภาพแวดล้อมปัจจุบัน
azd down

# บังคับลบโดยไม่ต้องยืนยันและล้างทรัพยากรที่ถูกลบแบบชั่วคราว
azd down --force --purge

# ลบสภาพแวดล้อมที่ระบุ
azd env select staging
azd down --force --purge
```

## สิ่งที่คุณได้เรียนรู้

ขอแสดงความยินดี! คุณได้สำเร็จแล้ว:
- ✅ เริ่มต้นโปรเจกต์ azd จากเทมเพลต  
- ✅ สำรวจโครงสร้างโปรเจกต์และไฟล์สำคัญ  
- ✅ ปรับใช้แอปพลิเคชันแบบเต็มสแต็กไปยัง Azure  
- ✅ ทำการเปลี่ยนแปลงโค้ดและปรับใช้ซ้ำ  
- ✅ จัดการหลายสภาพแวดล้อม  
- ✅ ทำความสะอาดทรัพยากร

## 🎯 แบบฝึกหัดตรวจสอบทักษะ

### แบบฝึกหัด 1: ปรับใช้เทมเพลตที่ต่างออกไป (15 นาที)
**เป้าหมาย**: แสดงความชำนาญของ azd init และเวิร์กโฟลว์การปรับใช้

```bash
# ลองใช้สแต็ก Python + MongoDB
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
- [ ] แอปพลิเคชันปรับใช้โดยไม่มีข้อผิดพลาด  
- [ ] สามารถเข้าถึง URL ของแอปในเบราว์เซอร์ได้  
- [ ] แอปทำงานถูกต้อง (เพิ่ม/ลบ todos)  
- [ ] ทำความสะอาดทรัพยากรทั้งหมดเรียบร้อยแล้ว  

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

# ปรับใช้ด้วยการกำหนดค่าที่กำหนดเอง
azd up
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างสภาพแวดล้อมที่กำหนดเองสำเร็จ  
- [ ] ตั้งค่าตัวแปรสภาพแวดล้อมและเรียกดูได้  
- [ ] แอปปรับใช้ด้วยการกำหนดค่าที่กำหนดเอง  
- [ ] สามารถยืนยันการตั้งค่าที่กำหนดเองในแอปที่ปรับใช้แล้วได้  

### แบบฝึกหัด 3: เวิร์กโฟลว์หลายสภาพแวดล้อม (25 นาที)
**เป้าหมาย**: เชี่ยวชาญการจัดการสภาพแวดล้อมและกลยุทธ์การปรับใช้

```bash
# สร้างสภาพแวดล้อมสำหรับการพัฒนา
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# จด URL ของสภาพแวดล้อมการพัฒนา
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# สร้างสภาพแวดล้อมสำหรับสเตจ
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# จด URL ของสภาพแวดล้อมสเตจ
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# เปรียบเทียบสภาพแวดล้อม
azd env list

# ทดสอบทั้งสองสภาพแวดล้อม
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# ทำความสะอาดทั้งสองสภาพแวดล้อม
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างสองสภาพแวดล้อมที่มีการกำหนดค่าต่างกัน  
- [ ] ทั้งสองสภาพแวดล้อมปรับใช้สำเร็จ  
- [ ] สามารถสลับระหว่างสภาพแวดล้อมโดยใช้ `azd env select`  
- [ ] ตัวแปรสภาพแวดล้อมแตกต่างกันระหว่างสภาพแวดล้อม  
- [ ] ทำความสะอาดทั้งสองสภาพแวดล้อมเรียบร้อยแล้ว  

## 📊 ความคืบหน้าของคุณ

**เวลาที่ลงทุน**: ~60-90 นาที  
**ทักษะที่ได้รับ**:
- ✅ การเริ่มต้นโปรเจกต์โดยใช้เทมเพลต  
- ✅ การจัดเตรียมทรัพยากร Azure  
- ✅ เวิร์กโฟลว์การปรับใช้แอปพลิเคชัน  
- ✅ การจัดการสภาพแวดล้อม  
- ✅ การจัดการการกำหนดค่า  
- ✅ การลบทรัพยากรและการจัดการค่าใช้จ่าย  

**ขั้นต่อไป**: คุณพร้อมสำหรับ [คู่มือการกำหนดค่า](configuration.md) เพื่อเรียนรู้รูปแบบการกำหนดค่าขั้นสูง!

## การแก้ปัญหาปัญหาทั่วไป

### ข้อผิดพลาดการรับรองความถูกต้อง
```bash
# ยืนยันตัวตนอีกครั้งกับ Azure
az login

# ตรวจสอบการเข้าถึงการสมัครใช้งาน
az account show
```

### การปรับใช้ล้มเหลว
```bash
# เปิดการบันทึกดีบัก
export AZD_DEBUG=true
azd up --debug

# ดูบันทึกแอปพลิเคชันใน Azure
azd monitor --logs

# สำหรับ Container Apps ให้ใช้ Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### ความขัดแย้งของชื่อทรัพยากร
```bash
# ใช้ชื่อสภาพแวดล้อมที่ไม่ซ้ำกัน
azd env new dev-$(whoami)-$(date +%s)
```

### ปัญหาพอร์ต/เครือข่าย
```bash
# ตรวจสอบว่าพอร์ตพร้อมใช้งานหรือไม่
netstat -an | grep :3000
netstat -an | grep :3100
```

## ขั้นตอนถัดไป

ตอนนี้คุณได้ทำโครงการแรกเสร็จแล้ว สำรวจหัวข้อขั้นสูงต่อไปนี้:

### 1. ปรับแต่งโครงสร้างพื้นฐาน
- [โครงสร้างพื้นฐานเป็นโค้ด](../chapter-04-infrastructure/provisioning.md)  
- [เพิ่มฐานข้อมูล พื้นที่เก็บ และบริการอื่นๆ](../chapter-04-infrastructure/provisioning.md#adding-services)  

### 2. ตั้งค่า CI/CD
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - เวิร์กโฟลว์ CI/CD แบบสมบูรณ์  
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - การกำหนดค่าพายป์ไลน์  

### 3. แนวปฏิบัติที่ดีที่สุดสำหรับการใช้งานจริง
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - ความปลอดภัย ประสิทธิภาพ และการตรวจสอบ

### 4. สำรวจเทมเพลตเพิ่มเติม
```bash
# เรียกดูเทมเพลตตามหมวดหมู่
azd template list --filter web
azd template list --filter api
azd template list --filter database

# ลองใช้สแต็กเทคโนโลยีต่างๆ
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## แหล่งข้อมูลเพิ่มเติม

### เอกสารการเรียนรู้
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

### ชุมชนและการสนับสนุน
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)  
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)  
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)  

### เทมเพลตและตัวอย่าง
- [Official Template Gallery](https://azure.github.io/awesome-azd/)  
- [Community Templates](https://github.com/Azure-Samples/azd-templates)  
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)  

---

**ขอแสดงความยินดีที่คุณทำโครงการ azd แรกเสร็จแล้ว!** ตอนนี้คุณพร้อมที่จะสร้างและปรับใช้แอปพลิเคชันที่ยอดเยี่ยมบน Azure ด้วยความมั่นใจแล้ว

---

**การนำทางบท:**  
- **📚 หน้าหลักคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)  
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐานและเริ่มต้นอย่างรวดเร็ว  
- **⬅️ ก่อนหน้า**: [การติดตั้งและการตั้งค่า](installation.md)  
- **➡️ ถัดไป**: [การกำหนดค่า](configuration.md)  
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนาแบบมุ่งเน้น AI](../chapter-02-ai-development/microsoft-foundry-integration.md)  
- **บทเรียนถัดไป**: [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิดชอบ:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วยปัญญาประดิษฐ์ Co-op Translator (https://github.com/Azure/co-op-translator) แม้เราจะมุ่งมั่นเพื่อความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อนได้ เอกสารต้นฉบับในภาษาเดิมควรถูกถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่มีความสำคัญ ขอแนะนำให้ใช้การแปลโดยนักแปลมืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่คลาดเคลื่อนใด ๆ ที่เกิดจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->