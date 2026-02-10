# สถาปัตยกรรมไมโครเซอร์วิส - ตัวอย่างแอปคอนเทนเนอร์

⏱️ **เวลาประมาณ**: 25-35 นาที | 💰 **ประมาณค่าใช้จ่าย**: ~$50-100/เดือน | ⭐ **ความซับซ้อน**: ขั้นสูง

สถาปัตยกรรมไมโครเซอร์วิสที่ **เรียบง่ายแต่ใช้งานได้จริง** ถูกติดตั้งใน Azure Container Apps โดยใช้ AZD CLI ตัวอย่างนี้แสดงการสื่อสารระหว่างบริการ การจัดการคอนเทนเนอร์ และการตรวจสอบด้วยการตั้งค่าบริการ 2 ตัวอย่างที่ใช้งานได้จริง

> **📚 วิธีการเรียนรู้**: ตัวอย่างนี้เริ่มต้นด้วยสถาปัตยกรรมบริการ 2 ตัว (API Gateway + Backend Service) ที่คุณสามารถติดตั้งใช้งานและเรียนรู้ได้จริง หลังจากเข้าใจพื้นฐานนี้แล้ว เราจะให้คำแนะนำในการขยายไปยังระบบไมโครเซอร์วิสเต็มรูปแบบ

## สิ่งที่คุณจะได้เรียนรู้

โดยทำตัวอย่างนี้ให้เสร็จสิ้น คุณจะ:
- ติดตั้งหลายๆ คอนเทนเนอร์บน Azure Container Apps
- นำการสื่อสารบริการต่อบริการด้วยเครือข่ายภายในไปใช้งาน
- ตั้งค่าการปรับขนาดตามสภาพแวดล้อมและตรวจสอบสุขภาพ
- ตรวจสอบแอปพลิเคชันแบบกระจายด้วย Application Insights
- เข้าใจรูปแบบการติดตั้งไมโครเซอร์วิสและแนวทางปฏิบัติที่ดีที่สุด
- เรียนรู้การขยายจากสถาปัตยกรรมที่ง่ายไปสู่ที่ซับซ้อนอย่างเป็นขั้นตอน

## สถาปัตยกรรม

### ขั้นตอนที่ 1: สิ่งที่เราจะสร้าง (รวมในตัวอย่างนี้)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**ทำไมต้องเริ่มง่าย?**
- ✅ ติดตั้งและเข้าใจได้อย่างรวดเร็ว (25-35 นาที)
- ✅ เรียนรู้รูปแบบไมโครเซอร์วิสหลักโดยไม่ซับซ้อน
- ✅ โค้ดใช้งานจริงที่คุณสามารถแก้ไขและทดลองได้
- ✅ ค่าใช้จ่ายต่ำสำหรับการเรียนรู้ (~$50-100/เดือน เทียบกับ $300-1400/เดือน)
- ✅ สร้างความมั่นใจก่อนเพิ่มฐานข้อมูลและคิวข้อความ

**วรรณภาพ**: คิดเหมือนกับการเรียนขับรถ คุณเริ่มจากลานจอดรถว่างเปล่า (บริการ 2 ตัว) ฝึกพื้นฐานให้ชำนาญ แล้วค่อยก้าวไปสู่การจราจรในเมือง (บริการ 5+ ตัวพร้อมฐานข้อมูล)

### ขั้นตอนที่ 2: การขยายในอนาคต (สถาปัตยกรรมอ้างอิง)

เมื่อคุณเชี่ยวชาญสถาปัตยกรรม 2 บริการนี้แล้ว คุณสามารถขยายไปที่:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

ดูส่วน "คู่มือการขยาย" ที่ท้ายเอกสารสำหรับคำแนะนำทีละขั้นตอน

## คุณสมบัติที่รวมไว้

