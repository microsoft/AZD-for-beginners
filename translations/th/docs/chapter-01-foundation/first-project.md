# โปรเจกต์แรกของคุณ - บทช่วยสอนแบบลงมือทำ

**เมนูบท:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นอย่างรวดเร็ว
- **⬅️ ก่อนหน้า**: [การติดตั้งและการตั้งค่า](installation.md)
- **➡️ ถัดไป**: [นำแอปของคุณมาใช้เอง](bring-your-own-app.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนาแบบเน้น AI เป็นหลัก](../chapter-02-ai-development/microsoft-foundry-integration.md)

## บทนำ

ยินดีต้อนรับสู่โปรเจกต์ Azure Developer CLI แรกของคุณ! คุณจะได้ปรับใช้แอป Todo ที่มี React เป็น frontend, Node.js API, และ Azure Cosmos DB เทมเพลตนี้รักษาชื่อเดิม `todo-nodejs-mongo`; โดยโครงสร้างพื้นฐานปัจจุบันใช้ Cosmos DB สำหรับ NoSQL ดังนั้นควรตรวจสอบ README และ `infra/` ที่ดาวน์โหลดมาแทนที่จะคาดเดา API ของฐานข้อมูลจากชื่อ

> ตรวจสอบตาม `azd 1.37.2` และเทมเพลตสาธารณะในเดือนพฤศจิกายน 2026 ตัวอย่างด้านล่างใช้ Bash; การดึง JSON ต้องใช้ `jq` ด้วย การปรับใช้ Azure มีค่าใช้จ่ายและไม่ได้ดำเนินการในระหว่างการตรวจสอบนี้

## เป้าหมายการเรียนรู้

โดยทำบทช่วยสอนนี้ให้เสร็จ คุณจะ:
- เชี่ยวชาญกระบวนการเริ่มต้นโปรเจกต์ azd ด้วยเทมเพลต
- เข้าใจโครงสร้างโปรเจกต์ Azure Developer CLI และไฟล์การตั้งค่า
- ดำเนินการปรับใช้แอปพลิเคชันครบวงจรไปยัง Azure พร้อมกำหนดโครงสร้างพื้นฐาน
- นำกลยุทธ์อัปเดตและปรับใช้แอปพลิเคชันใหม่มาใช้
- จัดการหลายสภาพแวดล้อมสำหรับการพัฒนาและการทดสอบ
- ใช้แนวทางการทำความสะอาดทรัพยากรและการจัดการค่าใช้จ่าย

## ผลลัพธ์การเรียนรู้

เมื่อเสร็จสิ้น คุณจะสามารถ:
- เริ่มต้นและตั้งค่าโปรเจกต์ azd จากเทมเพลตอย่างอิสระ
- นำทางและแก้ไขโครงสร้างโปรเจกต์ azd อย่างมีประสิทธิภาพ
- ปรับใช้แอปพลิเคชันแบบเต็มสแตกไปยัง Azure ด้วยคำสั่งเดียว
- แก้ไขปัญหาการปรับใช้และปัญหาการตรวจสอบสิทธิ์ทั่วไป
- จัดการหลายสภาพแวดล้อม Azure สำหรับขั้นตอนการปรับใช้ที่ต่างกัน
- นำเวิร์กโฟลว์ปรับใช้ต่อเนื่องสำหรับการอัปเดตแอปพลิเคชันมาใช้

## เริ่มต้น

### รายการตรวจสอบเบื้องต้น
- ✅ ติดตั้ง Azure Developer CLI แล้ว ([คู่มือการติดตั้ง](installation.md))
- ✅ ดำเนินการตรวจสอบสิทธิ์ AZD ด้วย `azd auth login` แล้ว
- ✅ ติดตั้ง Git บนระบบของคุณแล้ว
- ✅ ติดตั้ง Node.js 22 LTS (หรือเวอร์ชันที่เทมเพลตดาวน์โหลดรองรับ)
- ✅ Visual Studio Code (แนะนำ)

ก่อนดำเนินการต่อ ให้รันตัวตรวจสอบการตั้งค่าจากรูทของรีโพสิทอรี:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### ตรวจสอบการตั้งค่าของคุณ
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### ตรวจสอบการตรวจสอบสิทธิ์ Azure CLI (ถ้ามี)

```bash
az account show
```

### ตรวจสอบเวอร์ชัน Node.js
```bash
node --version
```

