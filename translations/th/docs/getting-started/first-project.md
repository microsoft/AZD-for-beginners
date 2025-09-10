<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:16:47+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "th"
}
-->
# โปรเจกต์แรกของคุณ - บทเรียนแบบลงมือปฏิบัติ

## บทนำ

ยินดีต้อนรับสู่โปรเจกต์ Azure Developer CLI แรกของคุณ! บทเรียนแบบลงมือปฏิบัติที่ครอบคลุมนี้จะพาคุณผ่านขั้นตอนการสร้าง, การปรับใช้, และการจัดการแอปพลิเคชันแบบ full-stack บน Azure โดยใช้ azd คุณจะได้ทำงานกับแอปพลิเคชัน todo จริงที่มี React เป็นส่วนหน้า, Node.js API เป็นส่วนหลัง, และฐานข้อมูล MongoDB

## เป้าหมายการเรียนรู้

เมื่อจบบทเรียนนี้ คุณจะสามารถ:
- เข้าใจขั้นตอนการเริ่มต้นโปรเจกต์ azd ด้วยเทมเพลต
- เข้าใจโครงสร้างโปรเจกต์และไฟล์การตั้งค่าของ Azure Developer CLI
- ดำเนินการปรับใช้แอปพลิเคชันไปยัง Azure พร้อมการจัดเตรียมโครงสร้างพื้นฐาน
- อัปเดตแอปพลิเคชันและกลยุทธ์การปรับใช้อีกครั้ง
- จัดการหลายสภาพแวดล้อมสำหรับการพัฒนาและการทดสอบ
- ใช้แนวทางการล้างทรัพยากรและการจัดการค่าใช้จ่าย

## ผลลัพธ์การเรียนรู้

เมื่อจบบทเรียนนี้ คุณจะสามารถ:
- เริ่มต้นและตั้งค่าโปรเจกต์ azd จากเทมเพลตได้ด้วยตัวเอง
- เข้าใจและปรับเปลี่ยนโครงสร้างโปรเจกต์ azd ได้อย่างมีประสิทธิภาพ
- ปรับใช้แอปพลิเคชันแบบ full-stack ไปยัง Azure ด้วยคำสั่งเดียว
- แก้ไขปัญหาการปรับใช้ทั่วไปและปัญหาการยืนยันตัวตน
- จัดการหลายสภาพแวดล้อม Azure สำหรับขั้นตอนการปรับใช้ที่แตกต่างกัน
- ใช้กระบวนการปรับใช้อย่างต่อเนื่องสำหรับการอัปเดตแอปพลิเคชัน

## เริ่มต้น

### เช็กลิสต์สิ่งที่ต้องมี
- ✅ ติดตั้ง Azure Developer CLI ([คู่มือการติดตั้ง](installation.md))
- ✅ ติดตั้งและยืนยันตัวตน Azure CLI
- ✅ ติดตั้ง Git บนระบบของคุณ
- ✅ Node.js 16+ (สำหรับบทเรียนนี้)
- ✅ Visual Studio Code (แนะนำ)

### ตรวจสอบการตั้งค่าของคุณ
```bash
# Check azd installation
azd version
```
### ตรวจสอบการยืนยันตัวตน Azure

```bash
az account show
```

### ตรวจสอบเวอร์ชัน Node.js
```bash
node --version
```

## ขั้นตอนที่ 1: เลือกและเริ่มต้นเทมเพลต

มาเริ่มต้นด้วยเทมเพลตแอปพลิเคชัน todo ยอดนิยมที่มี React เป็นส่วนหน้าและ Node.js API เป็นส่วนหลัง

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### เกิดอะไรขึ้นบ้าง?
- ดาวน์โหลดโค้ดเทมเพลตไปยังไดเรกทอรีในเครื่องของคุณ
- สร้างไฟล์ `azure.yaml` พร้อมคำอธิบายบริการ
- ตั้งค่าโค้ดโครงสร้างพื้นฐานในไดเรกทอรี `infra/`
- สร้างการตั้งค่าสภาพแวดล้อม

## ขั้นตอนที่ 2: สำรวจโครงสร้างโปรเจกต์

มาดูกันว่า azd สร้างอะไรให้เราบ้าง:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
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

**azure.yaml** - หัวใจของโปรเจกต์ azd ของคุณ:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - คำอธิบายโครงสร้างพื้นฐาน:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ขั้นตอนที่ 3: ปรับแต่งโปรเจกต์ของคุณ (ตัวเลือก)

ก่อนการปรับใช้ คุณสามารถปรับแต่งแอปพลิเคชันได้:

### แก้ไขส่วนหน้า
```bash
# Open the React app component
code src/web/src/App.tsx
```

ทำการเปลี่ยนแปลงง่ายๆ:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### ตั้งค่าตัวแปรสภาพแวดล้อม
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## ขั้นตอนที่ 4: ปรับใช้ไปยัง Azure

