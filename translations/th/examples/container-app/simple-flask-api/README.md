# ตัวอย่างแอป Container API Flask ง่าย ๆ

**เส้นทางการเรียนรู้:** ผู้เริ่มต้น ⭐ | **เวลา:** 25-35 นาที | **ค่าใช้จ่าย:** 0-15 ดอลลาร์/เดือน

API REST Python Flask ที่ทำงานครบถ้วนและพร้อมใช้งานและถูกดีพลอยไปที่ Azure Container Apps โดยใช้ Azure Developer CLI (azd) ตัวอย่างนี้แสดงถึงการดีพลอย container, การปรับขนาดอัตโนมัติ และพื้นฐานการมอนิเตอร์

## 🎯 สิ่งที่คุณจะได้เรียนรู้

- ดีพลอยแอปพลิเคชัน Python ที่ถูกใส่ไว้ใน container ไปยัง Azure  
- กำหนดการปรับขนาดอัตโนมัติให้สเกลเป็นศูนย์  
- ใช้ health probes และ readiness checks  
- มอนิเตอร์ logs และ metrics ของแอป  
- ใช้ Azure Developer CLI สำหรับการดีพลอยอย่างรวดเร็ว  

## 📦 สิ่งที่รวมอยู่ในนี้

✅ **แอป Flask** - REST API ครบถ้วนพร้อมการดำเนินงาน CRUD (`src/app.py`)  
✅ **Dockerfile** - การตั้งค่า container พร้อมใช้งานใน production  
✅ **โครงสร้าง Bicep** - สภาพแวดล้อม Container Apps และการดีพลอย API  
✅ **การตั้งค่า AZD** - การตั้งค่าการดีพลอยด้วยคำสั่งเดียว  
✅ **Health Probes** - การตรวจสอบ liveness และ readiness ถูกตั้งค่าแล้ว  
✅ **การปรับขนาดอัตโนมัติ** - 0-10 สำเนาตามโหลด HTTP  

## สถาปัตยกรรม

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## ข้อกำหนดเบื้องต้น