✅ **ค้นหาบริการ**: ค้นหาอัตโนมัติผ่าน DNS ระหว่างคอนเทนเนอร์  
✅ **ปรับสมดุลโหลด**: ปรับสมดุลโหลดในแต่ละสำเนาแบบอัตโนมัติ  
✅ **ปรับขนาดอัตโนมัติ**: ปรับขนาดแต่ละบริการตามคำขอ HTTP  
✅ **ตรวจสอบสุขภาพ**: มีการตรวจสอบเปิดใช้งานและพร้อมใช้งานสำหรับทั้งสองบริการ  
✅ **บันทึกแบบกระจาย**: บันทึกข้อมูลกลางด้วย Application Insights  
✅ **เครือข่ายภายใน**: การสื่อสารระหว่างบริการอย่างปลอดภัย  
✅ **จัดการคอนเทนเนอร์อัตโนมัติ**: ติดตั้งและปรับขนาดอัตโนมัติ  
✅ **อัปเดตโดยไม่หยุดทำงาน**: อัปเดตแบบหมุนเวียนพร้อมการจัดการเวอร์ชัน  

## สิ่งที่ต้องมีล่วงหน้า

### เครื่องมือที่ต้องใช้

ก่อนเริ่ม ให้ตรวจสอบว่าคุณได้ติดตั้งเครื่องมือต่อไปนี้:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (เวอร์ชัน 1.0.0 หรือสูงกว่า)
   ```bash
   azd version
   # ผลลัพธ์ที่คาดว่าจะได้รับ: azd เวอร์ชัน 1.0.0 หรือสูงกว่า
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (เวอร์ชัน 2.50.0 หรือสูงกว่า)
   ```bash
   az --version
   # ผลลัพธ์ที่คาดหวัง: azure-cli 2.50.0 หรือสูงกว่า
   ```

3. **[Docker](https://www.docker.com/get-started)** (สำหรับพัฒนา/ทดสอบในเครื่อง - ไม่บังคับ)
   ```bash
   docker --version
   # คาดหวังผลลัพธ์: Docker เวอร์ชัน 20.10 หรือสูงกว่า
   ```

### ข้อกำหนด Azure

- ต้องมี **บัญชีผู้ใช้ Azure ที่เปิดใช้งาน** ([สร้างบัญชีฟรี](https://azure.microsoft.com/free/))
- มีสิทธิ์สร้างทรัพยากรในบัญชีของคุณ
- มีบทบาท **Contributor** บนบัญชีหรือกลุ่มทรัพยากร

### ความรู้เบื้องต้น

นี่คือตัวอย่างระดับ **ขั้นสูง** คุณควรมี:
- ทำตัวอย่าง [Simple Flask API](../../../../../examples/container-app/simple-flask-api) เสร็จแล้ว
- เข้าใจพื้นฐานสถาปัตยกรรมไมโครเซอร์วิส
- คุ้นเคยกับ REST APIs และ HTTP
- เข้าใจแนวคิดคอนเทนเนอร์

**ไม่เคยใช้งาน Container Apps มาก่อน?** เริ่มจาก [ตัวอย่าง Simple Flask API](../../../../../examples/container-app/simple-flask-api) เพื่อเรียนรู้พื้นฐานก่อน

## เริ่มต้นอย่างรวดเร็ว (ทีละขั้นตอน)

### ขั้นตอนที่ 1: โคลนและเปลี่ยนไดเรกทอรี

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ ตรวจสอบความสำเร็จ**: ตรวจสอบว่าคำสั่ง `azure.yaml` ปรากฏ:
```bash
ls
# ที่คาดไว้: README.md, azure.yaml, infra/, src/
```

### ขั้นตอนที่ 2: ลงชื่อเข้าใช้ Azure

```bash
azd auth login
```

เปิดเบราว์เซอร์เพื่อทำการยืนยันตัวตน Azure ลงชื่อด้วยบัญชี Azure ของคุณ

**✓ ตรวจสอบความสำเร็จ**: ควรเห็นข้อความ:
```
Logged in to Azure.
```

### ขั้นตอนที่ 3: เริ่มต้นสภาพแวดล้อม

```bash
azd init
```

**คำถามที่คุณจะเห็น**:
- **ชื่อสภาพแวดล้อม**: กรอกชื่อสั้น ๆ (เช่น `microservices-dev`)
- **บัญชี Azure**: เลือกบัญชีของคุณ
- **ภูมิภาค Azure**: เลือกภูมิภาค (เช่น `eastus`, `westeurope`)

**✓ ตรวจสอบความสำเร็จ**: คุณจะเห็น:
```
SUCCESS: New project initialized!
```

### ขั้นตอนที่ 4: ติดตั้งโครงสร้างพื้นฐานและบริการ

```bash
azd up
```

**สิ่งที่จะเกิดขึ้น** (ใช้เวลา 8-12 นาที):
1. สร้างสภาพแวดล้อม Container Apps
2. สร้าง Application Insights สำหรับการตรวจสอบ
3. สร้างคอนเทนเนอร์ API Gateway (Node.js)
4. สร้างคอนเทนเนอร์ Product Service (Python)
5. ติดตั้งคอนเทนเนอร์ทั้งสองบน Azure
6. ตั้งค่าเครือข่ายและการตรวจสอบสุขภาพ
7. ตั้งค่าการตรวจสอบและบันทึก

**✓ ตรวจสอบความสำเร็จ**: คุณจะเห็น:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ เวลา**: 8-12 นาที

### ขั้นตอนที่ 5: ทดสอบการติดตั้ง

```bash
# ดึงจุดสิ้นสุดเกตเวย์
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# ทดสอบสุขภาพของ API Gateway
curl $GATEWAY_URL/health