มาถึงส่วนที่น่าตื่นเต้น - ปรับใช้ทุกอย่างไปยัง Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### เกิดอะไรขึ้นระหว่างการปรับใช้?

คำสั่ง `azd up` ทำสิ่งต่อไปนี้:
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

### เข้าถึงแอปพลิเคชันของคุณ
คลิกที่ URL ที่แสดงในผลลัพธ์การปรับใช้ หรือดึง URL ได้ทุกเมื่อ:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### ทดสอบแอป Todo
1. **เพิ่มรายการ todo** - คลิก "Add Todo" และป้อนงาน
2. **ทำเครื่องหมายว่าสำเร็จ** - ติ๊กเครื่องหมายรายการที่เสร็จแล้ว
3. **ลบรายการ** - ลบรายการที่คุณไม่ต้องการอีกต่อไป

### ตรวจสอบแอปพลิเคชันของคุณ
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## ขั้นตอนที่ 6: ทำการเปลี่ยนแปลงและปรับใช้อีกครั้ง

มาทำการเปลี่ยนแปลงและดูว่าการอัปเดตง่ายแค่ไหน:

### แก้ไข API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

เพิ่มส่วนหัวการตอบกลับแบบกำหนดเอง:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ปรับใช้เฉพาะการเปลี่ยนแปลงโค้ด
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## ขั้นตอนที่ 7: จัดการหลายสภาพแวดล้อม

สร้างสภาพแวดล้อม staging เพื่อทดสอบการเปลี่ยนแปลงก่อนการใช้งานจริง:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### การเปรียบเทียบสภาพแวดล้อม
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## ขั้นตอนที่ 8: ล้างทรัพยากร

เมื่อคุณทดลองเสร็จแล้ว ให้ล้างทรัพยากรเพื่อหลีกเลี่ยงค่าใช้จ่ายต่อเนื่อง:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## สิ่งที่คุณได้เรียนรู้

ขอแสดงความยินดี! คุณได้:
- เริ่มต้นโปรเจกต์ azd จากเทมเพลต
- สำรวจโครงสร้างโปรเจกต์และไฟล์สำคัญ
- ปรับใช้แอปพลิเคชันแบบ full-stack ไปยัง Azure
- ทำการเปลี่ยนแปลงโค้ดและปรับใช้อีกครั้ง
- จัดการหลายสภาพแวดล้อม
- ล้างทรัพยากร

## การแก้ไขปัญหาทั่วไป

### ข้อผิดพลาดการยืนยันตัวตน
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### ความล้มเหลวในการปรับใช้
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### ชื่อทรัพยากรซ้ำ
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### ปัญหาพอร์ต/เครือข่าย
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## ขั้นตอนถัดไป

เมื่อคุณจบโปรเจกต์แรกแล้ว ลองสำรวจหัวข้อขั้นสูงเหล่านี้:

### 1. ปรับแต่งโครงสร้างพื้นฐาน
- [Infrastructure as Code](../deployment/provisioning.md)
- [เพิ่มฐานข้อมูล, ที่เก็บข้อมูล, และบริการอื่นๆ](../deployment/provisioning.md#adding-services)

### 2. ตั้งค่า CI/CD
- [การผสาน GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. แนวปฏิบัติที่ดีที่สุดสำหรับการใช้งานจริง
- [การตั้งค่าความปลอดภัย](../deployment/best-practices.md#security)
- [การเพิ่มประสิทธิภาพ](../deployment/best-practices.md#performance)
- [การตรวจสอบและบันทึก](../deployment/best-practices.md#monitoring)

### 4. สำรวจเทมเพลตเพิ่มเติม
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## ทรัพยากรเพิ่มเติม

### สื่อการเรียนรู้
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [กรอบการทำงาน Well-Architected ของ Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### ชุมชนและการสนับสนุน
- [GitHub ของ Azure Developer CLI](https://github.com/Azure/azure-dev)
- [ชุมชนนักพัฒนา Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### เทมเพลตและตัวอย่าง
- [แกลเลอรีเทมเพลตอย่างเป็นทางการ](https://azure.github.io/awesome-azd/)
- [เทมเพลตจากชุมชน](https://github.com/Azure-Samples/azd-templates)
- [รูปแบบองค์กร](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ขอแสดงความยินดีที่คุณทำโปรเจกต์ azd แรกสำเร็จ!** ตอนนี้คุณพร้อมที่จะสร้างและปรับใช้แอปพลิเคชันที่น่าทึ่งบน Azure ด้วยความมั่นใจแล้ว

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [การตั้งค่า](configuration.md)
- **บทเรียนถัดไป**: [คู่มือการปรับใช้](../deployment/deployment-guide.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้องมากที่สุด แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้