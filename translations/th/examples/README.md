# ตัวอย่าง - เทมเพลตและการกำหนดค่า AZD ที่ใช้งานจริง

**เรียนรู้ผ่านตัวอย่าง - จัดตามบทเรียน**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../README.md)
- **📖 แผนที่บทเรียน**: ตัวอย่างจัดตามความซับซ้อนของการเรียนรู้
- **🚀 ตัวอย่างท้องถิ่น**: [โซลูชัน Multi-Agent สำหรับค้าปลีก](retail-scenario.md)
- **🤖 ตัวอย่าง AI ภายนอก**: ลิงก์ไปยังที่เก็บ Azure Samples

> **📍 สำคัญ: ตัวอย่างท้องถิ่น vs ตัวอย่างภายนอก**  
> ที่เก็บนี้ประกอบด้วย **4 ตัวอย่างท้องถิ่นที่สมบูรณ์** พร้อมการใช้งานเต็มรูปแบบ:  
> - **Microsoft Foundry Models Chat** (การปรับใช้งาน gpt-4.1 พร้อมอินเทอร์เฟซแชท)  
> - **Container Apps** (API Flask แบบง่าย + ไมโครเซอร์วิส)  
> - **Database App** (เว็บ + ฐานข้อมูล SQL)  
> - **Retail Multi-Agent** (โซลูชัน AI สำหรับองค์กร)  
>  
> ตัวอย่างเพิ่มเติมเป็น **ลิงก์อ้างอิงภายนอก** ไปยังที่เก็บ Azure-Samples ที่คุณสามารถโคลนได้

## บทนำ

ไดเรกทอรีนี้มีตัวอย่างใช้งานจริงและแหล่งอ้างอิงเพื่อช่วยให้คุณเรียนรู้ Azure Developer CLI ผ่านการฝึกปฏิบัติ สถานการณ์ Retail Multi-Agent เป็นการใช้งานที่พร้อมสำหรับการผลิต ซึ่งรวมอยู่ในที่เก็บนี้ ตัวอย่างเพิ่มเติมอ้างอิงถึง Azure Samples อย่างเป็นทางการที่แสดงรูปแบบ AZD ต่างๆ

### คำอธิบายระดับความซับซ้อน

- ⭐ **ผู้เริ่มต้น** - แนวคิดพื้นฐาน บริการเดี่ยว 15-30 นาที
- ⭐⭐ **ระดับกลาง** - หลายบริการ รวมฐานข้อมูล 30-60 นาที
- ⭐⭐⭐ **ขั้นสูง** - สถาปัตยกรรมซับซ้อน รวม AI 1-2 ชั่วโมง
- ⭐⭐⭐⭐ **ผู้เชี่ยวชาญ** - พร้อมใช้งานในผลิตภัณฑ์ รูปแบบองค์กร 2 ชั่วโมงขึ้นไป

## 🎯 สิ่งที่มีในที่เก็บนี้จริงๆ

### ✅ การใช้งานท้องถิ่น (พร้อมใช้งาน)

#### [แอป Microsoft Foundry Models Chat](azure-openai-chat/README.md) 🆕  
**การปรับใช้ gpt-4.1 พร้อมอินเทอร์เฟซแชทสมบูรณ์รวมในที่เก็บนี้**

- **ที่ตั้ง:** `examples/azure-openai-chat/`
- **ความซับซ้อน:** ⭐⭐ (ระดับกลาง)
- **สิ่งที่รวมในชุดนี้:**
  - การปรับใช้ Microsoft Foundry Models แบบสมบูรณ์ (gpt-4.1)
  - อินเทอร์เฟซแชทบนบรรทัดคำสั่ง Python
  - การเชื่อมต่อ Key Vault สำหรับจัดการคีย์ API อย่างปลอดภัย
  - เทมเพลตโครงสร้างพื้นฐาน Bicep
  - การติดตามการใช้โทเค็นและค่าใช้จ่าย
  - การจำกัดอัตราและการจัดการข้อผิดพลาด

**เริ่มต้นอย่างรวดเร็ว:**  
```bash
# ไปยังตัวอย่าง
cd examples/azure-openai-chat

# ติดตั้งทั้งหมด
azd up

# ติดตั้งไลบรารีที่จำเป็นและเริ่มสนทนา
pip install -r src/requirements.txt
python src/chat.py
```
  
**เทคโนโลยี:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [ตัวอย่างแอป Container](container-app/README.md) 🆕  
**ตัวอย่างการปรับใช้คอนเทนเนอร์อย่างครบถ้วนรวมในที่เก็บนี้**