# ผลลัพธ์ที่คาดหวัง:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**ทดสอบบริการสินค้า ผ่าน gateway**:
```bash
# รายการสินค้า
curl $GATEWAY_URL/api/products

# ผลลัพธ์ที่คาดไว้:
# [
#   {"id":1,"name":"แล็ปท็อป","price":999.99,"stock":50},
#   {"id":2,"name":"เมาส์","price":29.99,"stock":200},
#   {"id":3,"name":"คีย์บอร์ด","price":79.99,"stock":150}
# ]
```

**✓ ตรวจสอบความสำเร็จ**: ทั้งสอง endpoint คืนค่าข้อมูล JSON โดยไม่มีข้อผิดพลาด

---

**🎉 ยินดีด้วย!** คุณได้ติดตั้งสถาปัตยกรรมไมโครเซอร์วิสบน Azure เรียบร้อยแล้ว!

## โครงสร้างโปรเจกต์

ไฟล์การติดตั้งทั้งหมดถูกรวมไว้ — นี่คือตัวอย่างที่สมบูรณ์และใช้งานได้จริง:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**แต่ละส่วนทำหน้าที่อะไร:**

**โครงสร้างพื้นฐาน (infra/):**
- `main.bicep`: ควบคุมทรัพยากร Azure และการพึ่งพากันทั้งหมด
- `core/container-apps-environment.bicep`: สร้างสภาพแวดล้อม Container Apps และ Azure Container Registry
- `core/monitor.bicep`: ตั้งค่า Application Insights สำหรับบันทึกแบบกระจาย
- `app/*.bicep`: นิยามแอปคอนเทนเนอร์แต่ละตัว พร้อมการปรับขนาดและตรวจสอบสุขภาพ

**API Gateway (src/api-gateway/):**
- บริการสาธารณะที่รับคำขอและส่งต่อไปยังบริการแบ็คเอนด์
- จัดการการบันทึก, การจัดการข้อผิดพลาด, และการส่งต่อตามคำขอ
- ตัวอย่างการสื่อสาร HTTP ระหว่างบริการ

**บริการสินค้า (src/product-service/):**
- บริการภายในที่เก็บแค็ตตาล็อกสินค้า (เก็บในหน่วยความจำเพื่อความเรียบง่าย)
- REST API พร้อมตรวจสอบสุขภาพ
- ตัวอย่างรูปแบบไมโครเซอร์วิสแบ็คเอนด์

## ภาพรวมบริการ

### API Gateway (Node.js/Express)

