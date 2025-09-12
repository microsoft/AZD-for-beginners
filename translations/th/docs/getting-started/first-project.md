<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T20:58:16+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "th"
}
-->
# โครงการแรกของคุณ - บทเรียนแบบลงมือทำ

**ก่อนหน้า:** [Configuration](configuration.md) | **ถัดไป:** [Azure AI Foundry Integration](../ai-foundry/azure-ai-foundry-integration.md)

## บทนำ

ยินดีต้อนรับสู่โครงการแรกของคุณกับ Azure Developer CLI! บทเรียนแบบลงมือทำนี้จะพาคุณผ่านขั้นตอนการสร้าง, การปรับใช้, และการจัดการแอปพลิเคชันแบบเต็มรูปแบบบน Azure โดยใช้ azd คุณจะได้ทำงานกับแอปพลิเคชัน todo จริงที่มี React เป็นส่วนหน้า, Node.js API เป็นส่วนหลัง, และฐานข้อมูล MongoDB

## เป้าหมายการเรียนรู้

เมื่อคุณทำบทเรียนนี้เสร็จ คุณจะ:
- เข้าใจขั้นตอนการเริ่มต้นโครงการ azd โดยใช้เทมเพลต
- เข้าใจโครงสร้างโครงการและไฟล์การตั้งค่าของ Azure Developer CLI
- ปรับใช้แอปพลิเคชันแบบเต็มรูปแบบบน Azure พร้อมการจัดเตรียมโครงสร้างพื้นฐาน
- อัปเดตแอปพลิเคชันและกลยุทธ์การปรับใช้ใหม่
- จัดการสภาพแวดล้อมหลายแบบสำหรับการพัฒนาและการทดสอบ
- ใช้แนวทางการทำความสะอาดทรัพยากรและการจัดการค่าใช้จ่าย

## ผลลัพธ์การเรียนรู้

เมื่อเสร็จสิ้น คุณจะสามารถ:
- เริ่มต้นและตั้งค่าโครงการ azd จากเทมเพลตได้ด้วยตัวเอง
- เข้าใจและปรับเปลี่ยนโครงสร้างโครงการ azd ได้อย่างมีประสิทธิภาพ
- ปรับใช้แอปพลิเคชันแบบเต็มรูปแบบบน Azure ด้วยคำสั่งเดียว
- แก้ไขปัญหาการปรับใช้ทั่วไปและปัญหาการตรวจสอบสิทธิ์
- จัดการสภาพแวดล้อม Azure หลายแบบสำหรับขั้นตอนการปรับใช้ต่าง ๆ
- ใช้กระบวนการปรับใช้อย่างต่อเนื่องสำหรับการอัปเดตแอปพลิเคชัน

## เริ่มต้น

### รายการตรวจสอบเบื้องต้น
- ✅ ติดตั้ง Azure Developer CLI ([คู่มือการติดตั้ง](installation.md))
- ✅ ติดตั้งและตรวจสอบสิทธิ์ Azure CLI
- ✅ ติดตั้ง Git บนระบบของคุณ
- ✅ Node.js 16+ (สำหรับบทเรียนนี้)
- ✅ Visual Studio Code (แนะนำ)

### ตรวจสอบการตั้งค่าของคุณ
```bash
# Check azd installation
azd version
```
### ตรวจสอบการตรวจสอบสิทธิ์ Azure

```bash
az account show
```

### ตรวจสอบเวอร์ชัน Node.js
```bash
node --version
```

## ขั้นตอนที่ 1: เลือกและเริ่มต้นเทมเพลต

เริ่มต้นด้วยเทมเพลตแอปพลิเคชัน todo ยอดนิยมที่มี React เป็นส่วนหน้าและ Node.js API เป็นส่วนหลัง

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

### สิ่งที่เกิดขึ้น
- ดาวน์โหลดโค้ดเทมเพลตไปยังไดเรกทอรีในเครื่องของคุณ
- สร้างไฟล์ `azure.yaml` พร้อมคำจำกัดความของบริการ
- ตั้งค่าโค้ดโครงสร้างพื้นฐานในไดเรกทอรี `infra/`
- สร้างการตั้งค่าสภาพแวดล้อม

