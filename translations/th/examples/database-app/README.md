# การปรับใช้ฐานข้อมูล Microsoft SQL และเว็บแอปด้วย AZD

⏱️ **เวลาประมาณ**: 20-30 นาที | 💰 **ค่าใช้จ่ายประมาณ**: ~$15-25/เดือน | ⭐ **ความซับซ้อน**: ระดับกลาง

**ตัวอย่างการทำงานครบถ้วนนี้** จะแสดงวิธีการใช้ [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) เพื่อปรับใช้แอปเว็บ Python Flask พร้อมฐานข้อมูล Microsoft SQL ไปยัง Azure มีโค้ดทั้งหมดรวมอยู่และทดสอบแล้ว — ไม่ต้องใช้ไลบรารีภายนอกใดๆ

## สิ่งที่คุณจะได้เรียนรู้

โดยการทำตัวอย่างนี้ คุณจะได้:
- ปรับใช้แอปพลิเคชันหลายชั้น (เว็บแอป + ฐานข้อมูล) ด้วยโครงสร้างพื้นฐานเป็นโค้ด
- กำหนดค่าการเชื่อมต่อฐานข้อมูลอย่างปลอดภัยโดยไม่ต้องฝังความลับในโค้ด
- ตรวจสอบสุขภาพแอปพลิเคชันด้วย Application Insights
- จัดการทรัพยากร Azure อย่างมีประสิทธิภาพด้วย AZD CLI
- ปฏิบัติตามแนวทางปฏิบัติที่ดีที่สุดของ Azure ในเรื่องความปลอดภัย การเพิ่มประสิทธิภาพค่าใช้จ่าย และการสังเกตการณ์

## ภาพรวมสถานการณ์
- **เว็บแอป**: Python Flask REST API พร้อมการเชื่อมต่อฐานข้อมูล
- **ฐานข้อมูล**: Azure SQL Database พร้อมข้อมูลตัวอย่าง
- **โครงสร้างพื้นฐาน**: จัดหาโดยใช้ Bicep (เทมเพลตแบบโมดูลาร์และนำกลับมาใช้ใหม่ได้)
- **การปรับใช้**: อัตโนมัติเต็มรูปแบบด้วยคำสั่ง `azd`
- **การตรวจสอบ**: Application Insights สำหรับบันทึกและเทเลเมทรี

## ข้อกำหนดล่วงหน้า

### เครื่องมือที่ต้องใช้

ก่อนเริ่ม ตรวจสอบให้แน่ใจว่าคุณติดตั้งเครื่องมือเหล่านี้แล้ว:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (เวอร์ชัน 2.50.0 ขึ้นไป)
   ```sh
   az --version
   # ผลลัพธ์ที่คาดหวัง: azure-cli 2.50.0 หรือสูงกว่า
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (เวอร์ชัน 1.0.0 ขึ้นไป)
   ```sh
   azd version
   # คาดหวังผลลัพธ์: azd รุ่น 1.0.0 หรือสูงกว่า
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (สำหรับพัฒนาท้องถิ่น)
   ```sh
   python --version
   # ผลลัพธ์ที่คาดหวัง: Python 3.8 ขึ้นไป
   ```