**พอร์ต**: 8080  
**การเข้าถึง**: สาธารณะ (ผ่านทางเข้าแบบภายนอก)  
**วัตถุประสงค์**: ส่งคำขอที่เข้ามาไปยังบริการแบ็คเอนด์ที่เหมาะสม

**Endpoints**:
- `GET /` - ข้อมูลบริการ
- `GET /health` - จุดตรวจสุขภาพ
- `GET /api/products` - ส่งต่อไปยังบริการสินค้า (รายการทั้งหมด)
- `GET /api/products/:id` - ส่งต่อไปยังบริการสินค้า (ค้นหาตาม ID)

**คุณสมบัติสำคัญ**:
- การส่งต่อคำขอด้วย axios
- การบันทึกศูนย์กลาง
- การจัดการข้อผิดพลาดและการหมดเวลา
- ค้นหาบริการผ่านตัวแปรสภาพแวดล้อม
- การรวม Application Insights

**ไฮไลต์โค้ด** (`src/api-gateway/app.js`):
```javascript
// การสื่อสารบริการภายใน
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### บริการสินค้า (Python/Flask)

**พอร์ต**: 8000  
**การเข้าถึง**: ภายในเท่านั้น (ไม่มีทางเข้าภายนอก)  
**วัตถุประสงค์**: จัดการแค็ตตาล็อกสินค้าโดยใช้ข้อมูลในหน่วยความจำ

**Endpoints**:
- `GET /` - ข้อมูลบริการ
- `GET /health` - จุดตรวจสุขภาพ
- `GET /products` - แสดงสินค้าทั้งหมด
- `GET /products/<id>` - ดูสินค้าตาม ID

**คุณสมบัติสำคัญ**:
- RESTful API ด้วย Flask
- เก็บข้อมูลสินค้าในหน่วยความจำ (ง่าย ไม่ต้องใช้ฐานข้อมูล)
- การตรวจสอบสุขภาพด้วย probes
- การบันทึกแบบมีโครงสร้าง
- การบูรณาการกับ Application Insights

**โครงสร้างข้อมูล**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**ทำไมให้เข้าถึงภายในเท่านั้น?**
บริการสินค้าไม่ได้เปิดเผยสาธารณะ ทั้งหมดต้องผ่าน API Gateway ซึ่งให้:
- ความปลอดภัย: ควบคุมจุดเข้าถึง
- ความยืดหยุ่น: เปลี่ยนแบ็คเอนด์โดยไม่กระทบลูกค้า
- การตรวจสอบ: บันทึกคำขอกลาง

## เข้าใจการสื่อสารระหว่างบริการ

### บริการคุยกันอย่างไร

ในตัวอย่างนี้ API Gateway สื่อสารกับบริการสินค้าโดยใช้ **การเรียก HTTP ภายใน**:

```javascript
// ประตูทางเข้า API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// ทำคำขอ HTTP ภายใน
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**ประเด็นสำคัญ**:

1. **ค้นหาด้วย DNS**: Container Apps สร้าง DNS ให้อัตโนมัติสำหรับบริการภายใน
   - FQDN ของบริการสินค้า: `product-service.internal.<environment>.azurecontainerapps.io`
   - เรียบง่ายเป็น: `http://product-service` (Container Apps แก้ไขเอง)

2. **ไม่เปิดเผยต่อสาธารณะ**: บริการสินค้ามีค่า `external: false` ใน Bicep
   - เข้าถึงได้เฉพาะภายในสภาพแวดล้อม Container Apps เท่านั้น
   - ไม่สามารถเข้าถึงจากอินเทอร์เน็ตได้

3. **ตัวแปรสภาพแวดล้อม**: URL ของบริการถูกส่งผ่านตอนติดตั้ง
   - Bicep ส่ง FQDN ภายในไปยัง gateway
   - ไม่มี URL ที่กำหนดแบบคงที่ในโค้ดแอป