- **ที่ตั้ง:** `examples/container-app/`
- **ความซับซ้อน:** ⭐-⭐⭐⭐⭐ (เริ่มต้นถึงขั้นสูง)
- **สิ่งที่รวมในชุดนี้:**
  - [คู่มือหลัก](container-app/README.md) - ภาพรวมการปรับใช้คอนเทนเนอร์อย่างสมบูรณ์
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - ตัวอย่าง API REST พื้นฐาน
  - [ไมโครเซอร์วิส](../../../examples/container-app/microservices) - การปรับใช้หลายบริการพร้อมพร้อมใช้งานในผลิตภัณฑ์
  - รูปแบบเริ่มต้นอย่างรวดเร็ว, การทำงานในผลิตภัณฑ์, ขั้นสูง
  - การตรวจสอบ, ความปลอดภัย และการปรับค่าใช้จ่าย

**เริ่มต้นอย่างรวดเร็ว:**  
```bash
# ดูคู่มือหลัก
cd examples/container-app

# เรียกใช้งาน Flask API ง่ายๆ
cd simple-flask-api
azd up

# ตัวอย่างการใช้งานไมโครเซอร์วิส
cd ../microservices
azd up
```
  
**เทคโนโลยี:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [โซลูชัน Retail Multi-Agent](retail-scenario.md) 🆕  
**การใช้งานพร้อมผลิตภัณฑ์สมบูรณ์รวมในที่เก็บนี้**

- **ที่ตั้ง:** `examples/retail-multiagent-arm-template/`
- **ความซับซ้อน:** ⭐⭐⭐⭐ (ขั้นสูง)
- **สิ่งที่รวมในชุดนี้:**
  - เทมเพลตการปรับใช้ ARM แบบสมบูรณ์
  - สถาปัตยกรรมหลายตัวแทน (ลูกค้า + สินค้าคงคลัง)
  - การเชื่อมต่อ Microsoft Foundry Models
  - AI Search พร้อม RAG
  - การตรวจสอบครบวงจร
  - สคริปต์ปรับใช้เพียงคลิกเดียว

**เริ่มต้นอย่างรวดเร็ว:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**เทคโนโลยี:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 ตัวอย่าง Azure ภายนอก (โคลนเพื่อใช้งาน)

ตัวอย่างต่อไปนี้ถูกดูแลโดยที่เก็บ Azure-Samples อย่างเป็นทางการ โคลนเพื่อสำรวจรูปแบบ AZD ต่างๆ:

### แอปพลิเคชันง่ายๆ (บทที่ 1-2)