## ขั้นตอนที่ 1: เลือกและเริ่มต้นเทมเพลต

เริ่มต้นด้วยเทมเพลตแอป Todo ยอดนิยมที่มี frontend เป็น React และ backend เป็น Node.js API

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### เกิดอะไรขึ้นบ้าง?
- ดาวน์โหลดโค้ดเทมเพลตไปยังไดเรกทอรีท้องถิ่นของคุณ
- สร้างไฟล์ `azure.yaml` พร้อมการกำหนดบริการ
- ตั้งค่าโค้ดโครงสร้างพื้นฐานในไดเรกทอรี `infra/`
- สร้างการกำหนดค่าสภาพแวดล้อม

## ขั้นตอนที่ 2: สำรวจโครงสร้างโปรเจกต์

มาดูสิ่งที่ azd สร้างให้เรา:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

คุณจะเห็น:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### ไฟล์สำคัญที่ควรเข้าใจ

**azure.yaml** - หัวใจของโปรเจกต์ azd ของคุณ:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - การกำหนดโครงสร้างพื้นฐาน:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## ขั้นตอนที่ 3: ปรับแต่งโปรเจกต์ของคุณ (ไม่บังคับ)

ก่อนปรับใช้ คุณสามารถปรับแต่งแอปพลิเคชันได้:

### แก้ไข Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

ทำการเปลี่ยนแปลงง่ายๆ:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### ตั้งค่าตัวแปรสภาพแวดล้อม
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

ค่ากำหนดสองค่านี้แสดงการจัดเก็บแบบท้องถิ่นเท่านั้น เทมเพลตมาตรฐานไม่ใช้ `WEBSITE_TITLE` หรือ `API_VERSION` จึงไม่เปลี่ยนแปลงแอป การแก้ไขแหล่งที่มาโดยตรงด้านบนเปลี่ยนชื่อที่แสดงแทน

## ขั้นตอนที่ 4: ปรับใช้ไปยัง Azure

ตอนนี้เป็นช่วงเวลาที่น่าตื่นเต้น - ปรับใช้ทุกอย่างไปยัง Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### เกิดอะไรขึ้นในระหว่างการปรับใช้?

เวิร์กโฟลว์จะจัดเตรียมโครงสร้างพื้นฐานและแพ็กเกจ/ปรับใช้โค้ด การเรียงลำดับที่แม่นยำสามารถปรับแต่งผ่าน `workflows.up` ใน `azure.yaml`; เทมเพลตนี้กำหนด provision ก่อน deploy อย่าเชื่อว่ามีคำสั่งขั้นตอนเดียวสำหรับทุกเทมเพลต

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
คลิกที่ URL ที่ให้ไว้ในผลลัพธ์ปรับใช้ หรือตรวจสอบตอนไหนก็ได้:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### ทดสอบแอป Todo
1. **เพิ่มรายการ todo** - คลิก "Add Todo" แล้วใส่งาน
2. **ทำเครื่องหมายว่าสำเร็จ** - ติ๊กถูกที่รายการที่เสร็จแล้ว
3. **ลบรายการ** - ลบรายการ todo ที่ไม่ต้องการแล้ว

### ตรวจสอบแอปพลิเคชันของคุณ
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ ตรวจสอบการปรับใช้ของคุณ

ก่อนดำเนินการต่อ ให้ตรวจสอบรายการนี้อย่างรวดเร็วเพื่อยืนยันว่าใช้งานได้จริง อย่าสมมติว่า "ปรับใช้สำเร็จ" หมายถึง "แอปใช้งานได้":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**จะยืนยันว่าการปรับใช้ถูกต้องเมื่อ:**
- ✅ `azd show` แสดง URL เอ็นด์พอยต์ที่เข้าถึงได้
- ✅ URL เปิดในเบราว์เซอร์ของคุณโดยไม่มีข้อผิดพลาด
- ✅ ฟีเจอร์หลักใช้งานได้ (เพิ่ม/ทำเครื่องหมายสำเร็จ/ลบ todo)
- ✅ `azd monitor --logs` แสดงคำขอที่เข้ามาโดยไม่มีข้อผิดพลาดที่ไม่คาดคิด

หากการตรวจสอบใดล้มเหลว ให้ข้ามไปที่ [บทที่ 7: การแก้ไขปัญหา](../chapter-07-troubleshooting/README.md).