**วรรณภาพ**: สังเกตว่ามันเหมือนห้องสำนักงาน API Gateway คือโต๊ะต้อนรับ (หน้าสาธารณะ) และบริการสินค้าคือห้องสำนักงาน (เฉพาะภายใน) ผู้มาต้องผ่านโต๊ะต้อนรับก่อนเข้าห้องใดๆ

## ทางเลือกการติดตั้ง

### ติดตั้งทั้งหมด (แนะนำ)

```bash
# ปรับใช้โครงสร้างพื้นฐานและบริการทั้งสอง
azd up
```

จะติดตั้ง:
1. สภาพแวดล้อม Container Apps
2. Application Insights
3. Container Registry
4. คอนเทนเนอร์ API Gateway
5. คอนเทนเนอร์บริการสินค้า

**ใช้เวลา**: 8-12 นาที

### ติดตั้งเฉพาะบริการเดียว

```bash
# ปล่อยใช้งานเพียงบริการเดียว (หลังจาก azd up เบื้องต้น)
azd deploy api-gateway

# หรือปล่อยใช้งานบริการผลิตภัณฑ์
azd deploy product-service
```

**กรณีใช้งาน**: เมื่อแก้ไขโค้ดในบริการใดบริการหนึ่งแล้วต้องการติดตั้งเฉพาะบริการนั้นอีกครั้ง

### อัปเดตการตั้งค่า

```bash
# เปลี่ยนพารามิเตอร์การปรับขนาด
azd env set GATEWAY_MAX_REPLICAS 30

# ติดตั้งใหม่ด้วยการกำหนดค่าที่ใหม่
azd up
```

## การตั้งค่า

### การตั้งค่าปรับขนาด

ทั้งสองบริการตั้งค่าการปรับขนาดอัตโนมัติด้วย HTTP ในไฟล์ Bicep ดังนี้:

**API Gateway**:
- จำนวนสำเนาขั้นต่ำ: 2 (มีอย่างน้อย 2 เพื่อความพร้อมใช้งาน)
- จำนวนสำเนาสูงสุด: 20
- เงื่อนไขปรับขนาด: 50 คำขอพร้อมกันต่อสำเนา

**บริการสินค้า**:
- จำนวนสำเนาขั้นต่ำ: 1 (สามารถปรับเป็นศูนย์ได้ถ้าจำเป็น)
- จำนวนสำเนาสูงสุด: 10
- เงื่อนไขปรับขนาด: 100 คำขอพร้อมกันต่อสำเนา