4. **[Docker](https://www.docker.com/get-started)** (ไม่บังคับ สำหรับพัฒนาคอนเทนเนอร์ในเครื่อง)
   ```sh
   docker --version
   # ผลลัพธ์ที่คาดหวัง: Docker รุ่น 20.10 หรือสูงกว่า
   ```

### ข้อกำหนดของ Azure

- มี **บัญชีผู้ใช้ Azure ที่ใช้งานได้** ([สร้างบัญชีฟรี](https://azure.microsoft.com/free/))
- สิทธิ์ในการสร้างทรัพยากรในบัญชีของคุณ
- บทบาท **เจ้าของ (Owner)** หรือ **ผู้ร่วมมือ (Contributor)** ในบัญชีหรือกลุ่มทรัพยากร

### ความรู้พื้นฐาน

นี่คือตัวอย่างระดับกลาง คุณควรคุ้นเคยกับ:
- การใช้คำสั่งบรรทัดคำสั่งพื้นฐาน
- ความรู้เบื้องต้นเกี่ยวกับคลาวด์ (ทรัพยากร, กลุ่มทรัพยากร)
- ความเข้าใจพื้นฐานเกี่ยวกับเว็บแอปและฐานข้อมูล

**ยังใหม่กับ AZD?** เริ่มต้นด้วย [คู่มือเริ่มต้นใช้งาน](../../docs/chapter-01-foundation/azd-basics.md) ก่อน

## สถาปัตยกรรม

ตัวอย่างนี้ปรับใช้อินเทอร์เฟซสองชั้นโดยมีเว็บแอปและฐานข้อมูล SQL:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**การปรับใช้ทรัพยากร:**
- **กลุ่มทรัพยากร**: ตัวเก็บสำหรับทรัพยากรทั้งหมด
- **App Service Plan**: โฮสติ้งบน Linux (ระดับ B1 เพื่อประหยัดค่าใช้จ่าย)
- **เว็บแอป**: Runtime Python 3.11 พร้อมแอป Flask
- **SQL Server**: เซิร์ฟเวอร์ฐานข้อมูลที่จัดการ TLS 1.2 ขั้นต่ำ
- **SQL Database**: ระดับ Basic (2GB เหมาะกับการพัฒนา/ทดสอบ)
- **Application Insights**: การตรวจสอบและบันทึกข้อมูล
- **Log Analytics Workspace**: ศูนย์กลางเก็บบันทึก

**เปรียบเทียบ**: คิดว่านี่เหมือนร้านอาหาร (เว็บแอป) ที่มีช่องแช่แข็ง (ฐานข้อมูล) ลูกค้าสั่งจากเมนู (API endpoints) และครัว (แอป Flask) หาวัตถุดิบ (ข้อมูล) จากช่องแช่แข็ง ผู้จัดการร้าน (Application Insights) เฝ้าติดตามทุกอย่าง

## โครงสร้างโฟลเดอร์

ไฟล์ทั้งหมดรวมอยู่ในตัวอย่างนี้ — ไม่ต้องใช้ไลบรารีภายนอก:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**แต่ละไฟล์ทำหน้าที่:**
- **azure.yaml**: บอก AZD ว่าจะปรับใช้อะไรและที่ไหน
- **infra/main.bicep**: ควบคุมทรัพยากร Azure ทั้งหมด
- **infra/resources/*.bicep**: คำนิยามทรัพยากรเฉพาะ (โมดูลสำหรับนำกลับมาใช้ใหม่)
- **src/web/app.py**: แอป Flask พร้อมตรรกะฐานข้อมูล
- **requirements.txt**: ไลบรารีภาษา Python ที่ต้องการ
- **Dockerfile**: คำสั่งเตรียมคอนเทนเนอร์สำหรับปรับใช้

## เริ่มต้นอย่างรวดเร็ว (ทีละขั้นตอน)

### ขั้นตอนที่ 1: โคลนและไปยังโฟลเดอร์

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ ตรวจสอบความสำเร็จ**: ตรวจสอบว่าคุณเห็นไฟล์ `azure.yaml` และโฟลเดอร์ `infra/`:
```sh
ls
# ที่คาดไว้: README.md, azure.yaml, infra/, src/
```

### ขั้นตอนที่ 2: ลงชื่อเข้าใช้ Azure

```sh
azd auth login
```

จะเปิดเบราว์เซอร์เพื่อเข้าสู่ระบบ Azure ลงชื่อเข้าใช้ด้วยบัญชี Azure ของคุณ

**✓ ตรวจสอบความสำเร็จ**: คุณควรเห็น:
```
Logged in to Azure.
```

### ขั้นตอนที่ 3: เตรียมสภาพแวดล้อม

```sh
azd init
```

**สิ่งที่เกิดขึ้น**: AZD สร้างการตั้งค่าท้องถิ่นสำหรับการปรับใช้ของคุณ

**คำถามที่คุณจะเห็น**:
- **ชื่อสภาพแวดล้อม**: กรอกชื่อสั้นๆ (เช่น `dev`, `myapp`)
- **บัญชีผู้ใช้ Azure**: เลือกบัญชีของคุณจากรายการ
- **ที่ตั้ง Azure**: เลือกภูมิภาค (เช่น `eastus`, `westeurope`)

**✓ ตรวจสอบความสำเร็จ**: คุณควรเห็น:
```
SUCCESS: New project initialized!
```

### ขั้นตอนที่ 4: จัดเตรียมทรัพยากร Azure

```sh
azd provision
```

**สิ่งที่เกิดขึ้น**: AZD ปรับใช้โครงสร้างพื้นฐานทั้งหมด (ใช้เวลา 5-8 นาที):
1. สร้างกลุ่มทรัพยากร
2. สร้าง SQL Server และฐานข้อมูล
3. สร้าง App Service Plan
4. สร้างเว็บแอป
5. สร้าง Application Insights
6. กำหนดค่าการเชื่อมต่อเครือข่ายและความปลอดภัย

**คุณจะถูกถามหา**:
- **ชื่อผู้ดูแลระบบ SQL**: กรอกชื่อผู้ใช้ (เช่น `sqladmin`)
- **รหัสผ่านผู้ดูแลระบบ SQL**: กรอกรหัสผ่านที่แข็งแรง (บันทึกไว้!)

**✓ ตรวจสอบความสำเร็จ**: คุณควรเห็น:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ เวลา**: 5-8 นาที

### ขั้นตอนที่ 5: ปรับใช้แอปพลิเคชัน

```sh
azd deploy
```

**สิ่งที่เกิดขึ้น**: AZD สร้างและปรับใช้แอป Flask ของคุณ:
1. แพ็กเกจแอป Python
2. สร้างคอนเทนเนอร์ Docker
3. ส่งขึ้น Azure Web App
4. เริ่มต้นฐานข้อมูลด้วยข้อมูลตัวอย่าง
5. เริ่มแอปพลิเคชัน

**✓ ตรวจสอบความสำเร็จ**: คุณควรเห็น:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ เวลา**: 3-5 นาที

### ขั้นตอนที่ 6: เรียกดูแอปพลิเคชัน

```sh
azd browse
```

จะเปิดเว็บแอปที่ปรับใช้แล้วในเบราว์เซอร์ที่ URL `https://app-<unique-id>.azurewebsites.net`

**✓ ตรวจสอบความสำเร็จ**: คุณควรเห็นผลลัพธ์ JSON:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### ขั้นตอนที่ 7: ทดสอบจุดท้ายของ API

**ตรวจสุขภาพ** (ตรวจสอบการเชื่อมต่อฐานข้อมูล):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**ผลลัพธ์ที่คาดหวัง**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**แสดงรายการสินค้า** (ข้อมูลตัวอย่าง):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**ผลลัพธ์ที่คาดหวัง**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**ดูข้อมูลสินค้ารายตัว**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ ตรวจสอบความสำเร็จ**: ทุกจุดท้ายของ API ส่งคืนข้อมูล JSON โดยไม่มีข้อผิดพลาด

---

**🎉 ยินดีด้วย!** คุณได้ปรับใช้เว็บแอปพร้อมฐานข้อมูลไปยัง Azure โดยใช้ AZD สำเร็จแล้ว

## การตั้งค่าเชิงลึก

### ตัวแปรสภาพแวดล้อม

ความลับถูกจัดการอย่างปลอดภัยผ่านการตั้งค่า Azure App Service — **ไม่เคยฝังในโค้ดต้นทาง**

**ถูกตั้งค่าโดยอัตโนมัติจาก AZD**:
- `SQL_CONNECTION_STRING`: สตริงเชื่อมต่อฐานข้อมูลพร้อมข้อมูลรับรองเข้ารหัส
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: จุดเชื่อมต่อเทเลเมทรีสำหรับการตรวจสอบ
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: เปิดใช้งานการติดตั้งไลบรารีอัตโนมัติ

**ตำแหน่งเก็บความลับ**:
1. ในระหว่าง `azd provision` คุณให้ข้อมูลรับรอง SQL ผ่านคำถามแบบปลอดภัย
2. AZD เก็บไว้ในไฟล์ `.azure/<env-name>/.env` ในเครื่อง (ถูกละเว้นใน Git)
3. AZD ฉีดข้อมูลเหล่านี้เข้าไปในการตั้งค่า Azure App Service (เข้ารหัสเมื่อเก็บ)
4. แอปเรียกใช้งานผ่าน `os.getenv()` ขณะรันไทม์

### การพัฒนาท้องถิ่น

เพื่อทดสอบในเครื่อง สร้างไฟล์ `.env` จากตัวอย่าง:

```sh
cp .env.sample .env
# แก้ไข .env ด้วยการเชื่อมต่อฐานข้อมูลในเครื่องของคุณ
```

**เวิร์กโฟลว์การพัฒนาในเครื่อง**:
```sh
# ติดตั้งไลบรารีที่จำเป็น
cd src/web
pip install -r requirements.txt

# ตั้งค่าตัวแปรสภาพแวดล้อม
export SQL_CONNECTION_STRING="your-local-connection-string"

# รันแอปพลิเคชัน
python app.py
```

**ทดสอบในเครื่อง**:
```sh
curl http://localhost:8000/health
# คาดว่าจะเป็น: {"status": "healthy", "database": "connected"}
```

### โครงสร้างพื้นฐานเป็นโค้ด

ทรัพยากร Azure ทั้งหมดถูกกำหนดใน **เทมเพลต Bicep** (`infra/` โฟลเดอร์):

- **ออกแบบโมดูลาร์**: ประเภททรัพยากรแต่ละชนิดมีไฟล์ของตัวเองเพื่อให้ใช้ซ้ำได้
- **พารามิเตอร์ได้**: ปรับแต่ง SKU, ภูมิภาค, การตั้งชื่อได้
- **แนวทางปฏิบัติที่ดีที่สุด**: ปฏิบัติตามมาตรฐานการตั้งชื่อและความปลอดภัยของ Azure
- **ควบคุมเวอร์ชัน**: การเปลี่ยนแปลงโครงสร้างพื้นฐานถูกติดตามใน Git

**ตัวอย่างการปรับแต่ง**:
หากต้องการเปลี่ยนระดับฐานข้อมูลให้แก้ไขไฟล์ `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## แนวทางความปลอดภัยที่ดีที่สุด

ตัวอย่างนี้ปฏิบัติตามแนวทางความปลอดภัยของ Azure:

### 1. **ไม่เก็บความลับในโค้ดต้นทาง**
- ✅ ข้อมูลรับรองถูกเก็บในการตั้งค่า Azure App Service (เข้ารหัส)
- ✅ ไฟล์ `.env` ถูกละเว้นจาก Git ใน `.gitignore`
- ✅ ความลับถูกส่งผ่านพารามิเตอร์ปลอดภัยในขั้นตอนเตรียมทรัพยากร

### 2. **การเชื่อมต่อเข้ารหัส**
- ✅ TLS 1.2 ขั้นต่ำสำหรับ SQL Server
- ✅ บังคับใช้ HTTPS เท่านั้นสำหรับเว็บแอป
- ✅ การเชื่อมต่อฐานข้อมูลผ่านช่องทางเข้ารหัส

### 3. **ความปลอดภัยเครือข่าย**
- ✅ กำหนดไฟร์วอลล์ SQL Server ให้อนุญาตเฉพาะบริการ Azure
- ✅ จำกัดการเข้าถึงเครือข่ายสาธารณะ (สามารถล็อกเพิ่มเติมด้วย Private Endpoints)
- ✅ ปิดการใช้ FTPS บนเว็บแอป

### 4. **การตรวจสอบสิทธิ์และอนุญาต**
- ⚠️ **ปัจจุบัน**: ใช้การตรวจสอบสิทธิ์ SQL (ชื่อผู้ใช้/รหัสผ่าน)
- ✅ **แนะนำสำหรับโปรดักชัน**: ใช้ Managed Identity ของ Azure เพื่อการตรวจสอบสิทธิ์แบบไม่ใช้รหัสผ่าน

**วิธีอัพเกรดเป็น Managed Identity** (สำหรับโปรดักชัน):
1. เปิดใช้งาน managed identity บนเว็บแอป
2. มอบสิทธิ์ SQL ให้กับ identity
3. อัปเดตสตริงเชื่อมต่อให้ใช้ managed identity
4. ลบระบบตรวจสอบสิทธิ์แบบใช้รหัสผ่านออก

### 5. **ตรวจสอบและปฏิบัติตามข้อกำหนด**
- ✅ Application Insights บันทึกคำขอและข้อผิดพลาดทั้งหมด
- ✅ เปิดการตรวจสอบฐานข้อมูล SQL (สามารถตั้งค่าเพื่อให้เป็นไปตามข้อกำหนด)
- ✅ แท็กรายการทรัพยากรทั้งหมดเพื่อการบริหารจัดการ

**รายการตรวจสอบความปลอดภัยก่อนโปรดักชัน**:
- [ ] เปิด Azure Defender สำหรับ SQL
- [ ] กำหนดค่า Private Endpoints สำหรับ SQL Database
- [ ] เปิดใช้งาน Web Application Firewall (WAF)
- [ ] ใช้ Azure Key Vault สำหรับการหมุนเวียนความลับ
- [ ] กำหนดค่า Azure AD สำหรับการตรวจสอบสิทธิ์
- [ ] เปิดใช้งานการบันทึกวิเคราะห์สำหรับทรัพยากรทั้งหมด

## การเพิ่มประสิทธิภาพค่าใช้จ่าย

**ค่าใช้จ่ายรายเดือนโดยประมาณ** (ณ พฤศจิกายน 2025):

| ทรัพยากร | SKU/ระดับ | ค่าใช้จ่ายโดยประมาณ |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/เดือน |
| SQL Database | Basic (2GB) | ~$5/เดือน |
| Application Insights | จ่ายตามการใช้งาน | ~$2/เดือน (ปริมาณน้อย) |
| **รวม** | | **~$20/เดือน** |

**💡 เคล็ดลับประหยัดค่าใช้จ่าย**:

1. **ใช้ระดับฟรีเพื่อการเรียนรู้**:
   - App Service: ระดับ F1 (ฟรี, จำกัดชั่วโมง)
   - SQL Database: ใช้ Azure SQL Database serverless
   - Application Insights: ฟรี 5GB ต่อเดือน

2. **หยุดใช้งานทรัพยากรเมื่อไม่ใช้งาน**:
   ```sh
   # หยุดเว็บแอป (ฐานข้อมูลยังคงคิดค่าบริการ)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # เริ่มใหม่เมื่อต้องการ
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **ลบทุกอย่างหลังทดสอบเสร็จ**:
   ```sh
   azd down
   ```
   จะลบทรัพยากรทั้งหมดและหยุดค่าใช้จ่าย

4. **SKU สำหรับพัฒนาและโปรดักชัน**:
   - **พัฒนา**: ระดับ Basic (ใช้ในตัวอย่างนี้)
   - **โปรดักชัน**: ระดับ Standard/Premium พร้อมระบบสำรองข้อมูล

**การตรวจสอบค่าใช้จ่าย**:
- ดูค่าใช้จ่ายใน [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- ตั้งค่าการแจ้งเตือนค่าใช้จ่ายเพื่อป้องกันความประหลาดใจ
- แท็กรายการทรัพยากรด้วย `azd-env-name` เพื่อง่ายต่อการติดตาม

**ทางเลือกระดับฟรี**:
สำหรับการเรียนรู้ คุณสามารถแก้ไข `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**หมายเหตุ**: ระดับฟรีมีข้อจำกัด (CPU 60 นาที/วัน, ไม่มี always-on)

## การตรวจสอบและสังเกตการณ์

### การรวม Application Insights

ตัวอย่างนี้รวม **Application Insights** สำหรับการตรวจสอบแบบครบวงจร:

**ข้อมูลที่ตรวจสอบ**:
- ✅ คำขอ HTTP (ความหน่วง, รหัสสถานะ, จุดท้าย)
- ✅ ข้อผิดพลาดและข้อยกเว้นของแอปพลิเคชัน
- ✅ การบันทึกแบบกำหนดเองจากแอป Flask
- ✅ สุขภาพการเชื่อมต่อฐานข้อมูล
- ✅ เมตริกประสิทธิภาพ (CPU, หน่วยความจำ)

**วิธีเข้าถึง Application Insights**:
1. เปิด [Azure Portal](https://portal.azure.com)
2. ไปยังกลุ่มทรัพยากรของคุณ (`rg-<env-name>`)
3. คลิกที่ทรัพยากร Application Insights (`appi-<unique-id>`)

**คำสั่งค้นหาใช้งานบ่อย** (Application Insights → Logs):

**ดูคำขอทั้งหมด**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**ค้นหาข้อผิดพลาด**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**ตรวจสอบสุขภาพที่ Endpoint**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### การตรวจสอบ SQL Database

**เปิดใช้งานการตรวจสอบฐานข้อมูล SQL** เพื่อบันทึก:
- รูปแบบการเข้าถึงฐานข้อมูล
- ความพยายามเข้าสู่ระบบที่ล้มเหลว
- การเปลี่ยนแปลงโครงสร้าง
- การเข้าถึงข้อมูล (เพื่อการปฏิบัติตามข้อกำหนด)

**วิธีเข้าถึงบันทึกการตรวจสอบ**:
1. ไปที่ Azure Portal → SQL Database → การตรวจสอบ
2. ดูบันทึกใน Log Analytics workspace

### การตรวจสอบแบบเรียลไทม์

**ดูเมตริกสด**:
1. Application Insights → Live Metrics
2. ดูคำขอ, ข้อผิดพลาด และประสิทธิภาพแบบเรียลไทม์

**ตั้งค่าการแจ้งเตือน**:
สร้างการแจ้งเตือนสำหรับเหตุการณ์สำคัญ:
- HTTP 500 errors > 5 ครั้ง ภายใน 5 นาที
- ความล้มเหลวในการเชื่อมต่อฐานข้อมูล
- เวลาตอบกลับสูง (>2 วินาที)

**ตัวอย่างการสร้างการแจ้งเตือน**:  
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```
  
## การแก้ไขปัญหา

### ปัญหาทั่วไปและแนวทางแก้ไข

#### 1. `azd provision` ล้มเหลวพร้อมข้อความ "Location not available"

**อาการ**:  
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```
  
**แนวทางแก้ไข**:  
เลือกภูมิภาค Azure ที่แตกต่างหรือทำการลงทะเบียนผู้ให้บริการทรัพยากร:  
```sh
az provider register --namespace Microsoft.Insights
```
  
#### 2. การเชื่อมต่อ SQL ล้มเหลวระหว่างการปรับใช้

**อาการ**:  
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```
  
**แนวทางแก้ไข**:  
- ตรวจสอบว่าไฟร์วอลล์ SQL Server อนุญาตให้บริการ Azure (กำหนดค่าโดยอัตโนมัติ)  
- ตรวจสอบรหัสผ่านผู้ดูแลระบบ SQL ที่ป้อนในระหว่าง `azd provision` ว่าถูกต้อง  
- ตรวจสอบให้แน่ใจว่า SQL Server ถูกจัดสรรเต็มที่แล้ว (อาจใช้เวลาประมาณ 2-3 นาที)

**ตรวจสอบการเชื่อมต่อ**:  
```sh
# จาก Azure Portal ไปที่ SQL Database → ตัวแก้ไขคำสั่ง
# ลองเชื่อมต่อด้วยข้อมูลประจำตัวของคุณ
```
  
#### 3. เว็บแอปแสดงข้อความ "Application Error"

**อาการ**:  
เบราว์เซอร์แสดงหน้าข้อผิดพลาดทั่วไป

**แนวทางแก้ไข**:  
ตรวจสอบบันทึกแอปพลิเคชัน:  
```sh
# ดูบันทึกล่าสุด
az webapp log tail --name <app-name> --resource-group <rg-name>
```
  
**สาเหตุทั่วไป**:  
- ตัวแปรสภาพแวดล้อมหายไป (ตรวจสอบที่ App Service → Configuration)  
- การติดตั้งแพ็กเกจ Python ล้มเหลว (ตรวจสอบบันทึกการปรับใช้)  
- ข้อผิดพลาดในการเริ่มต้นฐานข้อมูล (ตรวจสอบการเชื่อมต่อ SQL)

#### 4. `azd deploy` ล้มเหลวพร้อมข้อความ "Build Error"

**อาการ**:  
```
Error: Failed to build project
```
  
**แนวทางแก้ไข**:  
- ตรวจสอบว่า `requirements.txt` ไม่มีข้อผิดพลาดทางไวยากรณ์  
- ตรวจสอบว่า Python 3.11 ถูกกำหนดใน `infra/resources/web-app.bicep`  
- ตรวจสอบ Dockerfile ว่าภาพฐานถูกต้อง

**ดีบักในเครื่อง**:  
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```
  
#### 5. "Unauthorized" เมื่อรันคำสั่ง AZD

**อาการ**:  
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```
  
**แนวทางแก้ไข**:  
เข้าสู่ระบบ Azure ใหม่:  
```sh
azd auth login
az login
```
  
ตรวจสอบว่าคุณมีสิทธิ์ถูกต้อง (บทบาท Contributor) ในการสมัครสมาชิก

#### 6. ค่าใช้จ่ายฐานข้อมูลสูง

**อาการ**:  
ใบแจ้งหนี้ Azure ที่ไม่คาดคิด

**แนวทางแก้ไข**:  
- ตรวจสอบว่าคุณไม่ลืมรัน `azd down` หลังจากทดสอบ  
- ตรวจสอบว่า SQL Database ใช้ชั้น Basic (ไม่ใช่ Premium)  
- ตรวจสอบค่าใช้จ่ายใน Azure Cost Management  
- ตั้งค่าการแจ้งเตือนค่าใช้จ่าย

### ขอความช่วยเหลือ

**ดูตัวแปรสภาพแวดล้อม AZD ทั้งหมด**:  
```sh
azd env get-values
```
  
**ตรวจสอบสถานะการปรับใช้**:  
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```
  
**เข้าถึงบันทึกแอปพลิเคชัน**:  
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```
  
**ต้องการความช่วยเหลือเพิ่มเติม?**  
- [คู่มือแก้ไขปัญหา AZD](../../docs/chapter-07-troubleshooting/common-issues.md)  
- [แก้ไขปัญหา Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)  
- [แก้ไขปัญหา Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## แบบฝึกหัดปฏิบัติ

### แบบฝึกหัด 1: ตรวจสอบการปรับใช้ของคุณ (ระดับเริ่มต้น)

**เป้าหมาย**: ยืนยันว่าแหล่งข้อมูลทั้งหมดถูกปรับใช้และแอปพลิเคชันทำงานได้

**ขั้นตอน**:  
1. แสดงรายการแหล่งข้อมูลทั้งหมดในกลุ่มทรัพยากรของคุณ:  
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **ที่คาดหวัง**: 6-7 แหล่งข้อมูล (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. ทดสอบทุกจุดปลาย API:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **ที่คาดหวัง**: ทุกจุดปลายส่งคืน JSON ที่ถูกต้องโดยไม่มีข้อผิดพลาด

3. ตรวจสอบ Application Insights:  
   - ไปที่ Application Insights ใน Azure Portal  
   - ไปที่ "Live Metrics"  
   - รีเฟรชเบราว์เซอร์ของคุณที่เว็บแอป  
   **ที่คาดหวัง**: เห็นคำขอปรากฏในเวลาจริง

**เกณฑ์ความสำเร็จ**: มีแหล่งข้อมูลครบ 6-7 แห่ง, ทุกจุดปลายส่งคืนข้อมูล, Live Metrics แสดงกิจกรรม

---

### แบบฝึกหัด 2: เพิ่มจุดปลาย API ใหม่ (ระดับกลาง)

**เป้าหมาย**: ขยายแอป Flask ด้วยจุดปลายใหม่

**โค้ดเริ่มต้น**: จุดปลายปัจจุบันใน `src/web/app.py`

**ขั้นตอน**:  
1. แก้ไข `src/web/app.py` และเพิ่มจุดปลายใหม่หลังฟังก์ชัน `get_product()`:  
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```
  
2. ปรับใช้แอปพลิเคชันที่อัปเดต:  
   ```sh
   azd deploy
   ```
  
3. ทดสอบจุดปลายใหม่:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **ที่คาดหวัง**: ส่งคืนผลิตภัณฑ์ที่ตรงกับคำว่า "laptop"

**เกณฑ์ความสำเร็จ**: จุดปลายใหม่ทำงาน, ส่งคืนผลกรอง, ปรากฏในบันทึก Application Insights

---

### แบบฝึกหัด 3: เพิ่มการตรวจสอบและการแจ้งเตือน (ระดับสูง)

**เป้าหมาย**: ตั้งค่าการตรวจสอบโดยเชิงรุกพร้อมแจ้งเตือน

**ขั้นตอน**:  
1. สร้างการแจ้งเตือนสำหรับข้อผิดพลาด HTTP 500:  
   ```sh
   # ดึงทรัพยากร Application Insights ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # สร้างการแจ้งเตือน
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```
  
2. เรียกใช้งานการแจ้งเตือนโดยสร้างข้อผิดพลาด:  
   ```sh
   # ขอสินค้าที่ไม่มีอยู่
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```
  
3. ตรวจสอบว่าการแจ้งเตือนทำงาน:  
   - Azure Portal → Alerts → Alert Rules  
   - ตรวจสอบอีเมลของคุณ (ถ้าตั้งค่าไว้)

**เกณฑ์ความสำเร็จ**: สร้างกฎแจ้งเตือน, ทริกเกอร์เมื่อเกิดข้อผิดพลาด, รับการแจ้งเตือน

---

### แบบฝึกหัด 4: การเปลี่ยนแปลงโครงสร้างฐานข้อมูล (ระดับสูง)

**เป้าหมาย**: เพิ่มตารางใหม่และปรับแอปพลิเคชันให้ใช้ตารางนี้

**ขั้นตอน**:  
1. เชื่อมต่อกับ SQL Database ผ่าน Azure Portal Query Editor

2. สร้างตาราง `categories` ใหม่:  
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```
  
3. ปรับปรุง `src/web/app.py` ให้รวมข้อมูลหมวดหมู่ในคำตอบ

4. ปรับใช้และทดสอบ

**เกณฑ์ความสำเร็จ**: ตารางใหม่มีอยู่, ผลิตภัณฑ์แสดงข้อมูลหมวดหมู่, แอปพลิเคชันยังทำงานได้

---

### แบบฝึกหัด 5: ใช้การแคช (ระดับเชี่ยวชาญ)

**เป้าหมาย**: เพิ่ม Azure Redis Cache เพื่อปรับปรุงประสิทธิภาพ

**ขั้นตอน**:  
1. เพิ่ม Redis Cache ใน `infra/main.bicep`  
2. ปรับปรุง `src/web/app.py` เพื่อแคชการค้นหาผลิตภัณฑ์  
3. วัดการปรับปรุงประสิทธิภาพด้วย Application Insights  
4. เปรียบเทียบเวลาตอบสนองก่อน/หลังแคช

**เกณฑ์ความสำเร็จ**: Redis ถูกปรับใช้, แคชทำงาน, เวลาตอบสนองดีขึ้น >50%

**คำแนะนำ**: เริ่มต้นด้วย [เอกสาร Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/)

---

## การทำความสะอาด

เพื่อหลีกเลี่ยงค่าใช้จ่ายต่อเนื่อง ให้ลบแหล่งข้อมูลทั้งหมดเมื่อเสร็จสิ้น:  

```sh
azd down
```
  
**พร้อมท์การยืนยัน**:  
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```
  
พิมพ์ `y` เพื่อยืนยัน

**✓ ตรวจสอบความสำเร็จ**:  
- แหล่งข้อมูลทั้งหมดถูกลบจาก Azure Portal  
- ไม่มีค่าใช้จ่ายต่อเนื่อง  
- โฟลเดอร์ `.azure/<env-name>` บนเครื่องสามารถลบได้

**ทางเลือก** (เก็บโครงสร้างพื้นฐาน, ลบข้อมูล):  
```sh
# ลบเฉพาะกลุ่มทรัพยากร (เก็บการตั้งค่า AZD ไว้)
az group delete --name rg-<env-name> --yes
```
  
## เรียนรู้เพิ่มเติม

### เอกสารที่เกี่ยวข้อง  
- [เอกสาร Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [เอกสาร Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)  
- [เอกสาร Azure App Service](https://learn.microsoft.com/azure/app-service/)  
- [เอกสาร Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)  
- [เอกสารภาษา Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### ขั้นตอนถัดไปในหลักสูตรนี้  
- **[ตัวอย่าง Container Apps](../../../../examples/container-app)**: ปรับใช้ไมโครเซอร์วิสด้วย Azure Container Apps  
- **[คู่มือการผนวก AI](../../../../docs/ai-foundry)**: เพิ่มความสามารถ AI ในแอปของคุณ  
- **[แนวทางปฏิบัติที่ดีที่สุดในการปรับใช้](../../docs/chapter-04-infrastructure/deployment-guide.md)**: รูปแบบการปรับใช้ในสภาพแวดล้อมจริง

### หัวข้อขั้นสูง  
- **Managed Identity**: ลบรหัสผ่านและใช้การรับรองความถูกต้องของ Azure AD  
- **Private Endpoints**: รักษาความปลอดภัยการเชื่อมต่อฐานข้อมูลภายในเครือข่ายเสมือน  
- **การผนวก CI/CD**: ทำให้งานปรับใช้เป็นอัตโนมัติด้วย GitHub Actions หรือ Azure DevOps  
- **หลายสภาพแวดล้อม**: ตั้งค่าสภาพแวดล้อม dev, staging, และ production  
- **การย้ายฐานข้อมูล**: ใช้ Alembic หรือ Entity Framework สำหรับการจัดการเวอร์ชันสกีมา

### การเปรียบเทียบกับวิธีการอื่น ๆ

**AZD เทียบกับ ARM Templates**:  
- ✅ AZD: ระดับนามธรรมสูงกว่า, คำสั่งง่ายกว่า  
- ⚠️ ARM: รายละเอียดมากกว่า, ควบคุมละเอียด

**AZD เทียบกับ Terraform**:  
- ✅ AZD: เป็น Azure เนทีฟ, รวมกับบริการ Azure  
- ⚠️ Terraform: รองรับหลายคลาวด์, ระบบนิเวศใหญ่กว่า

**AZD เทียบกับ Azure Portal**:  
- ✅ AZD: ทำซ้ำได้, ควบคุมเวอร์ชัน, อัตโนมัติได้  
- ⚠️ Portal: คลิกด้วยมือ, ยากต่อการทำซ้ำ

**คิดถึง AZD เหมือน**: Docker Compose สำหรับ Azure—กำหนดค่าที่ง่ายขึ้นสำหรับการปรับใช้ที่ซับซ้อน

---

## คำถามที่พบบ่อย

**ถาม: ฉันใช้ภาษาโปรแกรมอื่นได้ไหม?**  
ตอบ: ได้! แทนที่ `src/web/` ด้วย Node.js, C#, Go หรือภาษาใดก็ได้ ปรับ `azure.yaml` และ Bicep ตามนั้น

**ถาม: จะเพิ่มฐานข้อมูลได้อย่างไร?**  
ตอบ: เพิ่มโมดูล SQL Database อีกอันใน `infra/main.bicep` หรือใช้ PostgreSQL/MySQL จากบริการฐานข้อมูล Azure

**ถาม: ฉันใช้สิ่งนี้ใน production ได้ไหม?**  
ตอบ: นี่เป็นจุดเริ่มต้น สำหรับ production ให้เพิ่ม: managed identity, private endpoints, redundancy, กลยุทธ์สำรองข้อมูล, WAF, และการตรวจสอบขั้นสูง

**ถาม: ถ้าฉันต้องการใช้คอนเทนเนอร์แทนการปรับใช้โค้ดล่ะ?**  
ตอบ: ดูตัวอย่าง [Container Apps](../../../../examples/container-app) ที่ใช้คอนเทนเนอร์ Docker ตลอด

**ถาม: ฉันจะเชื่อมต่อกับฐานข้อมูลจากเครื่องท้องถิ่นได้อย่างไร?**  
ตอบ: เพิ่ม IP ของคุณในไฟร์วอลล์ SQL Server:  
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```
  
**ถาม: ฉันจะใช้ฐานข้อมูลที่มีอยู่แทนการสร้างใหม่ได้ไหม?**  
ตอบ: ได้ ปรับ `infra/main.bicep` ให้เชื่อมต่อกับ SQL Server ที่มีอยู่แล้วและแก้ไขพารามิเตอร์สตริงการเชื่อมต่อ

---

> **หมายเหตุ:** ตัวอย่างนี้แสดงแนวทางปฏิบัติที่ดีที่สุดสำหรับการปรับใช้เว็บแอปพร้อมฐานข้อมูลใช้ AZD รวมโค้ดที่ใช้งานได้ เอกสารครบถ้วน และแบบฝึกหัดปฏิบัติเพื่อเสริมการเรียนรู้ สำหรับการปรับใช้ production ให้พิจารณาความปลอดภัย การปรับสเกล การปฏิบัติตามข้อกำหนด และต้นทุนเฉพาะองค์กรของคุณ

**📚 การนำทางหลักสูตร:**  
- ← ก่อนหน้า: [ตัวอย่าง Container Apps](../../../../examples/container-app)  
- → ถัดไป: [คู่มือการผนวก AI](../../../../docs/ai-foundry)  
- 🏠 [หน้าหลักหลักสูตร](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้มีความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อน เอกสารต้นฉบับในภาษาต้นทางถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่มีความสำคัญ ขอแนะนำให้ใช้การแปลโดยผู้เชี่ยวชาญมนุษย์ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->