## ขั้นตอนที่ 6: ทำการเปลี่ยนแปลงและปรับปรุงใหม่

มาทำการเปลี่ยนแปลงและดูว่ามันง่ายแค่ไหนที่จะอัปเดต:

### แก้ไข API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

เพิ่มหัวข้อการตอบกลับที่กำหนดเอง:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### ปล่อยการเปลี่ยนแปลงโค้ดเท่านั้น
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## ขั้นตอนที่ 7: จัดการหลายสภาพแวดล้อม

สร้างสภาพแวดล้อม staging เพื่อทดสอบการเปลี่ยนแปลงก่อนนำไปใช้ใน production:

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

เมื่อคุณทดลองเสร็จแล้ว ให้ทำความสะอาดเพื่อหลีกเลี่ยงค่าบริการที่ต่อเนื่อง:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## แอปแบบคลาสสิกกับแอปที่ใช้ AI: กระบวนการทำงานเหมือนกัน

คุณเพิ่งปรับใช้แอปเว็บแบบเดิม แต่ถ้าคุณต้องการปรับใช้แอปที่ใช้ AI แทนล่ะ — เช่น แอปแชทที่ใช้ Microsoft Foundry Models เป็นแบ็กเอนด์?

ข่าวดีคือ: **กระบวนการทำงานเหมือนกันเลย**

| ขั้นตอน | แอป Todo แบบคลาสสิก | แอปแชท AI |
|------|-----------------|-------------|
| เริ่มต้น (ไดเรกทอรีว่าง) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| ยืนยันตัวตน | `azd auth login` | `azd auth login` |
| ปรับใช้ | `azd up` | `azd up` |
| ติดตามผล | `azd monitor` | `azd monitor` |
| ทำความสะอาด | `azd down --force --purge` | `azd down --force --purge` |

คำสั่งวงจรชีวิตเหมือนกัน แต่ข้อกำหนดล่วงหน้าจะแตกต่างกัน เท็มเพลต AI อาจต้องการการเข้าถึงโมเดล โควต้าภูมิภาค การนำเข้าข้อมูล และการกำหนดค่าเพิ่มเติม อ่าน README ของมันก่อนการปรับใช้; `azd up` ไม่สามารถให้สิทธิ์หรือโควต้าที่ขาดหายไปได้

นี่คือหลักการสำคัญของ azd: **เวิร์กโฟลว์เดียว ทำงานได้ทุกภาระงาน** ทักษะที่คุณฝึกในบทเรียนนี้—การเริ่มต้น ปรับใช้ ตรวจสอบการทำงาน ปรับใช้ซ้ำ และล้างข้อมูล—ใช้กับแอป AI และเอเจนต์ได้เช่นกัน

---

## สิ่งที่คุณได้เรียนรู้

ยินดีด้วย! คุณทำได้สำเร็จ:
- ✅ เริ่มโครงการ azd จากเท็มเพลต
- ✅ สำรวจโครงสร้างโครงการและไฟล์สำคัญ
- ✅ ปรับใช้แอปแบบเต็มรูปแบบบน Azure
- ✅ แก้ไขโค้ดและปรับใช้ใหม่
- ✅ จัดการหลายสภาพแวดล้อม
- ✅ ล้างทรัพยากรเรียบร้อยแล้ว

## 🎯 แบบฝึกหัดตรวจสอบทักษะ

### แบบฝึกหัด 1: ปรับใช้เท็มเพลตที่แตกต่างกัน (15 นาที)
**เป้าหมาย**: แสดงความเชี่ยวชาญในการใช้งาน azd init และเวิร์กโฟลว์การปรับใช้

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] แอปพลิเคชันปรับใช้โดยไม่มีข้อผิดพลาด
- [ ] สามารถเข้าถึง URL แอปพลิเคชันในเบราว์เซอร์
- [ ] แอปพลิเคชันทำงานถูกต้อง (เพิ่ม/ลบ รายการที่ต้องทำ)
- [ ] ทำความสะอาดทรัพยากรทั้งหมดสำเร็จ

