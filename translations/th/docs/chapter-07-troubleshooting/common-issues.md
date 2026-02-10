# ปัญหาทั่วไปและวิธีแก้ไข

**การนำทางบท:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ไขปัญหาและการดีบัก
- **⬅️ บทก่อนหน้า**: [บทที่ 6: การตรวจสอบก่อนการปรับใช้](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ ถัดไป**: [คู่มือการดีบัก](debugging.md)
- **🚀 บทถัดไป**: [บทที่ 8: รูปแบบการใช้งานใน Production และระดับองค์กร](../chapter-08-production/production-ai-practices.md)

## บทนำ

คู่มือการแก้ไขปัญหาโดยละเอียดนี้ครอบคลุมปัญหาที่พบบ่อยที่สุดเมื่อใช้ Azure Developer CLI เรียนรู้วิธีการวินิจฉัย แก้ไขปัญหา และแก้ไขปัญหาทั่วไปเกี่ยวกับการยืนยันตัวตน การปรับใช้ การจัดเตรียมโครงสร้างพื้นฐาน และการกำหนดค่าแอปพลิเคชัน แต่ละปัญหาระบุอาการ สาเหตุหลัก และขั้นตอนการแก้ไขทีละขั้นตอนอย่างละเอียด

## เป้าหมายการเรียนรู้

โดยการทำคู่มือนี้ให้เสร็จคุณจะ:
- ชำนาญเทคนิคการวินิจฉัยสำหรับปัญหา Azure Developer CLI
- เข้าใจปัญหาการยืนยันตัวตนและสิทธิ์ที่พบบ่อยรวมทั้งวิธีแก้ไข
- แก้ไขความล้มเหลวในการปรับใช้ ข้อผิดพลาดการจัดเตรียมโครงสร้างพื้นฐาน และปัญหาการกำหนดค่า
- นำกลยุทธ์การตรวจสอบและการดีบักเชิงรุกไปใช้
- ประยุกต์ใช้วิธีการแก้ไขปัญหาอย่างเป็นระบบสำหรับปัญหาที่ซับซ้อน
- กำหนดค่าการบันทึกและการตรวจสอบที่เหมาะสมเพื่อป้องกันปัญหาในอนาคต

## ผลลัพธ์การเรียนรู้

เมื่อเสร็จสิ้น คุณจะสามารถ:
- วินิจฉัยปัญหา Azure Developer CLI โดยใช้เครื่องมือวินิจฉัยในตัว
- แก้ไขปัญหาการยืนยันตัวตน การสมัครใช้งาน และสิทธิ์ด้วยตนเอง
- แก้ไขความล้มเหลวในการปรับใช้และข้อผิดพลาดการจัดเตรียมโครงสร้างพื้นฐานอย่างมีประสิทธิภาพ
- ดีบักปัญหาการกำหนดค่าแอปพลิเคชันและปัญหาเฉพาะสภาพแวดล้อม
- นำการตรวจสอบและการแจ้งเตือนไปใช้เพื่อตรวจจับปัญหาเชิงรุก
- ประยุกต์ใช้แนวปฏิบัติที่ดีที่สุดสำหรับการบันทึก การดีบัก และกระบวนการแก้ไขปัญหา

## การวินิจฉัยอย่างรวดเร็ว

ก่อนดำดิ่งสู่ปัญหาเฉพาะ ให้รันคำสั่งเหล่านี้เพื่อรวบรวมข้อมูลการวินิจฉัย:

```bash
# ตรวจสอบเวอร์ชันและสถานะของ azd
azd version
azd config list

# ตรวจสอบการยืนยันตัวตนของ Azure
az account show
az account list

# ตรวจสอบสภาพแวดล้อมปัจจุบัน
azd env show
azd env get-values

# เปิดการบันทึกการดีบัก
export AZD_DEBUG=true
azd <command> --debug
```

## ปัญหาเรื่องการยืนยันตัวตน

### ปัญหา: "Failed to get access token"
**อาการ:**
- `azd up` ล้มเหลวด้วยข้อผิดพลาดการตรวจสอบสิทธิ์
- คำสั่งคืนค่า "unauthorized" หรือ "access denied"

**วิธีแก้ไข:**
```bash
# 1. ลงชื่อเข้าใช้ใหม่ด้วย Azure CLI
az login
az account show

# 2. ล้างข้อมูลรับรองที่แคชไว้
az account clear
az login

# 3. ใช้การยืนยันด้วยรหัสอุปกรณ์ (สำหรับระบบแบบไม่มีส่วนต่อประสานผู้ใช้)
az login --use-device-code

# 4. ตั้งค่าการสมัครใช้งานอย่างชัดเจน
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ปัญหา: "Insufficient privileges" ระหว่างการปรับใช้
**อาการ:**
- การปรับใช้ล้มเหลวพร้อมข้อผิดพลาดเกี่ยวกับสิทธิ์
- ไม่สามารถสร้างทรัพยากร Azure บางประเภทได้

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบการมอบหมายบทบาท (role assignments) ใน Azure ของคุณ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ตรวจให้แน่ใจว่าคุณมีบทบาทที่จำเป็น
# - Contributor (สำหรับการสร้างทรัพยากร)
# - User Access Administrator (สำหรับการมอบหมายบทบาท)

# 3. ติดต่อผู้ดูแลระบบ Azure ของคุณเพื่อขอสิทธิ์ที่เหมาะสม
```

### ปัญหา: ปัญหาการยืนยันตัวตนแบบหลายเทนแนนท์
**วิธีแก้ไข:**
```bash
# 1. ลงชื่อเข้าใช้ด้วยผู้เช่าที่ระบุ
az login --tenant "your-tenant-id"

# 2. ตั้งค่าผู้เช่าในการกำหนดค่า
azd config set auth.tenantId "your-tenant-id"

# 3. ล้างแคชของผู้เช่าเมื่อเปลี่ยนผู้เช่า
az account clear
```

## 🏗️ ข้อผิดพลาดในการจัดเตรียมโครงสร้างพื้นฐาน

### ปัญหา: การขัดกันของชื่อทรัพยากร
**อาการ:**
- ข้อผิดพลาด "The resource name already exists"
- การปรับใช้ล้มเหลวระหว่างการสร้างทรัพยากร

**วิธีแก้ไข:**
```bash
# 1. ใช้ชื่อทรัพยากรที่ไม่ซ้ำกันโดยใช้โทเค็น
# ในเทมเพลต Bicep ของคุณ:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. เปลี่ยนชื่อสภาพแวดล้อม
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ลบทรัพยากรที่มีอยู่
azd down --force --purge
```

### ปัญหา: พื้นที่/ภูมิภาคไม่พร้อมใช้งาน
**อาการ:**
- ข้อความ "The location 'xyz' is not available for resource type"
- SKU บางตัวไม่พร้อมใช้งานในภูมิภาคที่เลือก

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบตำแหน่งที่มีให้บริการสำหรับประเภทของทรัพยากร
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. ใช้ภูมิภาคที่มีให้บริการทั่วไป
azd config set defaults.location eastus2
# หรือ
azd env set AZURE_LOCATION eastus2

# 3. ตรวจสอบความพร้อมใช้งานของบริการตามภูมิภาค
# เยี่ยมชม: https://azure.microsoft.com/global-infrastructure/services/
```

### ปัญหา: เกินโควต้า
**อาการ:**
- ข้อความ "Quota exceeded for resource type"
- "Maximum number of resources reached"

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบการใช้งานโควต้าปัจจุบัน
az vm list-usage --location eastus2 -o table

# 2. ขอเพิ่มโควต้าผ่านพอร์ทัล Azure
# ไปที่: การสมัครใช้งาน > การใช้งาน + โควต้า

# 3. ใช้ SKU ขนาดเล็กกว่าในการพัฒนา
# ใน main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. ลบทรัพยากรที่ไม่ได้ใช้งาน
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ปัญหา: ข้อผิดพลาดเทมเพลต Bicep
**อาการ:**
- การตรวจสอบความถูกต้องของเทมเพลตล้มเหลว
- ข้อผิดพลาดไวยากรณ์ในไฟล์ Bicep

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบไวยากรณ์ของ Bicep
az bicep build --file infra/main.bicep

# 2. ใช้ linter ของ Bicep
az bicep lint --file infra/main.bicep

# 3. ตรวจสอบไวยากรณ์ของไฟล์พารามิเตอร์
cat infra/main.parameters.json | jq '.'

# 4. ดูตัวอย่างการเปลี่ยนแปลงก่อนการปรับใช้
azd provision --preview
```

## 🚀 ความล้มเหลวในการปรับใช้

### ปัญหา: การสร้างล้มเหลว
**อาการ:**
- แอปพลิเคชันสร้างไม่ผ่านระหว่างการปรับใช้
- ข้อผิดพลาดการติดตั้งแพ็กเกจ

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบผลลัพธ์การสร้างด้วยแฟลกดีบัก
azd deploy --service web --debug

# 2. ดูสถานะบริการที่ปรับใช้แล้ว
azd show

# 3. ทดสอบการสร้างในเครื่องท้องถิ่น
cd src/web
npm install
npm run build

# 3. ตรวจสอบความเข้ากันได้ของเวอร์ชัน Node.js/Python
node --version  # ควรตรงกับการตั้งค่าใน azure.yaml
python --version

# 4. ล้างแคชการสร้าง
rm -rf node_modules package-lock.json
npm install

# 5. ตรวจสอบ Dockerfile หากใช้คอนเทนเนอร์
docker build -t test-image .
docker run --rm test-image
```

### ปัญหา: การปรับใช้คอนเทนเนอร์ล้มเหลว
**อาการ:**
- Container app เริ่มทำงานไม่ได้
- ข้อผิดพลาดดึงอิมเมจ

**วิธีแก้ไข:**
```bash
# 1. ทดสอบการสร้างอิมเมจ Docker ในเครื่อง
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. ตรวจสอบล็อกของคอนเทนเนอร์โดยใช้ Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. ติดตามแอปผ่าน azd
azd monitor --logs

# 3. ยืนยันการเข้าถึงรีจิสทรีคอนเทนเนอร์
az acr login --name myregistry

# 4. ตรวจสอบการตั้งค่าของแอปคอนเทนเนอร์
az containerapp show --name my-app --resource-group my-rg
```

### ปัญหา: การเชื่อมต่อฐานข้อมูลล้มเหลว
**อาการ:**
- แอปไม่สามารถเชื่อมต่อกับฐานข้อมูลได้
- ข้อผิดพลาดการหมดเวลาในการเชื่อมต่อ

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบกฎไฟร์วอลล์ของฐานข้อมูล
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. ทดสอบการเชื่อมต่อจากแอปพลิเคชัน
# เพิ่มเข้าไปในแอปของคุณชั่วคราว:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. ตรวจสอบรูปแบบสตริงการเชื่อมต่อ
azd env get-values | grep DATABASE

# 4. ตรวจสอบสถานะเซิร์ฟเวอร์ฐานข้อมูล
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ปัญหาการกำหนดค่า

### ปัญหา: ตัวแปรสภาพแวดล้อมไม่ทำงาน
**อาการ:**
- แอปอ่านค่าการกำหนดค่าไม่ได้
- ตัวแปรสภาพแวดล้อมปรากฏว่าว่าง

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบว่าตัวแปรแวดล้อมถูกตั้งค่าไว้
azd env get-values
azd env get DATABASE_URL

# 2. ตรวจสอบชื่อของตัวแปรในไฟล์ azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. รีสตาร์ทแอปพลิเคชัน
azd deploy --service web

# 4. ตรวจสอบการกำหนดค่าบริการแอป
az webapp config appsettings list --name myapp --resource-group myrg
```

### ปัญหา: ปัญหาใบรับรอง SSL/TLS
**อาการ:**
- HTTPS ใช้งานไม่ได้
- ข้อผิดพลาดการตรวจสอบความถูกต้องของใบรับรอง

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบสถานะใบรับรอง SSL
az webapp config ssl list --resource-group myrg

# 2. เปิดใช้งานเฉพาะ HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. เพิ่มโดเมนที่กำหนดเอง (ถ้าจำเป็น)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ปัญหา: ปัญหาการกำหนดค่า CORS
**อาการ:**
- ส่วนหน้าหา API ไม่เจอ
- คำขอข้ามต้นทางถูกบล็อก

**วิธีแก้ไข:**
```bash
# 1. กำหนดค่า CORS สำหรับ App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. อัปเดต API เพื่อจัดการ CORS
# ใน Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. ตรวจสอบว่ากำลังรันบน URL ที่ถูกต้องหรือไม่
azd show
```

## 🌍 ปัญหาการจัดการสภาพแวดล้อม

### ปัญหา: ปัญหาการสลับสภาพแวดล้อม
**อาการ:**
- ใช้สภาพแวดล้อมผิด
- การกำหนดค่าไม่สลับอย่างถูกต้อง

**วิธีแก้ไข:**
```bash
# 1. แสดงรายการสภาพแวดล้อมทั้งหมด
azd env list

# 2. เลือกสภาพแวดล้อมอย่างชัดเจน
azd env select production

# 3. ตรวจสอบสภาพแวดล้อมปัจจุบัน
azd env show

# 4. สร้างสภาพแวดล้อมใหม่หากเสียหาย
azd env new production-new
azd env select production-new
```

### ปัญหา: การเสียหายของสภาพแวดล้อม
**อาการ:**
- สภาพแวดล้อมแสดงสถานะไม่ถูกต้อง
- ทรัพยากรไม่ตรงกับการกำหนดค่า

**วิธีแก้ไข:**
```bash
# 1. รีเฟรชสถานะของสภาพแวดล้อม
azd env refresh

# 2. รีเซ็ตการกำหนดค่าสภาพแวดล้อม
azd env new production-reset
# คัดลอกตัวแปรสภาพแวดล้อมที่จำเป็น
azd env set DATABASE_URL "your-value"

# 3. นำเข้าทรัพยากรที่มีอยู่ (ถ้าเป็นไปได้)
# อัปเดตไฟล์ .azure/production/config.json ด้วยตนเองโดยใส่รหัสทรัพยากร
```

## 🔍 ปัญหาด้านประสิทธิภาพ

### ปัญหา: เวลาในการปรับใช้ช้า
**อาการ:**
- การปรับใช้ใช้เวลานานเกินไป
- หมดเวลาในระหว่างการปรับใช้

**วิธีแก้ไข:**
```bash
# 1. ปรับใช้บริการเฉพาะเพื่อการพัฒนาที่เร็วขึ้น
azd deploy --service web
azd deploy --service api

# 2. ใช้การปรับใช้เฉพาะโค้ดเมื่อโครงสร้างพื้นฐานไม่เปลี่ยนแปลง
azd deploy  # เร็วกว่าคำสั่ง azd up

# 3. ปรับปรุงกระบวนการสร้าง
# ในไฟล์ package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. ตรวจสอบตำแหน่งของทรัพยากร (ใช้ภูมิภาคเดียวกัน)
azd config set defaults.location eastus2
```

### ปัญหา: ปัญหาประสิทธิภาพของแอปพลิเคชัน
**อาการ:**
- เวลาตอบสนองช้า
- การใช้งานทรัพยากรสูง

**วิธีแก้ไข:**
```bash
# 1. ขยายทรัพยากร
# อัปเดต SKU ใน main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. เปิดใช้งานการตรวจสอบของ Application Insights
azd monitor --overview

# 3. ตรวจสอบล็อกของแอปพลิเคชันใน Azure
az webapp log tail --name myapp --resource-group myrg
# หรือสำหรับ Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. นำระบบแคชไปใช้
# เพิ่ม Redis cache ลงในโครงสร้างพื้นฐานของคุณ
```

## 🛠️ เครื่องมือและคำสั่งสำหรับการแก้ไขปัญหา

### คำสั่งดีบัก
```bash
# การดีบักอย่างครอบคลุม
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# ตรวจสอบเวอร์ชันของ azd
azd version

# ดูการกำหนดค่าปัจจุบัน
azd config list

# ทดสอบการเชื่อมต่อ
curl -v https://myapp.azurewebsites.net/health
```

### การวิเคราะห์บันทึก
```bash
# บันทึกแอปพลิเคชันผ่าน Azure CLI
az webapp log tail --name myapp --resource-group myrg

# ตรวจสอบแอปพลิเคชันด้วย azd
azd monitor --logs
azd monitor --live

# บันทึกทรัพยากร Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# บันทึกคอนเทนเนอร์ (สำหรับ Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### การตรวจสอบทรัพยากร
```bash
# แสดงรายการทรัพยากรทั้งหมด
az resource list --resource-group myrg -o table

# ตรวจสอบสถานะทรัพยากร
az webapp show --name myapp --resource-group myrg --query state

# การวินิจฉัยเครือข่าย
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 ขอความช่วยเหลือเพิ่มเติม

### เมื่อใดควรยกระดับปัญหา
- ปัญหาการยืนยันตัวตนยังคงอยู่หลังจากลองวิธีทั้งหมดแล้ว
- ปัญหาโครงสร้างพื้นฐานที่เกี่ยวข้องกับบริการของ Azure
- ปัญหาเกี่ยวกับการเรียกเก็บเงินหรือการสมัครใช้งาน
- ข้อกังวลด้านความปลอดภัยหรือเหตุการณ์ความปลอดภัย

### ช่องทางการสนับสนุน
```bash
# 1. ตรวจสอบสถานะการให้บริการของ Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. สร้างคำขอการสนับสนุนของ Azure
# ไปที่: https://portal.azure.com -> ช่วยเหลือ + การสนับสนุน

# 3. ทรัพยากรชุมชน
# - Stack Overflow: แท็ก azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### ข้อมูลที่ต้องรวบรวม
ก่อนติดต่อฝ่ายสนับสนุน ให้รวบรวม:
- ผลลัพธ์ของ `azd version`
- ผลลัพธ์ของ `azd config list`
- ผลลัพธ์ของ `azd show` (สถานะการปรับใช้ปัจจุบัน)
- ข้อความข้อผิดพลาด (ข้อความเต็ม)
- ขั้นตอนการทำให้เกิดปัญหา
- รายละเอียดสภาพแวดล้อม (`azd env show`)
- เส้นเวลาว่าเมื่อใดปัญหาเริ่มเกิดขึ้น

### สคริปต์รวบรวมบันทึก
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 การป้องกันปัญหา

### รายการตรวจสอบก่อนการปรับใช้
```bash
# 1. ตรวจสอบการยืนยันตัวตน
az account show

# 2. ตรวจสอบโควต้าและขีดจำกัด
az vm list-usage --location eastus2

# 3. ตรวจสอบเทมเพลต
az bicep build --file infra/main.bicep

# 4. ทดสอบในเครื่องก่อน
npm run build
npm run test

# 5. ใช้การปรับใช้แบบทดลอง (dry-run)
azd provision --preview
```

### การตั้งค่าการตรวจสอบ
```bash
# เปิดใช้งาน Application Insights
# เพิ่มลงใน main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# ตั้งค่าการแจ้งเตือน
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### การบำรุงรักษาปกติ
```bash
# การตรวจสุขภาพรายสัปดาห์
./scripts/health-check.sh

# การทบทวนค่าใช้จ่ายรายเดือน
az consumption usage list --billing-period-name 202401

# การทบทวนความปลอดภัยรายไตรมาส
az security assessment list --resource-group myrg
```

## ทรัพยากรที่เกี่ยวข้อง

- [คู่มือการดีบัก](debugging.md) - เทคนิคการดีบักขั้นสูง
- [การจัดเตรียมทรัพยากร](../chapter-04-infrastructure/provisioning.md) - การแก้ไขปัญหาโครงสร้างพื้นฐาน
- [การวางแผนความจุ](../chapter-06-pre-deployment/capacity-planning.md) - คำแนะนำการวางแผนทรัพยากร
- [การเลือก SKU](../chapter-06-pre-deployment/sku-selection.md) - คำแนะนำระดับบริการ

---

**เคล็ดลับ**: คั่นหน้านี้ไว้และอ้างอิงเมื่อใดก็ตามที่คุณพบปัญหา โดยมากปัญหาเคยถูกพบมาก่อนและมีวิธีแก้ไขที่ชัดเจน!

---

**การนำทาง**
- **บทก่อนหน้า**: [การจัดเตรียมทรัพยากร](../chapter-04-infrastructure/provisioning.md)
- **บทถัดไป**: [คู่มือการดีบัก](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
คำปฏิเสธความรับผิด:

เอกสารฉบับนี้ถูกแปลโดยใช้บริการแปลด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะมุ่งมั่นเพื่อความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อนได้ เอกสารต้นฉบับในภาษาต้นทางควรถูกถือว่าเป็นแหล่งอ้างอิงที่เชื่อถือได้ที่สุด สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยนักแปลมืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใดๆ ที่เกิดจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->