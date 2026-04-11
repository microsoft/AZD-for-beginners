# ปัญหาที่พบบ่อยและวิธีแก้ไข

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ไขปัญหาและการดีบัก
- **⬅️ บทก่อนหน้า**: [บทที่ 6: การตรวจสอบก่อนใช้งาน](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ ถัดไป**: [คู่มือการดีบัก](debugging.md)
- **🚀 บทถัดไป**: [บทที่ 8: รูปแบบการใช้งานในโปรดักชันและองค์กร](../chapter-08-production/production-ai-practices.md)

## บทนำ

คู่มือการแก้ไขปัญหาอย่างละเอียดนี้ครอบคลุมปัญหาที่พบได้บ่อยที่สุดเมื่อใช้ Azure Developer CLI เรียนรู้วิธีวินิจฉัย แก้ไข และแก้ปัญหาทั่วไปเกี่ยวกับการพิสูจน์ตัวตน การปรับใช้ การจัดเตรียมโครงสร้างพื้นฐาน และการกำหนดค่าแอปพลิเคชัน ทุกปัญหามีอาการโดยละเอียด สาเหตุที่แท้จริง และขั้นตอนการแก้ไขอย่างเป็นระบบ

## เป้าหมายการเรียนรู้

เมื่อทำคู่มือนี้เสร็จสิ้น คุณจะสามารถ:
- เชี่ยวชาญเทคนิคการวินิจฉัยปัญหาของ Azure Developer CLI
- เข้าใจปัญหาการพิสูจน์ตัวตนและสิทธิ์ที่พบบ่อย รวมถึงวิธีแก้ไข
- แก้ไขข้อผิดพลาดจากการปรับใช้ การจัดเตรียมโครงสร้างพื้นฐาน และการกำหนดค่า
- นำแนวทางการตรวจสอบและการดีบักเชิงรุกมาใช้
- ใช้วิธีการแก้ไขปัญหาอย่างเป็นระบบสำหรับปัญหาที่ซับซ้อน
- กำหนดค่าการบันทึกและการตรวจสอบอย่างเหมาะสมเพื่อป้องกันปัญหาในอนาคต

## ผลลัพธ์การเรียนรู้

หลังจากเสร็จสิ้น คุณจะสามารถ:
- วินิจฉัยปัญหา Azure Developer CLI โดยใช้เครื่องมือวินิจฉัยในตัว
- แก้ไขปัญหาการพิสูจน์ตัวตน การสมัครใช้งาน และสิทธิ์ได้ด้วยตนเอง
- แก้ไขปัญหาการปรับใช้และการจัดเตรียมโครงสร้างพื้นฐานได้อย่างมีประสิทธิภาพ
- ดีบักปัญหาการกำหนดค่าแอปและปัญหาที่เฉพาะเจาะจงกับสภาพแวดล้อม
- ดำเนินการตรวจสอบและแจ้งเตือนเพื่อระบุปัญหาที่อาจเกิดขึ้นล่วงหน้า
- นำแนวทางปฏิบัติที่ดีที่สุดสำหรับการบันทึก ดีบัก และกระบวนการแก้ไขปัญหาไปใช้

## การวินิจฉัยด่วน

ก่อนที่จะลงลึกปัญหาเฉพาะ ให้รันคำสั่งเหล่านี้เพื่อรวบรวมข้อมูลวินิจฉัย:

```bash
# ตรวจสอบเวอร์ชันและสถานะของ azd
azd version
azd config show

# ตรวจสอบการยืนยันตัวตนของ Azure
az account show
az account list

# ตรวจสอบสภาพแวดล้อมปัจจุบัน
azd env list
azd env get-values

# เปิดใช้งานการบันทึกข้อผิดพลาดแบบดีบัก
export AZD_DEBUG=true
azd <command> --debug
```

## ปัญหาการพิสูจน์ตัวตน

### ปัญหา: "ไม่สามารถรับโทเค็นการเข้าถึงได้"
**อาการ:**
- `azd up` ล้มเหลวพร้อมข้อผิดพลาดการพิสูจน์ตัวตน
- คำสั่งแสดงข้อความ "ไม่ได้รับอนุญาต" หรือ "การเข้าถึงถูกปฏิเสธ"

**วิธีแก้ไข:**
```bash
# 1. เข้าสู่ระบบใหม่ด้วย Azure CLI
az login
az account show

# 2. ล้างข้อมูลประจำตัวที่แคชไว้
az account clear
az login

# 3. ใช้กระบวนการโค้ดอุปกรณ์ (สำหรับระบบที่ไม่มีหน้าจอ)
az login --use-device-code

# 4. กำหนดการสมัครสมาชิกอย่างชัดเจน
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### ปัญหา: "สิทธิ์ไม่เพียงพอ" ขณะปรับใช้
**อาการ:**
- การปรับใช้ล้มเหลวพร้อมข้อความผิดพลาดเกี่ยวกับสิทธิ์
- ไม่สามารถสร้างทรัพยากร Azure บางประเภทได้

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบการมอบหมายบทบาท Azure ของคุณ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ตรวจสอบให้แน่ใจว่าคุณมีบทบาทที่ต้องการ
# - Contributor (สำหรับการสร้างทรัพยากร)
# - ผู้ดูแลการเข้าถึงผู้ใช้ (สำหรับการมอบหมายบทบาท)

# 3. ติดต่อผู้ดูแลระบบ Azure ของคุณเพื่อขอสิทธิ์ที่เหมาะสม
```

### ปัญหา: ปัญหาการพิสูจน์ตัวตนแบบ multi-tenant
**วิธีแก้ไข:**
```bash
# 1. เข้าสู่ระบบด้วยผู้เช่าเฉพาะ
az login --tenant "your-tenant-id"

# 2. ตั้งค่าผู้เช่าในคอนฟิกูเรชัน
azd config set auth.tenantId "your-tenant-id"

# 3. ล้างแคชผู้เช่าหากเปลี่ยนผู้เช่า
az account clear
```

## 🏗️ ข้อผิดพลาดในการจัดเตรียมโครงสร้างพื้นฐาน

### ปัญหา: การขัดแย้งของชื่อทรัพยากร
**อาการ:**
- ข้อความผิดพลาด "ชื่อตัวทรัพยากรมีอยู่แล้ว"
- การปรับใช้ล้มเหลวในระหว่างการสร้างทรัพยากร

**วิธีแก้ไข:**
```bash
# 1. ใช้ชื่อทรัพยากรที่ไม่ซ้ำกันพร้อมโทเค็น
# ในเทมเพลต Bicep ของคุณ:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. เปลี่ยนชื่อสภาพแวดล้อม
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. ทำความสะอาดทรัพยากรที่มีอยู่เดิม
azd down --force --purge
```

### ปัญหา: ตำแหน่ง/ภูมิภาคไม่พร้อมใช้งาน
**อาการ:**
- "ตำแหน่ง 'xyz' ไม่พร้อมใช้งานสำหรับประเภททรัพยากรนี้"
- SKU บางรายการไม่พร้อมใช้งานในภูมิภาคที่เลือก

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบตำแหน่งที่มีสำหรับประเภททรัพยากร
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. ใช้ภูมิภาคที่ใช้ได้ทั่วไป
azd config set defaults.location eastus2
# หรือ
azd env set AZURE_LOCATION eastus2

# 3. ตรวจสอบความพร้อมใช้งานของบริการตามภูมิภาค
# เยี่ยมชม: https://azure.microsoft.com/global-infrastructure/services/
```

### ปัญหา: ข้อผิดพลาดเกินโควต้า
**อาการ:**
- "เกินโควต้าสำหรับประเภททรัพยากร"
- "จำนวนทรัพยากรถึงขีดจำกัดสูงสุดแล้ว"

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบการใช้โควต้าในปัจจุบัน
az vm list-usage --location eastus2 -o table

# 2. ขอเพิ่มโควต้าผ่านพอร์ทัล Azure
# ไปที่: การสมัครใช้งาน > การใช้งาน + โควต้า

# 3. ใช้ SKU ขนาดเล็กลงสำหรับการพัฒนา
# ใน main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. ทำความสะอาดทรัพยากรที่ไม่ได้ใช้งาน
az resource list --query "[?contains(name, 'unused')]" -o table
```

### ปัญหา: ข้อผิดพลาดเทมเพลต Bicep
**อาการ:**
- การตรวจสอบเทมเพลตล้มเหลว
- ข้อผิดพลาดไวยากรณ์ในไฟล์ Bicep

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบไวยากรณ์ Bicep
az bicep build --file infra/main.bicep

# 2. ใช้ linter ของ Bicep
az bicep lint --file infra/main.bicep

# 3. ตรวจสอบไวยากรณ์ไฟล์พารามิเตอร์
cat infra/main.parameters.json | jq '.'

# 4. ดูตัวอย่างการเปลี่ยนแปลงการปรับใช้
azd provision --preview
```

## 🚀 ปัญหาการปรับใช้ล้มเหลว

### ปัญหา: การสร้างล้มเหลว
**อาการ:**
- แอปพลิเคชันสร้างไม่สำเร็จขณะปรับใช้
- ข้อผิดพลาดการติดตั้งแพ็กเกจ

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบผลลัพธ์การสร้างพร้อมสัญลักษณ์ดีบัก
azd deploy --service web --debug

# 2. ดูสถานะบริการที่ปรากฏ
azd show

# 3. ทดสอบการสร้างในเครื่อง
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
- แอปคอนเทนเนอร์ไม่สามารถเริ่มทำงานได้
- ข้อผิดพลาดการดึงอิมเมจ

**วิธีแก้ไข:**
```bash
# 1. ทดสอบการสร้าง Docker ในเครื่อง
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. ตรวจสอบบันทึกคอนเทนเนอร์โดยใช้ Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. ตรวจสอบแอปพลิเคชันผ่าน azd
azd monitor --logs

# 3. ยืนยันการเข้าถึงรีจิสทรีคอนเทนเนอร์
az acr login --name myregistry

# 4. ตรวจสอบการกำหนดค่าคอนเทนเนอร์แอป
az containerapp show --name my-app --resource-group my-rg
```

### ปัญหา: การเชื่อมต่อฐานข้อมูลล้มเหลว
**อาการ:**
- แอปไม่สามารถเชื่อมต่อกับฐานข้อมูลได้
- ข้อผิดพลาดหมดเวลาการเชื่อมต่อ

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบกฎไฟร์วอลล์ฐานข้อมูล
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. ทดสอบการเชื่อมต่อจากแอปพลิเคชัน
# เพิ่มในแอปของคุณชั่วคราว:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. ตรวจสอบรูปแบบสตริงการเชื่อมต่อ
azd env get-values | grep DATABASE

# 4. ตรวจสอบสถานะเซิร์ฟเวอร์ฐานข้อมูล
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 ปัญหาการกำหนดค่า

### ปัญหา: ตัวแปรสภาพแวดล้อมไม่ทำงาน
**อาการ:**
- แอปไม่สามารถอ่านค่าการกำหนดค่าได้
- ตัวแปรสภาพแวดล้อมดูเหมือนว่างเปล่า

**วิธีแก้ไข:**
```bash
# 1. ตรวจสอบว่าตัวแปรสิ่งแวดล้อมถูกตั้งค่าแล้ว
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
- ข้อผิดพลาดการตรวจสอบใบรับรอง

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
- ส่วนหน้าของแอปเรียก API ไม่ได้
- การขอข้ามต้นทางถูกบล็อก

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

# 3. ตรวจสอบว่ากำลังใช้งานบน URL ที่ถูกต้องหรือไม่
azd show
```

## 🌍 ปัญหาการจัดการสภาพแวดล้อม

### ปัญหา: ปัญหาการสลับสภาพแวดล้อม
**อาการ:**
- ใช้สภาพแวดล้อมผิดตัว
- การสลับการกำหนดค่าไม่ทำงานอย่างถูกต้อง

**วิธีแก้ไข:**
```bash
# 1. แสดงรายการทั้งหมดของสภาพแวดล้อม
azd env list

# 2. เลือกสภาพแวดล้อมอย่างชัดเจน
azd env select production

# 3. ตรวจสอบสภาพแวดล้อมปัจจุบัน
azd env list

# 4. สร้างสภาพแวดล้อมใหม่หากเกิดความเสียหาย
azd env new production-new
azd env select production-new
```

### ปัญหา: สภาพแวดล้อมเสียหาย
**อาการ:**
- สภาพแวดล้อมแสดงสถานะไม่ถูกต้อง
- ทรัพยากรไม่ตรงกับการกำหนดค่า

**วิธีแก้ไข:**
```bash
# 1. รีเฟรชสถานะสิ่งแวดล้อม
azd env refresh

# 2. รีเซ็ตการตั้งค่าสิ่งแวดล้อม
azd env new production-reset
# คัดลอกตัวแปรสิ่งแวดล้อมที่จำเป็น
azd env set DATABASE_URL "your-value"

# 3. นำเข้าแหล่งข้อมูลที่มีอยู่ (ถ้าเป็นไปได้)
# อัปเดตไฟล์ .azure/production/config.json ด้วยรหัสทรัพยากรด้วยตนเอง
```

## 🔍 ปัญหาด้านประสิทธิภาพ

### ปัญหา: เวลาปรับใช้นาน
**อาการ:**
- การปรับใช้ใช้เวลานานเกินไป
- หมดเวลาระหว่างการปรับใช้

**วิธีแก้ไข:**
```bash
# 1. โยกย้ายบริการเฉพาะเพื่อการทำซ้ำที่รวดเร็วขึ้น
azd deploy --service web
azd deploy --service api

# 2. ใช้การปรับใช้เฉพาะโค้ดเมื่อโครงสร้างพื้นฐานไม่เปลี่ยนแปลง
azd deploy  # เร็วกว่าการใช้ azd up

# 3. ปรับกระบวนการสร้างให้เหมาะสม
# ใน package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. ตรวจสอบที่ตั้งของทรัพยากร (ใช้ภูมิภาคเดียวกัน)
azd config set defaults.location eastus2
```

### ปัญหา: ปัญหาประสิทธิภาพของแอปพลิเคชัน
**อาการ:**
- เวลาตอบสนองช้า
- ใช้ทรัพยากรสูง

**วิธีแก้ไข:**
```bash
# 1. ขยายทรัพยากร
# อัปเดต SKU ใน main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. เปิดใช้งานการตรวจสอบ Application Insights
azd monitor --overview

# 3. ตรวจสอบบันทึกแอปพลิเคชันใน Azure
az webapp log tail --name myapp --resource-group myrg
# หรือสำหรับ Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. นำการแคชไปใช้
# เพิ่ม Redis cache ในโครงสร้างพื้นฐานของคุณ
```

## 🛠️ เครื่องมือและคำสั่งแก้ไขปัญหา

### คำสั่งดีบัก
```bash
# การดีบักอย่างครบถ้วน
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# ตรวจสอบเวอร์ชัน azd
azd version

# ดูการกำหนดค่าปัจจุบัน
azd config show

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

# บันทึกทรัพยากรของ Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# บันทึกคอนเทนเนอร์ (สำหรับแอปคอนเทนเนอร์)
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

## 🆘 การขอความช่วยเหลือเพิ่มเติม

### เมื่อใดควรส่งต่อ
- ปัญหาการพิสูจน์ตัวตนยังเกิดขึ้นหลังจากลองแก้ไขทุกวิธีแล้ว
- ปัญหาโครงสร้างพื้นฐานกับบริการ Azure
- ปัญหาการเรียกเก็บเงินหรือการสมัครใช้งาน
- กังวลเรื่องความปลอดภัยหรือเหตุการณ์ไม่ปกติ

### ช่องทางสนับสนุน
```bash
# 1. ตรวจสอบสถานะบริการของ Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. สร้างบัตรสนับสนุนของ Azure
# ไปที่: https://portal.azure.com -> ความช่วยเหลือ + การสนับสนุน

# 3. แหล่งข้อมูลชุมชน
# - Stack Overflow: แท็ก azure-developer-cli
# - ปัญหา GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### ข้อมูลที่ควรรวบรวม
ก่อนติดต่อฝ่ายสนับสนุน ให้เตรียม:
- ผลลัพธ์ `azd version`
- ผลลัพธ์ `azd config show`
- ผลลัพธ์ `azd show` (สถานะการปรับใช้ปัจจุบัน)
- ข้อความผิดพลาด (ข้อความเต็ม)
- ขั้นตอนการทำซ้ำปัญหา
- รายละเอียดสภาพแวดล้อม (`azd env get-values`)
- ลำดับเวลาที่ปัญหาเริ่มต้น

### สคริปต์เก็บบันทึก
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 การป้องกันปัญหา

### รายการตรวจสอบก่อนปรับใช้
```bash
# 1. ตรวจสอบการยืนยันตัวตน
az account show

# 2. ตรวจสอบโควต้าและขีดจำกัด
az vm list-usage --location eastus2

# 3. ตรวจสอบแม่แบบ
az bicep build --file infra/main.bicep

# 4. ทดสอบในเครื่องก่อน
npm run build
npm run test

# 5. ใช้การปรับใช้แบบทดลอง
azd provision --preview
```

### การตั้งค่าการตรวจสอบ
```bash
# เปิดใช้งาน Application Insights
# เพิ่มไปยัง main.bicep:
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

### การบำรุงรักษาเป็นประจำ
```bash
# การตรวจสุขภาพรายสัปดาห์
./scripts/health-check.sh

# การทบทวนค่าใช้จ่ายรายเดือน
az consumption usage list --billing-period-name 202401

# การทบทวนความปลอดภัยรายไตรมาส
az security assessment list --resource-group myrg
```

## แหล่งข้อมูลที่เกี่ยวข้อง

- [คู่มือการดีบัก](debugging.md) - เทคนิคการดีบักขั้นสูง
- [การจัดเตรียมทรัพยากร](../chapter-04-infrastructure/provisioning.md) - การแก้ไขปัญหาโครงสร้างพื้นฐาน
- [การวางแผนความจุ](../chapter-06-pre-deployment/capacity-planning.md) - แนวทางการวางแผนทรัพยากร
- [การเลือก SKU](../chapter-06-pre-deployment/sku-selection.md) - คำแนะนำระดับบริการ

---

**เคล็ดลับ**: เก็บคู่มือนี้ไว้ในที่จดจำและเปิดดูเมื่อเจอปัญหา ปัญหาส่วนใหญ่เคยเกิดขึ้นแล้วและมีวิธีแก้ไขชัดเจน!

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [การจัดเตรียมทรัพยากร](../chapter-04-infrastructure/provisioning.md)
- **บทเรียนถัดไป**: [คู่มือการดีบัก](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**คำปฏิเสธความรับผิดชอบ**:  
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความถูกต้องสูงสุด โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมของเอกสารควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ หากเป็นข้อมูลสำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->