## ขั้นตอนที่ 2: สำรวจโครงสร้างโครงการ

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

**azure.yaml** - หัวใจของโครงการ azd ของคุณ:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - คำจำกัดความของโครงสร้างพื้นฐาน:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ขั้นตอนที่ 3: ปรับแต่งโครงการของคุณ (ไม่บังคับ)

ก่อนการปรับใช้ คุณสามารถปรับแต่งแอปพลิเคชันได้:

### แก้ไขส่วนหน้า
```bash
# Open the React app component
code src/web/src/App.tsx
```

ทำการเปลี่ยนแปลงง่าย ๆ:
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

## ขั้นตอนที่ 4: ปรับใช้บน Azure

มาถึงส่วนที่น่าตื่นเต้น - ปรับใช้ทุกอย่างบน Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### สิ่งที่เกิดขึ้นระหว่างการปรับใช้

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
2. **ทำเครื่องหมายว่าเสร็จแล้ว** - เช็คไอเท็มที่เสร็จแล้ว
3. **ลบรายการ** - ลบรายการที่คุณไม่ต้องการ

### ตรวจสอบแอปพลิเคชันของคุณ
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## ขั้นตอนที่ 6: ทำการเปลี่ยนแปลงและปรับใช้ใหม่

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

## ขั้นตอนที่ 7: จัดการสภาพแวดล้อมหลายแบบ

สร้างสภาพแวดล้อมการทดสอบเพื่อทดสอบการเปลี่ยนแปลงก่อนการใช้งานจริง:

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

## ขั้นตอนที่ 8: ทำความสะอาดทรัพยากร

เมื่อคุณทดลองเสร็จแล้ว ทำความสะอาดเพื่อหลีกเลี่ยงค่าใช้จ่ายที่ต่อเนื่อง:

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
- เริ่มต้นโครงการ azd จากเทมเพลต
- สำรวจโครงสร้างโครงการและไฟล์สำคัญ
- ปรับใช้แอปพลิเคชันแบบเต็มรูปแบบบน Azure
- ทำการเปลี่ยนแปลงโค้ดและปรับใช้ใหม่
- จัดการสภาพแวดล้อมหลายแบบ
- ทำความสะอาดทรัพยากร

## การแก้ไขปัญหาทั่วไป

### ข้อผิดพลาดการตรวจสอบสิทธิ์
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

### ความขัดแย้งของชื่อทรัพยากร
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

เมื่อคุณทำโครงการแรกเสร็จแล้ว ลองสำรวจหัวข้อขั้นสูงเหล่านี้:

### 1. ปรับแต่งโครงสร้างพื้นฐาน
- [Infrastructure as Code](../deployment/provisioning.md)
- [เพิ่มฐานข้อมูล, ที่เก็บข้อมูล, และบริการอื่น ๆ](../deployment/provisioning.md#adding-services)

### 2. ตั้งค่า CI/CD
- [การรวม GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. แนวทางปฏิบัติที่ดีที่สุดสำหรับการใช้งานจริง
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

## แหล่งข้อมูลเพิ่มเติม

### สื่อการเรียนรู้
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [กรอบงาน Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### ชุมชนและการสนับสนุน
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [ชุมชน Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### เทมเพลตและตัวอย่าง
- [แกลเลอรีเทมเพลตอย่างเป็นทางการ](https://azure.github.io/awesome-azd/)
- [เทมเพลตชุมชน](https://github.com/Azure-Samples/azd-templates)
- [รูปแบบองค์กร](https://github.com/Azure/azure-dev/tree/main/templates)

---

**ขอแสดงความยินดีที่คุณทำโครงการ azd แรกเสร็จสิ้น!** ตอนนี้คุณพร้อมที่จะสร้างและปรับใช้แอปพลิเคชันที่ยอดเยี่ยมบน Azure ด้วยความมั่นใจแล้ว

---

**ก่อนหน้า:** [Configuration](configuration.md) | **ถัดไป:** [Azure AI Foundry Integration](../ai-foundry/azure-ai-foundry-integration.md)
- **บทเรียนถัดไป**: [Deployment Guide](../deployment/deployment-guide.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้