| เทมเพลต | ที่เก็บ | ความซับซ้อน | บริการ |
|:---------|:--------|:-------------|:-------|
| **Python Flask API** | [ท้องถิ่น: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **ไมโครเซอร์วิส** | [ท้องถิ่น: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | บริการหลายตัว, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**วิธีใช้งาน:**  
```bash
# โคลนตัวอย่างใดก็ได้
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# ติดตั้งใช้งาน
azd up
```
  
### ตัวอย่างแอป AI (บทที่ 2, 5, 8)

| เทมเพลต | ที่เก็บ | ความซับซ้อน | มุ่งเน้น |
|:---------|:--------|:-------------|:---------|
| **Microsoft Foundry Models Chat** | [ท้องถิ่น: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | การปรับใช้ gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | แชท AI พื้นฐาน |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | แพลตฟอร์มเอเจนต์ |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | รูปแบบ RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | AI สำหรับองค์กร |

### ฐานข้อมูล & รูปแบบขั้นสูง (บทที่ 3-8)

| เทมเพลต | ที่เก็บ | ความซับซ้อน | มุ่งเน้น |
|:---------|:--------|:-------------|:---------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | การผนวกฐานข้อมูล |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL แบบ serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | บริการหลายตัว |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## เป้าหมายการเรียนรู้

เมื่อทำตัวอย่างเหล่านี้ คุณจะได้:
- ฝึกเวิร์กโฟลว์ Azure Developer CLI ด้วยสถานการณ์แอปพลิเคชันจริง
- เข้าใจสถาปัตยกรรมแอปที่หลากหลายและการใช้งาน azd
- เชี่ยวชาญรูปแบบ Infrastructure as Code สำหรับบริการ Azure ต่างๆ
- นำกลยุทธ์การจัดการการกำหนดค่าและการปรับใช้เฉพาะสภาพแวดล้อมไปใช้
- นำรูปแบบการตรวจสอบ ความปลอดภัย และการปรับขนาดไปใช้ในบริบทใช้งานจริง
- สั่งสมประสบการณ์การแก้ปัญหาและการดีบักสถานการณ์การปรับใช้จริง

## ผลลัพธ์การเรียนรู้

หลังจากจบตัวอย่างเหล่านี้ คุณจะสามารถ:
- ปรับใช้แอปพลิเคชันหลากหลายประเภทโดยใช้ Azure Developer CLI อย่างมั่นใจ
- ปรับเทมเพลตที่ให้มาให้เหมาะกับความต้องการแอปพลิเคชันของตนเอง
- ออกแบบและใช้งานรูปแบบโครงสร้างพื้นฐานที่กำหนดเองโดยใช้ Bicep
- กำหนดค่าการทำงานของแอปหลายบริการที่ซับซ้อนพร้อมการจัดการความสัมพันธ์ที่เหมาะสม
- นำแนวทางปฏิบัติที่ดีที่สุดด้านความปลอดภัย การตรวจสอบ และประสิทธิภาพไปใช้ในสถานการณ์จริง
- แก้ไขปัญหาและเพิ่มประสิทธิภาพการปรับใช้ตามประสบการณ์ใช้งานจริง

## โครงสร้างไดเรกทอรี

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```
  
## ตัวอย่างเริ่มต้นอย่างรวดเร็ว

> **💡 ใหม่กับ AZD?** เริ่มที่ตัวอย่าง #1 (Flask API) - ใช้เวลาประมาณ 20 นาทีและสอนแนวคิดหลัก

### สำหรับผู้เริ่มต้น
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (ท้องถิ่น) ⭐  
   ปรับใช้ REST API แบบง่ายพร้อมสเกลเป็นศูนย์  
   **เวลา:** 20-25 นาที | **ค่าใช้จ่าย:** $0-5/เดือน  
   **สิ่งที่จะได้เรียนรู้:** เวิร์กโฟลว์ azd พื้นฐาน, การคอนเทนเนอไรซ์, การตรวจสุขภาพ  
   **ผลลัพธ์ที่คาดหวัง:** จุดเชื่อมต่อ API ทำงานคืนค่า "Hello, World!" พร้อมการตรวจสอบ

2. **[เว็บแอปง่ายๆ - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   ปรับใช้แอปเว็บ Node.js Express พร้อม MongoDB  
   **เวลา:** 25-35 นาที | **ค่าใช้จ่าย:** $10-30/เดือน  
   **สิ่งที่จะได้เรียนรู้:** การผนวกฐานข้อมูล, ตัวแปรแวดล้อม, สตริงเชื่อมต่อ  
   **ผลลัพธ์ที่คาดหวัง:** แอปรายการที่ต้องทำพร้อมฟังก์ชันสร้าง/อ่าน/อัปเดต/ลบ

3. **[เว็บไซต์สแตติก - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   โฮสต์เว็บไซต์ React แบบสแตติกด้วย Azure Static Web Apps  
   **เวลา:** 20-30 นาที | **ค่าใช้จ่าย:** $0-10/เดือน  
   **สิ่งที่จะได้เรียนรู้:** การโฮสต์แบบสแตติก, ฟังก์ชัน serverless, การปรับใช้ CDN  
   **ผลลัพธ์ที่คาดหวัง:** UI React พร้อมแบ็กเอนด์ API, SSL อัตโนมัติ, CDN ทั่วโลก

### สำหรับผู้ใช้ระดับกลาง
4. **[แอป Microsoft Foundry Models Chat](../../../examples/azure-openai-chat)** (ท้องถิ่น) ⭐⭐  
   ปรับใช้ gpt-4.1 พร้อมอินเทอร์เฟซแชทและจัดการคีย์ API อย่างปลอดภัย  
   **เวลา:** 35-45 นาที | **ค่าใช้จ่าย:** $50-200/เดือน  
   **สิ่งที่จะได้เรียนรู้:** การปรับใช้ Microsoft Foundry Models, การผนวก Key Vault, การติดตามโทเค็น  
   **ผลลัพธ์ที่คาดหวัง:** แอปแชทใช้งานได้ด้วย gpt-4.1 พร้อมการตรวจสอบค่าใช้จ่าย

5. **[Container App - ไมโครเซอร์วิส](../../../examples/container-app/microservices)** (ท้องถิ่น) ⭐⭐⭐⭐  
   สถาปัตยกรรมหลายบริการพร้อมใช้งานในผลิตภัณฑ์  
   **เวลา:** 45-60 นาที | **ค่าใช้จ่าย:** $50-150/เดือน  
   **สิ่งที่จะได้เรียนรู้:** การสื่อสารบริการ, การคิวข้อความ, การติดตามแบบกระจาย  
   **ผลลัพธ์ที่คาดหวัง:** ระบบ 2 บริการ (API Gateway + บริการสินค้า) พร้อมการตรวจสอบ

6. **[Database App - C# กับ Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   เว็บแอปพร้อม API C# และฐานข้อมูล Azure SQL  
   **เวลา:** 30-45 นาที | **ค่าใช้จ่าย:** $20-80/เดือน  
   **สิ่งที่จะได้เรียนรู้:** Entity Framework, การย้ายฐานข้อมูล, ความปลอดภัยการเชื่อมต่อ  
   **ผลลัพธ์ที่คาดหวัง:** API C# พร้อมแบ็กเอนด์ Azure SQL และปรับใช้สคีมาอัตโนมัติ

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions พร้อมทริกเกอร์ HTTP และ Cosmos DB  
   **เวลา:** 30-40 นาที | **ค่าใช้จ่าย:** $10-40/เดือน  
   **สิ่งที่จะได้เรียนรู้:** สถาปัตยกรรมขับเคลื่อนด้วยเหตุการณ์, การปรับสเกล serverless, การผนวก NoSQL  
   **ผลลัพธ์ที่คาดหวัง:** แอปฟังก์ชันตอบสนองคำขอ HTTP พร้อมเก็บข้อมูล Cosmos DB

8. **[ไมโครเซอร์วิส - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   แอป Java หลายบริการพร้อม Container Apps และเกตเวย์ API  
   **เวลา:** 60-90 นาที | **ค่าใช้จ่าย:** $80-200/เดือน  
   **สิ่งที่จะได้เรียนรู้:** การปรับใช้ Spring Boot, service mesh, การบาลานซ์โหลด  
   **ผลลัพธ์ที่คาดหวัง:** ระบบ Java หลายบริการพร้อมค้นหาบริการและการจัดเส้นทาง

### เทมเพลต Microsoft Foundry

1. **[แอป Microsoft Foundry Models Chat - ตัวอย่างท้องถิ่น](../../../examples/azure-openai-chat)** ⭐⭐  
   การปรับใช้ gpt-4.1 พร้อมอินเทอร์เฟซแชทสมบูรณ์  
   **เวลา:** 35-45 นาที | **ค่าใช้จ่าย:** $50-200/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** แอปแชทใช้งานพร้อมติดตามโทเค็นและตรวจสอบค่าใช้จ่าย

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   แอปแชทอัจฉริยะด้วยสถาปัตยกรรม RAG  
   **เวลา:** 60-90 นาที | **ค่าใช้จ่าย:** $100-300/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** อินเทอร์เฟซแชทขับเคลื่อนด้วย RAG พร้อมการค้นหาเอกสารและการอ้างอิง

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   วิเคราะห์เอกสารโดยใช้บริการ Azure AI  
   **เวลา:** 40-60 นาที | **ค่าใช้จ่าย:** $20-80/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** API สำหรับสกัดข้อความ ตาราง และเอนทิตีจากเอกสารที่อัปโหลด

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   เวิร์กโฟลว์ MLOps ด้วย Azure Machine Learning  
   **เวลา:** 2-3 ชั่วโมง | **ค่าใช้จ่าย:** $150-500/เดือน  
   **ผลลัพธ์ที่คาดหวัง:** ท่อ ML อัตโนมัติพร้อมการฝึกสอน ปรับใช้ และตรวจสอบ

### สถานการณ์โลกจริง

#### **โซลูชัน Retail Multi-Agent** 🆕  
**[คู่มือการใช้งานสมบูรณ์](./retail-scenario.md)**

โซลูชันระบบหลายตัวแทนสำหรับสนับสนุนลูกค้าพร้อมการใช้งาน AI ระดับองค์กรที่แสดงการปรับใช้แอป AI ขั้นสูงด้วย AZD สถานการณ์นี้ประกอบด้วย:

- **สถาปัตยกรรมสมบูรณ์**: ระบบหลายตัวแทนพร้อมตัวแทนบริการลูกค้าและการจัดการสินค้าคงคลังโดยเฉพาะเจาะจง
- **โครงสร้างพื้นฐานสำหรับการผลิต**: การปรับใช้ Microsoft Foundry Models หลายภูมิภาค, AI Search, Container Apps และการตรวจสอบอย่างครบถ้วน  
- **ARM Template พร้อมใช้งานสำหรับการปรับใช้**: การปรับใช้ด้วยคลิกเดียวพร้อมโหมดการกำหนดค่าหลายแบบ (Minimal/Standard/Premium)  
- **ฟีเจอร์ขั้นสูง**: การตรวจสอบความปลอดภัยแบบ red teaming, กรอบการประเมินตัวแทน, การเพิ่มประสิทธิภาพค่าใช้จ่าย และคำแนะนำการแก้ไขปัญหา  
- **บริบทธุรกิจจริง**: กรณีใช้งานการสนับสนุนลูกค้าร้านค้าปลีกพร้อมการอัปโหลดไฟล์, การผนวกรวมการค้นหา และการปรับขนาดแบบไดนามิก  

**เทคโนโลยี**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**ความซับซ้อน**: ⭐⭐⭐⭐ (ขั้นสูง - พร้อมใช้งานในระดับองค์กร)  

**เหมาะสำหรับ**: นักพัฒนา AI, สถาปนิกโซลูชัน และทีมที่สร้างระบบตัวแทนหลายตัวสำหรับการผลิต  

**เริ่มต้นอย่างรวดเร็ว**: ปรับใช้โซลูชันครบถ้วนภายใน 30 นาทีโดยใช้ ARM template ที่แนบมาพร้อมคำสั่ง `./deploy.sh -g myResourceGroup`  

## 📋 คำแนะนำการใช้งาน  

### ข้อกำหนดเบื้องต้น  

ก่อนรันตัวอย่างใด ๆ:  
- ✅ มีการสมัครใช้งาน Azure พร้อมสิทธิ์ Owner หรือ Contributor  
- ✅ ติดตั้ง Azure Developer CLI ([คู่มือการติดตั้ง](../docs/chapter-01-foundation/installation.md))  
- ✅ รัน Docker Desktop (สำหรับตัวอย่าง container)  
- ✅ มีโควต้าของ Azure ที่เหมาะสม (ตรวจสอบความต้องการเฉพาะตัวอย่าง)  

> **💰 คำเตือนเรื่องค่าใช้จ่าย:** ทุกตัวอย่างจะสร้างทรัพยากร Azure จริงที่มีค่าใช้จ่าย โปรดดูไฟล์ README แต่ละตัวอย่างสำหรับการประเมินค่าใช้จ่าย อย่าลืมรันคำสั่ง `azd down` เมื่อเสร็จสิ้นเพื่อหลีกเลี่ยงค่าใช้จ่ายต่อเนื่อง  

### การรันตัวอย่างในเครื่อง  

1. **โคลนหรือคัดลอกตัวอย่าง**  
   ```bash
   # ไปยังตัวอย่างที่ต้องการ
   cd examples/simple-web-app
   ```
  
2. **เริ่มต้นสภาพแวดล้อม AZD**  
   ```bash
   # เริ่มต้นด้วยเทมเพลตที่มีอยู่
   azd init
   
   # หรือสร้างสภาพแวดล้อมใหม่
   azd env new my-environment
   ```
  
3. **กำหนดค่าสภาพแวดล้อม**  
   ```bash
   # ตั้งค่าตัวแปรที่จำเป็น
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **ปรับใช้**  
   ```bash
   # ปรับใช้โครงสร้างพื้นฐานและแอปพลิเคชัน
   azd up
   ```
  
5. **ตรวจสอบการปรับใช้**  
   ```bash
   # รับจุดสิ้นสุดของบริการ
   azd env get-values
   
   # ทดสอบจุดสิ้นสุด (ตัวอย่าง)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **ตัวชี้วัดความสำเร็จที่คาดหวัง:**  
   - ✅ คำสั่ง `azd up` สำเร็จโดยไม่มีข้อผิดพลาด  
   - ✅ จุดเชื่อมต่อบริการตอบกลับ HTTP 200  
   - ✅ Azure Portal แสดงสถานะ "Running"  
   - ✅ Application Insights รับข้อมูลเทเลเมทรี  

> **⚠️ มีปัญหา?** ดู [ปัญหาทั่วไป](../docs/chapter-07-troubleshooting/common-issues.md) สำหรับคำแนะนำแก้ไขปัญหาการปรับใช้  

### การปรับแต่งตัวอย่าง  

แต่ละตัวอย่างประกอบด้วย:  
- **README.md** - คำแนะนำการตั้งค่าและปรับแต่งโดยละเอียด  
- **azure.yaml** - การกำหนดค่า AZD พร้อมคำอธิบาย  
- **infra/** - เทมเพลต Bicep พร้อมคำอธิบายพารามิเตอร์  
- **src/** - โค้ดตัวอย่างแอปพลิเคชัน  
- **scripts/** - สคริปต์ช่วยเหลือสำหรับงานทั่วไป  

## 🎯 วัตถุประสงค์การเรียนรู้  

### หมวดหมู่ตัวอย่าง  

#### **การปรับใช้เบื้องต้น**  
- แอปพลิเคชันบริการเดียว  
- รูปแบบโครงสร้างพื้นฐานง่าย ๆ  
- การจัดการการกำหนดค่าพื้นฐาน  
- การตั้งค่าการพัฒนาที่คุ้มค่า  

#### **สถานการณ์ที่ซับซ้อน**  
- สถาปัตยกรรมบริการหลายตัว  
- การกำหนดค่าเครือข่ายที่ซับซ้อน  
- รูปแบบการผนวกรวมฐานข้อมูล  
- การใช้งานด้านความปลอดภัยและการปฏิบัติตามข้อกำหนด  

#### **รูปแบบที่พร้อมใช้งานในระดับการผลิต**  
- การกำหนดค่าความพร้อมใช้งานสูง  
- การตรวจสอบและการมองเห็น  
- การผนวกรวม CI/CD  
- การตั้งค่าการกู้คืนจากภัยพิบัติ  

## 📖 คำอธิบายตัวอย่าง  

### แอปเว็บง่าย ๆ - Node.js Express  
**เทคโนโลยี**: Node.js, Express, MongoDB, Container Apps  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การปรับใช้พื้นฐาน, REST API, การผนวกรวมฐานข้อมูล NoSQL  

### เว็บไซต์สแตติก - React SPA  
**เทคโนโลยี**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การโฮสต์สแตติก, backend แบบ serverless, การพัฒนาเว็บสมัยใหม่  

### Container App - Python Flask  
**เทคโนโลยี**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**ความซับซ้อน**: ผู้เริ่มต้น  
**แนวคิด**: การใช้งาน container, REST API, การปรับสเกลเป็นศูนย์, การสอบสุขภาพ, การตรวจสอบ  
**ตำแหน่งที่ตั้ง**: [ตัวอย่างในเครื่อง](../../../examples/container-app/simple-flask-api)  

### Container App - สถาปัตยกรรมไมโครเซอร์วิส  
**เทคโนโลยี**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**ความซับซ้อน**: ขั้นสูง  
**แนวคิด**: สถาปัตยกรรมหลายบริการ, การสื่อสารระหว่างบริการ, คิวข้อความ, การตรวจสอบแบบกระจาย  
**ตำแหน่งที่ตั้ง**: [ตัวอย่างในเครื่อง](../../../examples/container-app/microservices)  

### แอปฐานข้อมูล - C# กับ Azure SQL  
**เทคโนโลยี**: C# ASP.NET Core, Azure SQL Database, App Service  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: Entity Framework, การเชื่อมต่อฐานข้อมูล, การพัฒนาเว็บ API  

### Serverless Function - Python Azure Functions  
**เทคโนโลยี**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: สถาปัตยกรรมแบบ event-driven, การประมวลผลแบบ serverless, การพัฒนาแบบ full-stack  

### ไมโครเซอร์วิส - Java Spring Boot  
**เทคโนโลยี**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: การสื่อสารไมโครเซอร์วิส, ระบบกระจาย, รูปแบบระดับองค์กร  

### ตัวอย่าง Microsoft Foundry  

#### แอปแชท Microsoft Foundry Models  
**เทคโนโลยี**: Microsoft Foundry Models, Azure AI Search, App Service  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: สถาปัตยกรรม RAG, การค้นหาเวกเตอร์, การผนวกรวม LLM  

#### การประมวลผลเอกสาร AI  
**เทคโนโลยี**: Azure AI Document Intelligence, Storage, Functions  
**ความซับซ้อน**: ระดับกลาง  
**แนวคิด**: การวิเคราะห์เอกสาร, OCR, การดึงข้อมูล  

#### pipeline การเรียนรู้ของเครื่อง  
**เทคโนโลยี**: Azure ML, MLOps, Container Registry  
**ความซับซ้อน**: ขั้นสูง  
**แนวคิด**: การฝึกโมเดล, การปรับใช้แบบ pipeline, การตรวจสอบ  

## 🛠 ตัวอย่างการกำหนดค่า  

ไดเรกทอรี `configurations/` ประกอบด้วยส่วนประกอบที่นำกลับมาใช้ใหม่ได้:  

### การกำหนดค่าสภาพแวดล้อม  
- การตั้งค่าสภาพแวดล้อมการพัฒนา  
- การกำหนดค่าสภาพแวดล้อม staging  
- การกำหนดค่าพร้อมใช้งานสำหรับการผลิต  
- การตั้งค่าการปรับใช้หลายภูมิภาค  

### โมดูล Bicep  
- ส่วนประกอบโครงสร้างพื้นฐานที่นำกลับมาใช้ใหม่ได้  
- รูปแบบทรัพยากรทั่วไป  
- เทมเพลตเสริมความปลอดภัย  
- การกำหนดค่าที่เพิ่มประสิทธิภาพค่าใช้จ่าย  

### สคริปต์ช่วยเหลือ  
- อัตโนมัติการตั้งค่าสภาพแวดล้อม  
- สคริปต์การย้ายฐานข้อมูล  
- เครื่องมือการตรวจสอบการปรับใช้  
- ยูทิลิตี้ตรวจสอบค่าใช้จ่าย  

## 🔧 คู่มือการปรับแต่ง  

### การปรับตัวอย่างให้เหมาะกับกรณีใช้งานของคุณ  

1. **ตรวจสอบข้อกำหนดเบื้องต้น**  
   - ตรวจสอบความต้องการบริการของ Azure  
   - ตรวจสอบขีดจำกัดการสมัครใช้งาน  
   - ทำความเข้าใจผลกระทบค่าใช้จ่าย  

2. **แก้ไขการกำหนดค่า**  
   - อัปเดตการกำหนดค่าบริการใน `azure.yaml`  
   - ปรับแต่งเทมเพลต Bicep  
   - ปรับตัวแปรสภาพแวดล้อม  

3. **ทดสอบอย่างละเอียด**  
   - ปรับใช้ไปยังสภาพแวดล้อมพัฒนาก่อน  
   - ตรวจสอบความถูกต้องการทำงาน  
   - ทดสอบการปรับขนาดและประสิทธิภาพ  

4. **ตรวจสอบความปลอดภัย**  
   - ตรวจสอบการควบคุมการเข้าถึง  
   - ใช้งานการจัดการความลับ  
   - เปิดใช้งานการตรวจสอบและแจ้งเตือน  

## 📊 ตารางเปรียบเทียบ  

| ตัวอย่าง | บริการ | ฐานข้อมูล | การยืนยันตัวตน | การตรวจสอบ | ความซับซ้อน |  
|---------|----------|----------|------|------------|------------|  
| **Microsoft Foundry Models Chat** (ในเครื่อง) | 2 | ❌ | Key Vault | ครบถ้วน | ⭐⭐ |  
| **Python Flask API** (ในเครื่อง) | 1 | ❌ | พื้นฐาน | ครบถ้วน | ⭐ |  
| **Microservices** (ในเครื่อง) | 5+ | ✅ | องค์กร | ขั้นสูง | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | พื้นฐาน | พื้นฐาน | ⭐ |  
| React SPA + Functions | 3 | ✅ | พื้นฐาน | ครบถ้วน | ⭐ |  
| Python Flask Container | 2 | ❌ | พื้นฐาน | ครบถ้วน | ⭐ |  
| C# Web API + SQL | 2 | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐ |  
| Microsoft Foundry Models Chat | 3 | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | พื้นฐาน | ครบถ้วน | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | ครบถ้วน | ครบถ้วน | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (ในเครื่อง) | **8+** | **✅** | **องค์กร** | **ขั้นสูง** | **⭐⭐⭐⭐** |  

## 🎓 เส้นทางการเรียนรู้  

### ลำดับแนะนำ  

1. **เริ่มต้นด้วยเว็บแอปง่าย ๆ**  
   - เรียนรู้แนวคิด AZD พื้นฐาน  
   - ทำความเข้าใจกระบวนการปรับใช้  
   - ฝึกจัดการสภาพแวดล้อม  

2. **ลองเว็บไซต์สแตติก**  
   - สำรวจตัวเลือกการโฮสต์ต่าง ๆ  
   - เรียนรู้การผนวกรวม CDN  
   - เข้าใจการกำหนดค่า DNS  

3. **ไปยัง Container App**  
   - เรียนรู้พื้นฐานการบรรจุใน container  
   - เข้าใจแนวคิดการปรับสเกล  
   - ฝึกใช้งาน Docker  

4. **เพิ่มการผนวกรวมฐานข้อมูล**  
   - เรียนรู้การจัดเตรียมฐานข้อมูล  
   - ทำความเข้าใจสตริงการเชื่อมต่อ  
   - ฝึกจัดการความลับ  

5. **เรียนรู้ Serverless**  
   - เข้าใจสถาปัตยกรรม event-driven  
   - เรียนรู้เกี่ยวกับทริกเกอร์และไบด์ดิ้ง  
   - ฝึกกับ API  

6. **สร้างไมโครเซอร์วิส**  
   - เรียนรู้การสื่อสารบริการ  
   - เข้าใจระบบกระจาย  
   - ฝึกการปรับใช้ที่ซับซ้อน  

## 🔍 การค้นหาตัวอย่างที่เหมาะสม  

### ตามเทคโนโลยีสแตก  
- **Container Apps**: [Python Flask API (ในเครื่อง)](../../../examples/container-app/simple-flask-api), [Microservices (ในเครื่อง)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (ในเครื่อง)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (ในเครื่อง)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (ในเครื่อง)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (ในเครื่อง)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Microservices User Service (ในเครื่อง)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (ในเครื่อง)](../../../examples/container-app/simple-flask-api), [Microservices (ในเครื่อง)](../../../examples/container-app/microservices), Java Microservices  
- **ฐานข้อมูล**: [Microservices (ในเครื่อง)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (ในเครื่อง)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **ระบบตัวแทนหลายตัว**: **Retail Multi-Agent Solution**  
- **การผนวกรวม OpenAI**: **[Microsoft Foundry Models Chat (ในเครื่อง)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **การผลิตระดับองค์กร**: [Microservices (ในเครื่อง)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### ตามรูปแบบสถาปัตยกรรม  
- **REST API ง่าย ๆ**: [Python Flask API (ในเครื่อง)](../../../examples/container-app/simple-flask-api)  
- **โมโนลิธิค**: Node.js Express Todo, C# Web API + SQL  
- **สแตติก + Serverless**: React SPA + Functions, Python Functions + SPA  
- **ไมโครเซอร์วิส**: [Production Microservices (ในเครื่อง)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **ในรูปแบบ container**: [Python Flask (ในเครื่อง)](../../../examples/container-app/simple-flask-api), [Microservices (ในเครื่อง)](../../../examples/container-app/microservices)  
- **ขับเคลื่อนด้วย AI**: **[Microsoft Foundry Models Chat (ในเครื่อง)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **สถาปัตยกรรมตัวแทนหลายตัว**: **Retail Multi-Agent Solution**  
- **บริการหลายตัวระดับองค์กร**: [Microservices (ในเครื่อง)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### ตามระดับความซับซ้อน  
- **ผู้เริ่มต้น**: [Python Flask API (ในเครื่อง)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **ระดับกลาง**: **[Microsoft Foundry Models Chat (ในเครื่อง)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **ขั้นสูง**: ML Pipeline  
- **พร้อมใช้งานในระดับผลิตจริง**: [Microservices (ในเครื่อง)](../../../examples/container-app/microservices) (หลายบริการพร้อมคิวข้อความ), **Retail Multi-Agent Solution** (ระบบตัวแทนหลายตัวครบถ้วนพร้อม ARM template)  

## 📚 แหล่งข้อมูลเพิ่มเติม  

### ลิงก์เอกสาร  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [เอกสาร Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [ศูนย์สถาปัตยกรรม Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### ตัวอย่างชุมชน  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [คลัง Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Todo App ด้วย C# และ Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App ด้วย Python และ MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App ด้วย Node.js และ PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App กับ C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions กับ Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### แนวทางปฏิบัติที่ดีที่สุด
- [กรอบงานสถาปัตยกรรมที่ดีของ Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [กรอบการนำคลาวด์ไปใช้](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 การมีส่วนร่วมในการแบ่งปันตัวอย่าง

มีตัวอย่างที่เป็นประโยชน์อยากแบ่งปันไหม? เรายินดีต้อนรับการมีส่วนร่วม!

### แนวทางการส่งผลงาน
1. ปฏิบัติตามโครงสร้างไดเรกทอรีที่กำหนดไว้
2. ใส่ไฟล์ README.md ที่ครอบคลุมครบถ้วน
3. เพิ่มความคิดเห็นในไฟล์กำหนดค่า
4. ทดสอบอย่างละเอียดก่อนส่ง
5. รวมประมาณการค่าใช้จ่ายและข้อกำหนดเบื้องต้น

### โครงสร้างแม่แบบตัวอย่าง
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**เคล็ดลับมือโปร**: เริ่มจากตัวอย่างที่ง่ายที่สุดที่ตรงกับเทคโนโลยีของคุณ แล้วค่อยๆ พัฒนาไปยังสถานการณ์ที่ซับซ้อนขึ้น ตัวอย่างแต่ละตัวจะสร้างบนแนวคิดจากตัวอย่างก่อนหน้านี้!

## 🚀 พร้อมเริ่มต้นหรือยัง?

### เส้นทางการเรียนรู้ของคุณ

1. **ผู้เริ่มต้นโดยสมบูรณ์?** → เริ่มที่ [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 นาที)
2. **มีความรู้พื้นฐานเกี่ยวกับ AZD?** → ลอง [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 นาที)
3. **กำลังสร้างแอป AI?** → เริ่มที่ [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 นาที) หรือสำรวจ [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, มากกว่า 2 ชั่วโมง)
4. **ต้องการเทคโนโลยีเฉพาะ?** → ใช้ส่วน [การค้นหาตัวอย่างที่เหมาะสม](#-finding-the-right-example) ด้านบน

### ขั้นตอนถัดไป

- ✅ ตรวจสอบ [ข้อกำหนดเบื้องต้น](#ข้อกำหนดเบื้องต้น) ด้านบน
- ✅ เลือกตัวอย่างที่เหมาะกับระดับทักษะของคุณ (ดู [ตำนานความซับซ้อน](#คำอธิบายระดับความซับซ้อน))
- ✅ อ่าน README ของตัวอย่างอย่างละเอียดก่อนการติดตั้ง
- ✅ ตั้งค่าการเตือนให้รันคำสั่ง `azd down` หลังทดสอบเสร็จ
- ✅ แชร์ประสบการณ์ของคุณผ่าน GitHub Issues หรือ Discussions

### ต้องการความช่วยเหลือ?

- 📖 [คำถามที่พบบ่อย](../resources/faq.md) - ตอบคำถามทั่วไป
- 🐛 [คู่มือการแก้ไขปัญหา](../docs/chapter-07-troubleshooting/common-issues.md) - แก้ไขปัญหาการติดตั้ง
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - ถามชุมชน
- 📚 [คู่มือการศึกษา](../resources/study-guide.md) - เสริมสร้างการเรียนรู้ของคุณ

---

**การนำทาง**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../README.md)
- **📖 วัสดุการศึกษา**: [คู่มือการศึกษา](../resources/study-guide.md) | [แผ่นโกง](../resources/cheat-sheet.md) | [พจนานุกรมศัพท์](../resources/glossary.md)
- **🔧 แหล่งข้อมูล**: [คำถามที่พบบ่อย](../resources/faq.md) | [แก้ไขปัญหา](../docs/chapter-07-troubleshooting/common-issues.md)

---

*ปรับปรุงล่าสุด: พฤศจิกายน 2025 | [รายงานปัญหา](https://github.com/microsoft/AZD-for-beginners/issues) | [ร่วมแบ่งปันตัวอย่าง](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->