### แบบฝึกหัด 2: ปรับแต่งการกำหนดค่า (20 นาที)
**เป้าหมาย**: ฝึกการเก็บค่าของสภาพแวดล้อมในเครื่องโดยไม่สับสนกับการกำหนดค่ารันไทม์

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**เกณฑ์ความสำเร็จ:**
- [ ] สภาพแวดล้อมเฉพาะถูกสร้างสำเร็จ
- [ ] ตัวแปรสภาพแวดล้อมถูกตั้งค่าและสามารถเรียกคืนได้
- [ ] `azd env get-value APP_TITLE` แสดงผล `My Custom Todo App`
- [ ] สามารถอธิบายได้ว่าทำไมค่านี้จึงไม่เปลี่ยนแอปพื้นฐานเว้นแต่โค้ด/โครงสร้างพื้นฐานจะใช้ค่าเหล่านี้

### แบบฝึกหัด 3: เวิร์กโฟลว์หลายสภาพแวดล้อม (25 นาที)
**เป้าหมาย**: เชี่ยวชาญการจัดการสภาพแวดล้อมและกลยุทธ์การปรับใช้

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างสภาพแวดล้อมสองรายการด้วยการตั้งค่าที่แตกต่างกัน
- [ ] สภาพแวดล้อมทั้งสองถูกปรับใช้สำเร็จ
- [ ] สามารถสลับระหว่างสภาพแวดล้อมโดยใช้ `azd env select`
- [ ] ตัวแปรสภาพแวดล้อมแตกต่างกันระหว่างสภาพแวดล้อม
- [ ] ทำความสะอาดสภาพแวดล้อมทั้งสองสำเร็จ

## 📊 ความก้าวหน้าของคุณ

**เวลาที่ใช้ไป**: ~60-90 นาที  
**ทักษะที่ได้รับ**:
- ✅ การเริ่มต้นโครงการด้วยเทมเพลต
- ✅ การจัดเตรียมทรัพยากร Azure
- ✅ เวิร์กโฟลว์การปรับใช้แอปพลิเคชัน
- ✅ การจัดการสภาพแวดล้อม
- ✅ การจัดการการตั้งค่า
- ✅ การทำความสะอาดทรัพยากรและการจัดการค่าใช้จ่าย

**ระดับถัดไป**: คุณพร้อมสำหรับ [คู่มือการตั้งค่า](../chapter-03-configuration/configuration.md) เพื่อเรียนรู้รูปแบบการตั้งค่าขั้นสูง!

## การแก้ไขปัญหาทั่วไป

### ข้อผิดพลาดการพิสูจน์ตัวตน
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### การปรับใช้ล้มเหลว
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
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

เมื่อคุณทำโครงการแรกเสร็จแล้ว ให้สำรวจหัวข้อขั้นสูงเหล่านี้:

### 1. ปรับแต่งโครงสร้างพื้นฐาน
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [เพิ่มโครงสร้างฐานข้อมูล](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. ตั้งค่า CI/CD
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - เวิร์กโฟลว์ CI/CD ครบถ้วน
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - การตั้งค่า pipeline

### 3. แนวปฏิบัติที่ดีที่สุดสำหรับการผลิต
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - ความปลอดภัย ประสิทธิภาพ และการตรวจสอบ

### 4. สำรวจเทมเพลตเพิ่มเติม
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## แหล่งข้อมูลเพิ่มเติม

### เอกสารการเรียนรู้
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [กรอบงาน Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### ชุมชน & การสนับสนุน
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [ชุมชนนักพัฒนา Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### เทมเพลต & ตัวอย่าง
- [แกลเลอรีเทมเพลตอย่างเป็นทางการ](https://azure.github.io/awesome-azd/)
- [การมีส่วนร่วมเทมเพลตจากชุมชน](https://github.com/Azure/awesome-azd)
- [แหล่งเทมเพลต Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**ขอแสดงความยินดีที่คุณทำโครงการ azd แรกเสร็จสิ้นแล้ว!** ตอนนี้คุณพร้อมที่จะสร้างและปรับใช้แอปพลิเคชันที่น่าทึ่งบน Azure ด้วยความมั่นใจ

---

**การนำทางบท:**
- **📚 หน้าหลักคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 1 - พื้นฐาน & เริ่มต้นด่วน
- **⬅️ ก่อนหน้า**: [การติดตั้ง & การตั้งค่า](installation.md)
- **➡️ ถัดไป**: [นำแอปของคุณมาเอง](bring-your-own-app.md)
- **🚀 บทถัดไป**: [บทที่ 2: การพัฒนาด้วย AI เป็นหลัก](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->