### สิ่งที่ต้องมี
- **Azure Developer CLI (azd)** - [คู่มือการติดตั้ง](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **บัญชี Azure** - [บัญชีฟรี](https://azure.microsoft.com/free/)
- **Docker Desktop** - [ติดตั้ง Docker](https://www.docker.com/products/docker-desktop/) (สำหรับการทดสอบในเครื่อง)

### ตรวจสอบข้อกำหนดเบื้องต้น

```bash
# ตรวจสอบเวอร์ชัน azd (ต้องการ 1.5.0 หรือสูงกว่า)
azd version

# ตรวจสอบการเข้าสู่ระบบ Azure
azd auth login

# ตรวจสอบ Docker (ทางเลือก สำหรับการทดสอบในเครื่อง)
docker --version
```

## ⏱️ ระยะเวลาดีพลอย

| ขั้นตอน | ระยะเวลา | สิ่งที่เกิดขึ้น |
|-------|----------|--------------||
| ตั้งค่าสภาพแวดล้อม | 30 วินาที | สร้างสภาพแวดล้อม azd |
| สร้าง container | 2-3 นาที | สร้างแอป Flask ด้วย Docker |
| เตรียมโครงสร้างพื้นฐาน | 3-5 นาที | สร้าง Container Apps, registry, มอนิเตอร์ |
| ดีพลอยแอปพลิเคชัน | 2-3 นาที | ส่ง image และดีพลอยไป Container Apps |
| **รวมทั้งหมด** | **8-12 นาที** | การดีพลอยเสร็จสมบูรณ์พร้อมใช้งาน |

## เริ่มต้นอย่างรวดเร็ว

```bash
# นำทางไปยังตัวอย่าง
cd examples/container-app/simple-flask-api

# เริ่มต้นสภาพแวดล้อม (เลือกชื่อที่ไม่ซ้ำ)
azd env new myflaskapi

# ติดตั้งทุกอย่าง (โครงสร้างพื้นฐาน + แอปพลิเคชัน)
azd up
# คุณจะถูกถามให้:
# 1. เลือกการสมัครใช้งาน Azure
# 2. เลือกตำแหน่งที่ตั้ง (เช่น eastus2)
# 3. รอ 8-12 นาทีสำหรับการติดตั้ง

# รับจุดสิ้นสุด API ของคุณ
azd env get-values

# ทดสอบ API
curl $(azd env get-value API_ENDPOINT)/health
```

**ผลลัพธ์ที่คาดหวัง:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ ตรวจสอบการดีพลอย

### ขั้นตอนที่ 1: ตรวจสอบสถานะการดีพลอย

```bash
# ดูบริการที่ปรับใช้งานแล้ว
azd show

# ผลลัพธ์ที่คาดหวังแสดง:
# - บริการ: api
# - จุดเชื่อมต่อ: https://ca-api-[env].xxx.azurecontainerapps.io
# - สถานะ: กำลังทำงาน
```

### ขั้นตอนที่ 2: ทดสอบ Endpoint API

```bash
# รับ API endpoint
API_URL=$(azd env get-value API_ENDPOINT)

# ทดสอบสถานะสุขภาพ
curl $API_URL/health

# ทดสอบ root endpoint
curl $API_URL/

# สร้างรายการ
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# รับรายการทั้งหมด
curl $API_URL/api/items
```

**เกณฑ์ความสำเร็จ:**
- ✅ endpoint สุขภาพตอบ HTTP 200  
- ✅ endpoint รากแสดงข้อมูล API  
- ✅ POST สร้างรายการและส่ง HTTP 201  
- ✅ GET ส่งคืนรายการที่ถูกสร้าง

### ขั้นตอนที่ 3: ดูบันทึก (Logs)

```bash
# สตรีมบันทึกสดโดยใช้ azd monitor
azd monitor --logs

# หรือใช้ Azure CLI:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# คุณควรจะเห็น:
# - ข้อความเริ่มต้น Gunicorn
# - บันทึกคำขอ HTTP
# - บันทึกข้อมูลแอปพลิเคชัน
```

## โครงสร้างโปรเจกต์

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## Endpoint API

| Endpoint | วิธีการ | คำอธิบาย |
|----------|--------|-------------|
| `/health` | GET | เช็คสุขภาพแอป |
| `/api/items` | GET | แสดงรายการทั้งหมด |
| `/api/items` | POST | สร้างรายการใหม่ |
| `/api/items/{id}` | GET | รับข้อมูลรายการ |
| `/api/items/{id}` | PUT | อัปเดตรายการ |
| `/api/items/{id}` | DELETE | ลบรายการ |

## การตั้งค่า

### ตัวแปรสภาพแวดล้อม

```bash
# ตั้งค่าการกำหนดค่าที่กำหนดเอง
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### การตั้งค่าการปรับขนาด

API จะปรับขนาดโดยอัตโนมัติตามปริมาณการร้องขอ HTTP:
- **จำนวนสำเนาขั้นต่ำ**: 0 (สเกลเป็นศูนย์เมื่อไม่มีการใช้งาน)  
- **จำนวนสำเนาสูงสุด**: 10  
- **จำนวนคำขอพร้อมกันต่อสำเนา**: 50  

## การพัฒนา

### รันในเครื่อง

```bash
# ติดตั้ง dependencies
cd src
pip install -r requirements.txt

# รันแอป
python app.py

# ทดสอบในเครื่อง
curl http://localhost:8000/health
```

### สร้างและทดสอบ container

```bash
# สร้าง Docker image
docker build -t flask-api:local ./src

# รันคอนเทนเนอร์ในเครื่อง
docker run -p 8000:8000 flask-api:local

# ทดสอบคอนเทนเนอร์
curl http://localhost:8000/health
```

## การดีพลอย

### ดีพลอยแบบเต็มรูปแบบ

```bash
# ปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน
azd up
```

### ดีพลอยเฉพาะโค้ด

```bash
# เผยแพร่เฉพาะโค้ดแอปพลิเคชัน (โครงสร้างพื้นฐานไม่เปลี่ยนแปลง)
azd deploy api
```

### อัปเดตการตั้งค่า

```bash
# อัปเดตตัวแปรสิ่งแวดล้อม
azd env set API_KEY "new-api-key"

# นำส่งใหม่ด้วยการกำหนดค่าที่อัปเดตแล้ว
azd deploy api
```

## การมอนิเตอร์

### ดูบันทึก (Logs)

```bash
# สตรีมบันทึกสดโดยใช้ azd monitor
azd monitor --logs

# หรือใช้ Azure CLI สำหรับ Container Apps:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# ดู 100 บรรทัดล่าสุด
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### มอนิเตอร์ Metrics

```bash
# เปิดแดชบอร์ด Azure Monitor
azd monitor --overview

# ดูเมตริกเฉพาะเจาะจง
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## การทดสอบ

### เช็คสุขภาพ

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

ผลลัพธ์ที่คาดหวัง:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### สร้างรายการ

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### รับรายการทั้งหมด

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## การประหยัดค่าใช้จ่าย

การดีพลอยนี้ใช้การสเกลเป็นศูนย์ ดังนั้นคุณจะจ่ายเฉพาะเมื่อ API กำลังประมวลผลคำร้องขอเท่านั้น:

- **ค่าใช้จ่ายเมื่อไม่มีการใช้งาน**: ~0 ดอลลาร์/เดือน (สเกลเป็นศูนย์)  
- **ค่าใช้จ่ายเมื่อใช้งาน**: ~0.000024 ดอลลาร์/วินาทีต่อสำเนา  
- **ค่าใช้จ่ายรายเดือนโดยประมาณ** (ใช้งานเบา): 5-15 ดอลลาร์  

### ลดค่าใช้จ่ายเพิ่มเติม

```bash
# ลดจำนวนรีพลิคาสูงสุดสำหรับการพัฒนา
azd env set MAX_REPLICAS 3

# ใช้ระยะเวลาหยุดทำงานที่สั้นลง
azd env set SCALE_TO_ZERO_TIMEOUT 300  # 5 นาที
```

## การแก้ไขปัญหา

### Container ไม่เริ่มทำงาน

```bash
# ตรวจสอบบันทึกคอนเทนเนอร์โดยใช้ Azure CLI
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# ตรวจสอบการสร้างภาพ Docker ในเครื่อง
docker build -t test ./src
```

### ไม่สามารถเข้าถึง API

```bash
# ตรวจสอบว่า ingress เป็นภายนอกหรือไม่
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### เวลาตอบสนองช้า

```bash
# ตรวจสอบการใช้งาน CPU/หน่วยความจำ
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# ขยายทรัพยากรหากจำเป็น
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## ทำความสะอาด

```bash
# ลบทรัพยากรทั้งหมด
azd down --force --purge
```

## ขั้นตอนถัดไป

### ขยายตัวอย่างนี้

1. **เพิ่มฐานข้อมูล** - รวม Azure Cosmos DB หรือ SQL Database  
   ```bash
   # เพิ่มโมดูล Cosmos DB ไปยัง infra/main.bicep
   # อัปเดต app.py พร้อมการเชื่อมต่อฐานข้อมูล
   ```

2. **เพิ่มการยืนยันตัวตน** - ใช้ Azure AD หรือ API keys  
   ```python
   # เพิ่ม middleware การตรวจสอบสิทธิ์ใน app.py
   from functools import wraps
   ```

3. **ตั้งค่า CI/CD** - Workflow ของ GitHub Actions  
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **เพิ่ม Managed Identity** - ปลอดภัยสำหรับการเข้าใช้บริการ Azure  
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### ตัวอย่างที่เกี่ยวข้อง

- **[Database App](../../../../../examples/database-app)** - ตัวอย่างครบถ้วนกับ SQL Database  
- **[Microservices](../../../../../examples/container-app/microservices)** - สถาปัตยกรรมหลายบริการ  
- **[Container Apps Master Guide](../README.md)** - รูปแบบ container ทั้งหมด  

### แหล่งการเรียนรู้

- 📚 [คอร์ส AZD สำหรับผู้เริ่มต้น](../../../README.md) - หน้าโฮมหลักของคอร์ส  
- 📚 [รูปแบบ Container Apps](../README.md) - รูปแบบการดีพลอยเพิ่มเติม  
- 📚 [แกลเลอรีเทมเพลต AZD](https://azure.github.io/awesome-azd/) - เทมเพลตจากชุมชน  

## แหล่งข้อมูลเพิ่มเติม

### เอกสาร
- **[เอกสาร Flask](https://flask.palletsprojects.com/)** - คู่มือเฟรมเวิร์ค Flask  
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - เอกสาร Azure อย่างเป็นทางการ  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - อ้างอิงคำสั่ง azd  

### บทเรียน
- **[เริ่มต้น Container Apps อย่างรวดเร็ว](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - ดีพลอยแอปแรกของคุณ  
- **[Python บน Azure](https://learn.microsoft.com/azure/developer/python/)** - คู่มือพัฒนา Python  
- **[ภาษา Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - โครงสร้างพื้นฐานเป็นโค้ด  

### เครื่องมือ
- **[Azure Portal](https://portal.azure.com)** - จัดการทรัพยากรด้วยภาพ  
- **[ส่วนขยาย VS Code Azure](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - การรวม IDE  

---

**🎉 ยินดีด้วย!** คุณได้ดีพลอย Flask API สำหรับ production บน Azure Container Apps พร้อมการปรับขนาดอัตโนมัติและการมอนิเตอร์เรียบร้อยแล้ว

**มีคำถาม?** [เปิดข้อเสนอแนะ](https://github.com/microsoft/AZD-for-beginners/issues) หรือดูที่ [FAQ](../../../resources/faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ประกาศแจ้งเตือน**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เรามุ่งมั่นที่จะให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความคลาดเคลื่อนได้ เอกสารต้นฉบับในภาษาต้นทางถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลสำคัญ ขอแนะนำให้ใช้บริการแปลโดยนักแปลมืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->