**ปรับแต่งการปรับขนาด** (ใน `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### การจัดสรรทรัพยากร

**API Gateway**:
- CPU: 1.0 vCPU
- หน่วยความจำ: 2 GiB
- เหตุผล: จัดการการจราจรภายนอกทั้งหมด

**บริการสินค้า**:
- CPU: 0.5 vCPU
- หน่วยความจำ: 1 GiB
- เหตุผล: งานใช้งานในหน่วยความจำที่เบา

### การตรวจสอบสุขภาพ

ทั้งสองบริการมี probes สำหรับตรวจสุขภาพและความพร้อม:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**หมายความว่าอย่างไร**:
- **Liveness**: ถ้าการตรวจสอบสุขภาพล้มเหลว Container Apps จะรีสตาร์ทคอนเทนเนอร์
- **Readiness**: ถ้าไม่พร้อม Container Apps จะหยุดการส่งจราจรไปที่สำเนานั้น

## การตรวจสอบและการมองเห็น

### ดูบันทึกบริการ

```bash
# ดูบันทึกโดยใช้ azd monitor
azd monitor --logs

# หรือใช้ Azure CLI สำหรับ Container Apps เฉพาะ:
# สตรีมบันทึกจาก API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# ดูบันทึกล่าสุดของบริการผลิตภัณฑ์
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**ผลลัพธ์ที่คาดหวัง**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### คิวรี Application Insights

เข้า Application Insights ใน Azure Portal แล้วรันคิวรีเหล่านี้:

**ค้นหาคำขอล่าช้า**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**ติดตามการเรียกบริการระหว่างกัน**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**อัตราข้อผิดพลาดแยกตามบริการ**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**ปริมาณคำขอตามเวลา**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### เข้าถึงแดชบอร์ดการตรวจสอบ

```bash
# รับรายละเอียดของ Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# เปิดการตรวจสอบใน Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### เมตริกสด

1. ไปยัง Application Insights ใน Azure Portal  
2. คลิก "Live Metrics"  
3. ดูคำขอ, ความล้มเหลว และประสิทธิภาพแบบเรียลไทม์  
4. ทดสอบโดยรัน: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## แบบฝึกหัดปฏิบัติ

[หมายเหตุ: ดูแบบฝึกหัดเต็มในส่วน "Practical Exercises" ข้างต้นสำหรับขั้นตอนโดยละเอียดซึ่งรวมการตรวจสอบการติดตั้ง การแก้ไขข้อมูล ทดสอบการปรับขนาดอัตโนมัติ การจัดการข้อผิดพลาด และการเพิ่มบริการที่สาม]

## การวิเคราะห์ค่าใช้จ่าย

### ประมาณค่าใช้จ่ายรายเดือน (สำหรับตัวอย่าง 2 บริการนี้)

| ทรัพยากร | การตั้งค่า | ค่าประมาณ |
|----------|--------------|------------|
| API Gateway | 2-20 สำเนา, 1 vCPU, 2GB RAM | $30-150 |
| บริการสินค้า | 1-10 สำเนา, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | ชั้นพื้นฐาน | $5 |
| Application Insights | 1-2 GB/เดือน | $5-10 |
| Log Analytics | 1 GB/เดือน | $3 |
| **รวม** | | **$58-243/เดือน** |

**แยกเป็นรายการตามการใช้งาน**:
- **จราจรเบา** (ทดสอบ/เรียนรู้): ~$60/เดือน
- **จราจรปานกลาง** (เล็กน้อยในผลิตจริง): ~$120/เดือน
- **จราจรหนัก** (ช่วงยุ่ง): ~$240/เดือน

### เคล็ดลับการลดค่าใช้จ่าย

1. **ปรับขนาดเป็นศูนย์สำหรับการพัฒนา**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **ใช้ Consumption Plan สำหรับ Cosmos DB** (เมื่อเพิ่มเข้าไป):
   - จ่ายเฉพาะสิ่งที่ใช้จริง
   - ไม่มีค่าใช้จ่ายขั้นต่ำ

3. **ตั้งค่าการเก็บตัวอย่าง Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // ตัวอย่างคำขอ 50%
   ```

4. **ทำความสะอาดเมื่อไม่ใช้งาน**:
   ```bash
   azd down
   ```

### ตัวเลือกชั้นฟรี
สำหรับการเรียนรู้/ทดสอบ ให้พิจารณา:
- ใช้เครดิตฟรีของ Azure (30 วันแรก)
- รักษาจำนวน replicas ให้น้อยที่สุด
- ลบหลังทดสอบเสร็จ (ไม่มีค่าบริการต่อเนื่อง)

---

## การล้างข้อมูล

เพื่อหลีกเลี่ยงค่าบริการต่อเนื่อง ให้ลบทรัพยากรทั้งหมด:

```bash
azd down --force --purge
```

**การยืนยัน**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

พิมพ์ `y` เพื่อยืนยัน

**สิ่งที่จะถูกลบ**:
- สภาพแวดล้อม Container Apps
- ทั้งสอง Container Apps (gateway & บริการสินค้า)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ ยืนยันการล้างข้อมูล**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

ควรคืนค่าผลลัพธ์ว่าง

---

## คู่มือการขยาย: จาก 2 เป็น 5+ บริการ

เมื่อคุณเชี่ยวชาญสถาปัตยกรรม 2 บริการนี้แล้ว นี่คือวิธีขยาย:

### ระยะที่ 1: เพิ่มการเก็บข้อมูลฐานข้อมูล (ขั้นตอนถัดไป)

**เพิ่ม Cosmos DB สำหรับบริการสินค้า**:

1. สร้าง `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. ปรับปรุงบริการสินค้าให้ใช้ Cosmos DB แทนการเก็บข้อมูลในหน่วยความจำ

3. ค่าใช้จ่ายเพิ่มเติมประมาณ: ~$25/เดือน (serverless)

### ระยะที่ 2: เพิ่มบริการที่สาม (การจัดการคำสั่งซื้อ)

**สร้างบริการคำสั่งซื้อ**:

1. โฟลเดอร์ใหม่: `src/order-service/` (Python/Node.js/C#)
2. Bicep ใหม่: `infra/app/order-service.bicep`
3. ปรับปรุง API Gateway ให้ส่งเส้นทาง `/api/orders`
4. เพิ่ม Azure SQL Database สำหรับเก็บคำสั่งซื้อ

**สถาปัตยกรรมจะกลายเป็น**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### ระยะที่ 3: เพิ่มการสื่อสารแบบ Async (Service Bus)

**ดำเนินการสถาปัตยกรรมแบบขับเคลื่อนด้วยเหตุการณ์**:

1. เพิ่ม Azure Service Bus: `infra/core/servicebus.bicep`
2. บริการสินค้าเผยแพร่เหตุการณ์ "ProductCreated"
3. บริการคำสั่งซื้อสมัครรับเหตุการณ์สินค้า
4. เพิ่มบริการแจ้งเตือนเพื่อประมวลผลเหตุการณ์

**รูปแบบ**: Request/Response (HTTP) + Event-Driven (Service Bus)

### ระยะที่ 4: เพิ่มการตรวจสอบสิทธิ์ผู้ใช้

**ดำเนินการบริการผู้ใช้**:

1. สร้าง `src/user-service/` (Go/Node.js)
2. เพิ่ม Azure AD B2C หรือระบบยืนยันตัวตน JWT แบบกำหนดเอง
3. API Gateway ตรวจสอบโทเค็น
4. บริการตรวจสอบสิทธิ์ผู้ใช้

### ระยะที่ 5: ความพร้อมสำหรับการผลิต

**เพิ่มส่วนประกอบเหล่านี้**:
- Azure Front Door (โหลดบาลานซ์ระดับโลก)
- Azure Key Vault (จัดการความลับ)
- Azure Monitor Workbooks (แดชบอร์ดแบบกำหนดเอง)
- CI/CD Pipeline (GitHub Actions)
- การปรับใช้แบบ Blue-Green
- Managed Identity สำหรับทุกบริการ

**ค่าใช้จ่ายสถาปัตยกรรมการผลิตเต็มรูปแบบ**: ~$300-1,400/เดือน

---

## เรียนรู้เพิ่มเติม

### เอกสารที่เกี่ยวข้อง
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### ขั้นตอนถัดไปในคอร์สนี้
- ← ก่อนหน้า: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - ตัวอย่างเริ่มต้นสำหรับ container เดียว
- → ถัดไป: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - เพิ่มความสามารถ AI
- 🏠 [หน้าแรกของคอร์ส](../../README.md)

### การเปรียบเทียบ: เมื่อไหร่ควรใช้แบบใด

**Single Container App** (ตัวอย่าง Simple Flask API):
- ✅ แอปพลิเคชันง่ายๆ
- ✅ สถาปัตยกรรมมอนอลิธิก
- ✅ เร็วในการปรับใช้
- ❌ ขยายขนาดได้จำกัด
- **ค่าใช้จ่าย**: ~$15-50/เดือน

**Microservices** (ตัวอย่างนี้):
- ✅ แอปพลิเคชันที่ซับซ้อน
- ✅ ขยายขนาดแยกบริการได้อิสระ
- ✅ อำนาจอิสระของทีม (บริการต่างกัน ทีมต่างกัน)
- ❌ ยากกว่าที่จะบริหารจัดการ
- **ค่าใช้จ่าย**: ~$60-250/เดือน

**Kubernetes (AKS)**:
- ✅ การควบคุมและความยืดหยุ่นสูงสุด
- ✅ สามารถย้ายข้าม cloud ได้
- ✅ เครือข่ายขั้นสูง
- ❌ ต้องมีความเชี่ยวชาญ Kubernetes
- **ค่าใช้จ่าย**: ขั้นต่ำ ~$150-500/เดือน

**คำแนะนำ**: เริ่มจาก Container Apps (ตัวอย่างนี้) และไป AKS ก็ต่อเมื่อจำเป็นต้องใช้ฟีเจอร์เฉพาะ Kubernetes เท่านั้น

---

## คำถามที่พบบ่อย

**ถาม: ทำไมจึงใช้แค่ 2 บริการแทนที่จะเป็น 5+?**  
ตอบ: เพื่อการเรียนรู้ที่ค่อยเป็นค่อยไป เชี่ยวชาญพื้นฐาน (การสื่อสารของบริการ, การตรวจสอบ, การขยายขนาด) ด้วยตัวอย่างง่ายก่อนเพิ่มความซับซ้อน รูปแบบที่เรียนรู้ที่นี่ใช้ได้กับสถาปัตยกรรม 100 บริการ

**ถาม: ฉันเพิ่มบริการเองได้ไหม?**  
ตอบ: ได้แน่นอน! ทำตามคู่มือขยายด้านบน บริการใหม่แต่ละอย่างทำตามรูปแบบเดียวกัน: สร้างโฟลเดอร์ src, สร้างไฟล์ Bicep, ปรับปรุง azure.yaml, ปรับใช้

**ถาม: ระบบนี้พร้อมสำหรับการผลิตหรือไม่?**  
ตอบ: เป็นพื้นฐานที่มั่นคง สำหรับการผลิต เพิ่ม: managed identity, Key Vault, ฐานข้อมูลถาวร, CI/CD pipeline, การแจ้งเตือนตรวจสอบ, และนโยบายสำรองข้อมูล

**ถาม: ทำไมไม่ใช้ Dapr หรือ service mesh อื่น?**  
ตอบ: รักษาความเรียบง่ายเพื่อการเรียนรู้ เมื่อเข้าใจเครือข่าย Container Apps แล้ว คุณสามารถเพิ่ม Dapr สำหรับสถานการณ์ขั้นสูงได้

**ถาม: ฉันจะแก้ไขข้อผิดพลาดท้องถิ่นอย่างไร?**  
ตอบ: รันบริการภายในเครื่องโดยใช้ Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**ถาม: ฉันใช้ภาษาโปรแกรมอื่นได้ไหม?**  
ตอบ: ได้! ตัวอย่างนี้ใช้ Node.js (gateway) + Python (บริการสินค้า) คุณสามารถผสมภาษาใดก็ได้ที่รันใน container

**ถาม: ถ้าฉันไม่มีเครดิต Azure จะทำอย่างไร?**  
ตอบ: ใช้ระดับฟรีของ Azure (30 วันแรกสำหรับบัญชีใหม่) หรือปรับใช้เพื่อทดสอบสั้น ๆ แล้วลบทันที

---

> **🎓 สรุปเส้นทางการเรียนรู้**: คุณได้เรียนรู้การปรับใช้สถาปัตยกรรมแบบหลายบริการที่มีการปรับขนาดอัตโนมัติ, เครือข่ายภายใน, การตรวจสอบศูนย์กลาง และรูปแบบสำหรับการผลิต พื้นฐานนี้เตรียมคุณสำหรับระบบกระจายตัวที่ซับซ้อนและสถาปัตยกรรมไมโครเซอร์วิสสำหรับองค์กร

**📚 การนำทางคอร์ส:**
- ← ก่อนหน้า: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → ถัดไป: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [หน้าแรกของคอร์ส](../../../README.md)
- 📖 [แนวปฏิบัติที่ดีที่สุดของ Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**: เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาแบบอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้ความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่แม่นยำ เอกสารต้นฉบับในภาษาดั้งเดิมควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญ ควรใช้การแปลโดยมนุษย์ผู้เชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->